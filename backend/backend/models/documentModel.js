const pool = require("../config/db");

const saveDocuments = async (data) => {
  const {
    driver_id,
    license_front,
    license_back,
    rickshaw_photo1,
    rickshaw_photo2,
    rickshaw_photo3,
    rickshaw_photo4,
    selfie,
  } = data;

  const result = await pool.query(
    `INSERT INTO driver_documents 
    (driver_id, license_front, license_back, rickshaw_photo1, rickshaw_photo2, rickshaw_photo3,rickshaw_photo4, selfie)
    VALUES ($1,$2,$3,$4,$5,$6,$7,$8)
    RETURNING *`,
    [
      driver_id,
      license_front,
      license_back,
      rickshaw_photo1,
      rickshaw_photo2,
      rickshaw_photo3,
      rickshaw_photo4,
      selfie,
    ]
  );

  return result.rows[0];
};

module.exports = { saveDocuments };