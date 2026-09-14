using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Assignment1_Assignment2
{
    public partial class Companies : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCompanies();
            }

        }
        private void LoadCompanies()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"
                    SELECT
                        CompanyName,
                        MAX(Location) AS Location,
                        MAX(Category) AS Category
                    FROM Jobs
                    WHERE Status = 1
                    GROUP BY CompanyName
                    ORDER BY CompanyName";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();

                        da.Fill(dt);

                        rptCompanies.DataSource = dt;
                        rptCompanies.DataBind();
                    }
                }
            }
        }
    }
}
    
