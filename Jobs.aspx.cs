using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Assignment1_Assignment2
{
    public partial class Jobs : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string job = Request.QueryString["job"] ?? "";
                string location = Request.QueryString["location"] ?? "";
                string Company = Request.QueryString["Company"] ?? "";


                LoadJobs(job, location,"",Company);



            }

        }
        private void LoadJobs(string job = "", string location = "", string category = "", string company = "")
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"
            SELECT
                JobId,
                JobTitle,
                CompanyName,
                Location,
                Category,
                JobType,
                Experience,
                Salary,
                Skills,
                JobDescription,
                Requirements,
                Status,
                CreatedDate
            FROM Jobs
            WHERE Status = 1
              AND (
                @Company = ''
                OR CompanyName = @Company
            )



            AND (
                @Job = ''
                OR JobTitle LIKE '%' + @Job + '%'
                OR Skills LIKE '%' + @Job + '%'
                OR CompanyName LIKE '%' + @Job + '%'
                OR Category LIKE '%' + @Job + '%'
            )

            AND (
                @Location = ''
                OR Location LIKE '%' + @Location + '%'
            )

            AND (
                @Category = ''
                OR Category = @Category
            )

            ORDER BY CreatedDate DESC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.Add("@Job", SqlDbType.NVarChar, 200).Value = job ?? "";
                    cmd.Parameters.Add("@Location", SqlDbType.NVarChar, 200).Value = location ?? "";
                    cmd.Parameters.Add("@Category", SqlDbType.NVarChar, 100).Value = category ?? "";
                    cmd.Parameters.Add("@Company", SqlDbType.NVarChar, 200).Value = company ?? "";


                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();

                        da.Fill(dt);

                        rptJobs.DataSource = dt;
                        rptJobs.DataBind();
                    }
                }
            }
        }
        protected void btnJobSearch_Click(object sender, EventArgs e)
        {
            string job = txtJobSearch.Text.Trim();
            string location = txtLocation.Text.Trim();
            string category = ddlCategory.SelectedValue;

            LoadJobs(job, location, category);

        }
    }
}