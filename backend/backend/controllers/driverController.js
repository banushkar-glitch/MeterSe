const driverModel = require("../models/driverModel");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");

// 📌 Register Driver
exports.registerDriver = async (req, res) => {
  try {
    const { name, phone, password } = req.body;

    if (!name || !phone || !password) {
      return res.status(400).json({
        message: "All fields are required",
      });
    }

    const existing = await driverModel.findDriverByPhone(phone);

    if (existing) {
      return res.status(400).json({
        message: "Phone number already exists",
      });
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    const driver = await driverModel.createDriver(
      name,
      phone,
      hashedPassword
    );

    res.json({
      success: true,
      message: "Driver registered successfully",
      data: driver,
    });

  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};





exports.loginDriver = async (req, res) => {
  try {
    const { phone, password } = req.body;

    const driver = await driverModel.findDriverByPhone(phone);

    if (!driver) {
      return res.status(400).json({ message: "Driver not found" });
    }

    const isMatch = await bcrypt.compare(password, driver.password);

    if (!isMatch) {
      return res.status(400).json({ message: "Invalid password" });
    }

    // 🔐 Create token
    const token = jwt.sign(
      { id: driver.id },
      process.env.JWT_SECRET,
      { expiresIn: "1d" }
    );

    res.json({
      success: true,
      message: "Login successful",
      token,   // ✅ send token
      data: {
        id: driver.id,
        name: driver.name,
        phone: driver.phone,
      },
    });

  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};


exports.updateDriverDetails = async (req, res) => {
  try {
    const driver_id = req.driver.id; // 🔐 from JWT

    const { birth_date, batch_no, gender, is_terms_accepted } = req.body;

    if (!birth_date || !gender || !is_terms_accepted) {
      return res.status(400).json({
        message: "Required fields missing",
      });
    }

    await driverModel.updateDriverDetails(
      driver_id,
      birth_date,
      batch_no,
      gender,
      is_terms_accepted
    );

    res.json({
      success: true,
      message: "Details updated successfully",
    });

  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};