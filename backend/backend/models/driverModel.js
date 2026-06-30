const pool = require("../config/db");

const createDriver = async (name, phone, password) => {
  const result = await pool.query(
    `INSERT INTO drivers (name, phone, password)
     VALUES ($1, $2, $3)
     RETURNING id, name, phone`,
    [name, phone, password]
  );
  return result.rows[0];
};

const findDriverByPhone = async (phone) => {
  const result = await pool.query(
    "SELECT * FROM drivers WHERE phone = $1",
    [phone]
  );
  return result.rows[0];
};



const updateDriverDetails = async (
  driver_id,
  birth_date,
  batch_no,
  gender,
  is_terms_accepted
) => {
  await pool.query(
    `UPDATE drivers 
     SET birth_date=$1,
         batch_no=$2,
         gender=$3,
         is_terms_accepted=$4
     WHERE id=$5`,
    [birth_date, batch_no, gender, is_terms_accepted, driver_id]
  );
};


module.exports = {
  createDriver,
  findDriverByPhone,
  updateDriverDetails,
};