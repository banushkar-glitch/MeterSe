require("dotenv").config();

const express = require("express");
const cors = require("cors");

const app = express();

app.use(cors());
app.use(express.json());

// Routes
app.use("/api/driver", require("./routes/driverRoutes"));

app.use("/api/documents", require("./routes/documentRoutes"));

// serve static images
app.use("/uploads", express.static("uploads"));

app.use("/api/subscription", require("./routes/subscriptionRoutes"));

app.get("/", (req, res) => {
  res.send("API Running...");
});

const PORT = process.env.PORT || 5000;

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Server running on port ${PORT}`);
});