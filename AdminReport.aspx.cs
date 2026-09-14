using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace Assignment1_Assignment2
{
    public partial class AdminReport : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminId"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }

            if (!IsPostBack)
            {
                LoadReport();
            }
        }
        public void LoadReport()
        {
            // Dashboard Counts
            SqlCommand cmd = new SqlCommand("DashboardCount", con);
            cmd.CommandType = CommandType.StoredProcedure;

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblTotal.Text = "Total Users : " + dr["TotalUsers"].ToString();
                lblMale.Text = "Male : " + dr["MaleUsers"].ToString();
                lblFemale.Text = "Female : " + dr["FemaleUsers"].ToString();
                lblQualification.Text = "Qualification : " + dr["TotalQualification"].ToString();
            }

            dr.Close();
            con.Close();

            // User List
            SqlDataAdapter da = new SqlDataAdapter("GetAllUsersAdmin", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;

            DataTable dt = new DataTable();

            da.Fill(dt);

            gvReport.DataSource = dt;
            gvReport.DataBind();
        }
    }
}
    
