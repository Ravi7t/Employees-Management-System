using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.Services;
using System.Web;

namespace Assignment1_Assignment2
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod(EnableSession =true)]
        public static string UserLogin(string Email, string Password)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

            SqlCommand cmd = new SqlCommand("Loginn", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Email", Email);
            cmd.Parameters.AddWithValue("@Password", Password);

            con.Open();

            object result = cmd.ExecuteScalar();

            if (result != null)
            {
                HttpContext.Current.Session["RegistrationId"] = result.ToString();

                con.Close();
                return "Success";
            }

            con.Close();
            return "Failed";
        }
    }
}