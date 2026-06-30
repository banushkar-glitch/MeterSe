const documentModel = require("../models/documentModel");
exports.uploadDocuments = async (req, res) => {
  try {
    const driver_id = req.driver.id; // ✅ from token

    const files = req.files;

    const data = {
      driver_id,
      license_front: files["license_front"]?.[0]?.filename || null,
      license_back: files["license_back"]?.[0]?.filename || null,
      rickshaw_photo1: files["rickshaw"]?.[0]?.filename || null,
      rickshaw_photo2: files["rickshaw"]?.[1]?.filename || null,
      rickshaw_photo3: files["rickshaw"]?.[2]?.filename || null,
      rickshaw_photo4: files["rickshaw"]?.[3]?.filename || null,

      selfie: files["selfie"]?.[0]?.filename || null,
    };

    const result = await documentModel.saveDocuments(data);

    res.json({
      success: true,
      message: "Documents uploaded successfully",
      data: result,
    });

  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};