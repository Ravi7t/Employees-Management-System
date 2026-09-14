using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
namespace Assignment1_Assignment2
{
    public partial class Emp : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string job = txtJobSearch.Text.Trim();
            string location = txtLocation.Text.Trim();

            Response.Redirect(
                "Jobs.aspx?job=" + Server.UrlEncode(job) +
                "&location=" + Server.UrlEncode(location)
            );
        }
    }
}