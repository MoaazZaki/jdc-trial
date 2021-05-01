const nodemailer = require('nodemailer');
const nodemailerSendgrid = require('nodemailer-sendgrid');

const sendEmail = async options => {

// 1) Create a transporter
const transporter = nodemailer.createTransport(
    nodemailerSendgrid({
        apiKey: process.env.EMAIL_PASSWORD
    })
);

// 2) Define the email options
const mailOptions = {
from: `<${process.env.EMAIL_SENDER}>`,
to: options.email,
subject: options.subject,
html: options.message.html
}; // TODO: EDIT href in a tag to the link that user will reset the password at

// 3) Actually send the email
await transporter.sendMail(mailOptions);
};

module.exports = sendEmail;