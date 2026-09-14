using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
namespace Assignment1_Assignment2
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public static string GenerateOTP()
        {
            Random rnd = new Random();
            return rnd.Next(100000, 999999).ToString();

        }
        [WebMethod(EnableSession = true)]
        public static string CheckEmail(string Email)
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

            SqlCommand cmd = new SqlCommand("Sp_CheckEmail", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Email", Email);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();


            if (dr.Read())
            {
                string otp = GenerateOTP();


                HttpContext.Current.Session["OTP"] = otp;

                bool result = SendEmailOTP(Email, otp);

                if (result)
                {
                    SaveOpt(Email, otp);
                }
                return "Success";
            }

            dr.Close();
            con.Close();
            return "Success";
        }
    
        public static bool SendEmailOTP(string toEmail, string otp)
        {
            try
            {
                MailMessage mail = new MailMessage();

                mail.From = new MailAddress("raviranjan867@gmail.com");
                mail.To.Add(toEmail);
                mail.Subject = "Your OTP Verification Code";

                mail.Body = $"Your OTP is: <b>{otp}</b><br/><br/>Do not share it with anyone.";
                mail.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;

                smtp.Credentials = new NetworkCredential(
                    "raviranjan867@gmail.com",
                    "zpjv ldrn frdc hbdu");
                smtp.Send(mail);

                return true;
            }

            catch (Exception ex)
            {
                throw;
            }
        }
        [WebMethod]
        public static void SaveOpt(string email, string otp)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

            SqlCommand cmd = new SqlCommand("sp_SaveOTP", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@OTP", otp);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        [WebMethod(EnableSession = true)]
        public static string VerifyOTP(string Email, string OTP)
        {
            if (HttpContext.Current.Session["OTP"] == null)
            {
                return "Expired";
            }

            string sessionOTP = HttpContext.Current.Session["OTP"].ToString();

            if (sessionOTP == OTP)
            {
                HttpContext.Current.Session["VerifiedEmail"] = Email;
                return "Success";
            }

            return "Invalid";
        }
    }
}