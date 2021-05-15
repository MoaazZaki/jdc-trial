const express = require("express");
const cors = require("cors");
const dotenv = require('dotenv');
const sendEmail = require("./emailSender");

dotenv.config({ path: './.env' });

const PORT = process.env.PORT || 3001;

const app = express();

app.use(
  cors(
    //{
    //credentials: true
    //origin:[]
  //}
  )
);
app.options('*', cors());

app.get("/", (req, res) => {
  res.json({ message: "FINAL JDC-TRIAL COMMIT !!" });
});

app.get("/forget", async(req, res) => {
  const trialMail = "moaazzaki1999@gmail.com"; //Edit to test
  try {
    await sendEmail(
      {
        email: trialMail,
        subject: "Flickr – Reset your password",
        message: {
          html: `<p>To reset the password on your account, simply use the link below and follow the steps.</p>
          <a href="https://www.google.com">Reset your password</a>
          <p>If you did not request a password reset, please disregard this email. Nothing will change to your account.</p>
          <p>The Flickr team.</p>`
        }
      }
    )
    res.json({ message: "Sent successfully!!" });
  } catch (error) {
    res.json({ message: error.message });
  }
  
});

app.listen(PORT, () => {
  console.log(`Server listening on ${PORT}`);
});
