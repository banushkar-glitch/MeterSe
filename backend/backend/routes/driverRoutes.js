const express = require("express");
const router = express.Router();
const auth = require("../middleware/auth");

const {
  registerDriver,
  loginDriver,
  updateDriverDetails,
} = require("../controllers/driverController");

router.post("/register", registerDriver);
router.post("/login", loginDriver);
router.post("/update-details", auth, updateDriverDetails);

module.exports = router;