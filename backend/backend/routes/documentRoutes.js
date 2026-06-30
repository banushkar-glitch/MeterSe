const express = require("express");
const router = express.Router();

const upload = require("../config/multer");
const { uploadDocuments } = require("../controllers/documentController");
const auth = require("../middleware/auth");

router.post(
  "/upload",
  auth,
  upload.fields([
    { name: "license_front", maxCount: 1 },
    { name: "license_back", maxCount: 1 },
    { name: "rickshaw", maxCount: 4 },
    { name: "selfie", maxCount: 1 },
  ]),
  uploadDocuments
);

module.exports = router;