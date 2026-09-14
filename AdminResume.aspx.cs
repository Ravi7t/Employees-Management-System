using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Assignment1_Assignment2
{
    public partial class AdminResume : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

            SqlCommand cmd = new SqlCommand("SaveResume", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@FullName", txtName.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text);
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@Objective", txtObjective.Text);
            cmd.Parameters.AddWithValue("@Skills", txtSkills.Text);
            cmd.Parameters.AddWithValue("@Education", txtEducation.Text);
            cmd.Parameters.AddWithValue("@Experience", txtExperience.Text);
            cmd.Parameters.AddWithValue("@Projects", txtProjects.Text);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            ClientScript.RegisterStartupScript(this.GetType(), "msg", "alert('Resume Saved Successfully');", true);
        }

    }
}