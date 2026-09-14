using System;
using System.Web.Services;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace Assignment1_Assignment2
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
            if (Session["AdminId"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
                
            }

           
            if (!IsPostBack)
            {
                if (!HasPermission("View DashBoard"))
                {
                    Response.Redirect("AccessDenied.aspx");
                    return;
                }
                LoadDashboard();
            }
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("AdminLogin.aspx");
        }
        [WebMethod]
        public static string GetGenderChart()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

            SqlCommand cmd = new SqlCommand(
                "SELECT Gendername, COUNT(*) Total " +
                "FROM tblRegistrations t " +
                "INNER JOIN Gender g ON t.Gender=g.Genderid " +
                "GROUP BY Gendername", con);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            string male = "0";
            string female = "0";

            while (dr.Read())
            {
                if (dr["Gendername"].ToString() == "Male")
                    male = dr["Total"].ToString();

                if (dr["Gendername"].ToString() == "Female")
                    female = dr["Total"].ToString();
            }

            dr.Close();
            con.Close();

            return male + "," + female;
        }
        [WebMethod]
        public static string GetQualificationChart()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

            SqlCommand cmd = new SqlCommand(@"
        SELECT Qualification, COUNT(*) AS Total
        FROM RegistrationQualification
        GROUP BY Qualification", con);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            string result = "";

            while (dr.Read())
            {
                result += dr["Qualification"].ToString() + ":" + dr["Total"].ToString() + ",";
            }

            dr.Close();
            con.Close();

            return result.TrimEnd(',');
        }
        private bool HasPermission(string permissionName)
        {
            if (Session["RoleId"] == null)
                return false;

            int roleId = Convert.ToInt32(Session["RoleId"]);

            SqlCommand cmd = new SqlCommand(@"
        SELECT COUNT(*)
        FROM RolePermissions RP
        INNER JOIN Permissions P
            ON RP.PermissionId = P.PermissionId
        WHERE RP.RoleId = @RoleId
          AND P.PermissionName = @PermissionName", con);

            cmd.Parameters.AddWithValue("@RoleId", roleId);
            cmd.Parameters.AddWithValue("@PermissionName", permissionName);

            con.Open();

            int count = Convert.ToInt32(cmd.ExecuteScalar());

            con.Close();

            return count > 0;
        }
        public void LoadDashboard()
        {
            SqlCommand cmd = new SqlCommand("DashboardCount", con);
            cmd.CommandType = CommandType.StoredProcedure;

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblUsers.InnerText = dr["TotalUsers"].ToString();
                lblMale.InnerText = dr["MaleUsers"].ToString();
                lblFemale.InnerText = dr["FemaleUsers"].ToString();
                lblQualification.InnerText = dr["TotalQualification"].ToString();
            }

            dr.Close();
            con.Close();
        }
    }
}
    
