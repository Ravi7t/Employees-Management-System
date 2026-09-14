using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
namespace Assignment1_Assignment2
{
    public partial class AdminJobs : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadJobs();
            }
        }
        private void LoadJobs()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = @"SELECT 
                                JobId,
                                JobTitle,
                                CompanyName,
                                Location,
                                Category,
                                Salary,
                                Status
                             FROM Jobs
                             ORDER BY JobId DESC";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        con.Open();

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            litJobs.Text = "";

                            int count = 0;

                            while (dr.Read())
                            {
                                count++;

                                string status = Convert.ToString(dr["Status"]);

                                string statusText = status == "1"
                                    ? "Active"
                                    : "Inactive";

                                string statusClass = status == "1"
                                    ? "status-active"
                                    : "status-inactive";

                                litJobs.Text +=
                                    "<tr>" +

                                    "<td>" + count + "</td>" +

                                    "<td>" + Server.HtmlEncode(Convert.ToString(dr["JobTitle"])) + "</td>" +

                                    "<td>" + Server.HtmlEncode(Convert.ToString(dr["CompanyName"])) + "</td>" +

                                    "<td>" + Server.HtmlEncode(Convert.ToString(dr["Location"])) + "</td>" +

                                    "<td>" + Server.HtmlEncode(Convert.ToString(dr["Category"])) + "</td>" +

                                    "<td>" + Server.HtmlEncode(Convert.ToString(dr["Salary"])) + "</td>" +

                                    "<td class='" + statusClass + "'>" +
                                    statusText +
                                    "</td>" +

                                    "<td>" +

                                    "<a href='AdminJobs.aspx?EditId=" + dr["JobId"] +
                                    "' class='btn btn-sm btn-primary me-1'>" +
                                    "<i class='bi bi-pencil-square'></i> Edit" +
                                    "</a>" +

                                    "<a href='AdminJobs.aspx?DeleteId=" + dr["JobId"] +
                                    "' class='btn btn-sm btn-danger' " +
                                    "onclick=\"return confirm('Are you sure you want to delete this job?');\">" +
                                    "<i class='bi bi-trash'></i> Delete" +
                                    "</a>" +

                                    "</td>" +

                                    "</tr>";
                            }

                            if (count == 0)
                            {
                                litJobs.Text =
                                    "<tr>" +
                                    "<td colspan='8' class='text-center text-muted py-4'>" +
                                    "No jobs available.<br/>" +
                                    "Add your first job using the form above." +
                                    "</td>" +
                                    "</tr>";
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " +
                               ex.Message.Replace("'", "") +
                               "');</script>");
            }
        }

        protected void btnSavejobs_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = @"INSERT INTO Jobs
                                    (
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
                                        Status
                                    )
                                    VALUES
                                    (
                                        @JobTitle,
                                        @CompanyName,
                                        @Location,
                                        @Category,
                                        @JobType,
                                        @Experience,
                                        @Salary,
                                        @Skills,
                                        @JobDescription,
                                        @Requirements,
                                        @Status
                                    )";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@JobTitle", txtJobTitle.Value);
                        cmd.Parameters.AddWithValue("@CompanyName", txtCompany.Value);
                        cmd.Parameters.AddWithValue("@Location", txtLocation.Value);
                        cmd.Parameters.AddWithValue("@Category", ddlCategory.Value);
                        cmd.Parameters.AddWithValue("@JobType", ddlJobType.Value);
                        cmd.Parameters.AddWithValue("@Experience", txtExperience.Value);
                        cmd.Parameters.AddWithValue("@Salary", txtSalary.Value);
                        cmd.Parameters.AddWithValue("@Skills", txtSkills.Value);
                        cmd.Parameters.AddWithValue("@JobDescription", txtDescription.Value);
                        cmd.Parameters.AddWithValue("@Requirements", txtRequirements.Value);
                        cmd.Parameters.AddWithValue("@Status", ddlStatus.Value);

                        con.Open();

                        cmd.ExecuteNonQuery();
                    }
                }

                Response.Write("<script>alert('Job saved successfully!');</script>");

                ClearForm();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message.Replace("'", "") + "');</script>");
            }
        }

        private void ClearForm()
        {
            txtJobTitle.Value = "";
            txtCompany.Value = "";
            txtLocation.Value = "";

            ddlCategory.SelectedIndex = 0;
            ddlJobType.SelectedIndex = 0;

            txtExperience.Value = "";
            txtSalary.Value = "";
            txtSkills.Value = "";
            txtDescription.Value = "";
            txtRequirements.Value = "";

            ddlStatus.Value = "1";
        }
    }
}
    
