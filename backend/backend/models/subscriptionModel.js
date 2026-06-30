const pool = require("../config/db");

// Get all plans
const getPlans = async () => {
  const result = await pool.query("SELECT * FROM plans ORDER BY price ASC");
  return result.rows;
};

// Create subscription
const createSubscription = async (driver_id, plan) => {
  const start = new Date();
  const end = new Date(start.getTime() + plan.duration_hours * 60 * 60 * 1000);

  const result = await pool.query(
    `INSERT INTO driver_subscriptions 
     (driver_id, plan_id, start_time, end_time)
     VALUES ($1, $2, $3, $4)
     RETURNING *`,
    [driver_id, plan.id, start, end]
  );

  return result.rows[0];
};

module.exports = {
  getPlans,
  createSubscription,
};