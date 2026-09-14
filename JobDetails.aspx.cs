using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Assignment1_Assignment2
{
    public partial class JobDetails : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadJobDetails();
            }
        }
        private void LoadJobDetails()
        {
            if (Request.QueryString["JobId"] == null)
            {
                Response.Redirect("Jobs.aspx");
                return;
            }

            int jobId;

            if (!int.TryParse(Request.QueryString["JobId"], out jobId))
            {
                Response.Redirect("Jobs.aspx");
                return;
            }

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT
                                    JobTitle,
                                    CompanyName,
                                    Location,
                                    JobType,
                                    Experience,
                                    Salary,
                                    Skills,
                                    JobDescription,
                                    Requirements,
                                    CreatedDate
                                 FROM Jobs
                                 WHERE JobId = @JobId
                                 AND Status = 1";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@JobId", jobId);

                    con.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            lblJobTitle.Text = Convert.ToString(dr["JobTitle"]);
                            lblCompanyName.Text = Convert.ToString(dr["CompanyName"]);
                            lblLocation.Text = Convert.ToString(dr["Location"]);
                            lblExperience.Text = Convert.ToString(dr["Experience"]);
                            lblSalary.Text = Convert.ToString(dr["Salary"]);
                            lblJobType.Text = Convert.ToString(dr["JobType"]);
                            lblDescription.Text = Convert.ToString(dr["JobDescription"]);
                            lblRequirements.Text = Convert.ToString(dr["Requirements"]);
                        }
                        else
                        {
                            Response.Redirect("Jobs.aspx");
                        }
                    }
                }
            }
        }
    }
}