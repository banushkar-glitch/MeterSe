const express = require("express");
const router = express.Router();

const auth = require("../middleware/auth");

const {
  getPlans,
  subscribePlan,
} = require("../controllers/subscriptionController");

router.get("/plans", getPlans);
router.post("/subscribe", auth, subscribePlan);

module.exports = router;