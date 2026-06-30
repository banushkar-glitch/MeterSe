const subscriptionModel = require("../models/subscriptionModel");
const pool = require("../config/db");

// Get plans
exports.getPlans = async (req, res) => {
  try {
    const plans = await subscriptionModel.getPlans();

    res.json({
      success: true,
      data: plans,
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Subscribe
exports.subscribePlan = async (req, res) => {
  try {
    const driver_id = req.driver.id; // 🔐 from JWT
    const { plan_id } = req.body;

    // Get plan
    const result = await pool.query("SELECT * FROM plans WHERE id=$1", [plan_id]);
    const plan = result.rows[0];

    if (!plan) {
      return res.status(400).json({ message: "Plan not found" });
    }

    const subscription = await subscriptionModel.createSubscription(
      driver_id,
      plan
    );

    res.json({
      success: true,
      message: "Subscription activated",
      data: subscription,
    });

  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};