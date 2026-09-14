using System;
using System.IO;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web.Services;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace Assignment1_Assignment2
{
    public partial class AdminUsers : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminId"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }
            
            if(!HasPermission("View Users"))
            {
                Response.Redirect("AccessDenied.aspx");
                return;
            }

            if (!IsPostBack)
            {
                ShowUsers();
            }
        }
        [WebMethod]
        public static string GetAdminUsers(int pageNumber, int pageSize)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

            SqlCommand cmd = new SqlCommand("GetAllUsersAdminPaging", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@PageNumber", pageNumber);
            cmd.Parameters.AddWithValue("@PageSize", pageSize);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            StringBuilder sb = new StringBuilder();

            while (dr.Read())
            {
                sb.Append("<tr>");

                sb.Append("<td>" + dr["RegistrationId"] + "</td>");
                sb.Append("<td>" + dr["Name"] + "</td>");
                sb.Append("<td>" + dr["Email"] + "</td>");
                sb.Append("<td>" + dr["MobileNo"] + "</td>");
                sb.Append("<td>" + dr["Gender"] + "</td>");
                sb.Append("<td>" + dr["Religion"] + "</td>");
                sb.Append("<td>" + dr["Hobbies"] + "</td>");
                sb.Append("<td>" + dr["Qualification"] + "</td>");

                sb.Append("<td><a href='AdminEditUser.aspx?id=" + dr["RegistrationId"] + "' class='btn btn-warning btn-sm'>Edit</a></td>");
                if (Convert.ToBoolean(dr["Status"]))
                {
                    sb.Append("<td><button class='btn btn-success btnStatus' data-id='" + dr["RegistrationId"] + "' data-status='1'>Active</button></td>");
                }
                else
                {
                    sb.Append("<td><button class='btn btn-secondary btnStatus' data-id='" + dr["RegistrationId"] + "' data-status='0'>Inactive</button></td>");
                }

                sb.Append("<td><button class='btn btn-danger btn-sm btnDelete' data-id='" + dr["RegistrationId"] + "'>Delete</button></td>");

                sb.Append("</tr>");
            }

            dr.Close();
            con.Close();

            return sb.ToString();
        }
        [WebMethod]
        public static string SearchUsers(string search)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

            SqlCommand cmd = new SqlCommand("SearchUsersAdmin", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Search", search);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            StringBuilder sb = new StringBuilder();

            while (dr.Read())
            {
                sb.Append("<tr>");

                sb.Append("<td>" + dr["RegistrationId"] + "</td>");
                sb.Append("<td>" + dr["Name"] + "</td>");
                sb.Append("<td>" + dr["Email"] + "</td>");
                sb.Append("<td>" + dr["MobileNo"] + "</td>");
                sb.Append("<td>" + dr["Gender"] + "</td>");
                sb.Append("<td>" + dr["Religion"] + "</td>");
                sb.Append("<td>" + dr["Hobbies"] + "</td>");
                sb.Append("<td>" + dr["Qualification"] + "</td>");

                sb.Append("<td><a href='AdminEditUser.aspx?id=" + dr["RegistrationId"] + "' class='btn btn-warning btn-sm'>Edit</a></td>");
                if (Convert.ToBoolean(dr["Status"]))
                {
                    sb.Append("<td><button class='btn btn-success btnStatus' data-id='" + dr["RegistrationId"] + "' data-status='1'>Active</button></td>");
                }
                else
                {
                    sb.Append("<td><button class='btn btn-secondary btnStatus' data-id='" + dr["RegistrationId"] + "' data-status='0'>Inactive</button></td>");
                }


                sb.Append("<td><button class='btn btn-danger btn-sm btnDelete' data-id='" + dr["RegistrationId"] + "'>Delete</button></td>");

                sb.Append("</tr>");
            }

            dr.Close();
            con.Close();

            return sb.ToString();
        }
        [WebMethod(EnableSession = true)]
        public static string DeleteUser(int RegistrationId)
        {
            if (HttpContext.Current.Session["RoleId"] == null)
                return "AccessDenied";

            int roleId = Convert.ToInt32(HttpContext.Current.Session["RoleId"]);

            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                SqlCommand permissionCmd = new SqlCommand(@"
            SELECT COUNT(*)
            FROM RolePermissions RP
            INNER JOIN Permissions P
                ON RP.PermissionId = P.PermissionId
            WHERE RP.RoleId = @RoleId
              AND P.PermissionName = 'Delete Users'", con);

                permissionCmd.Parameters.AddWithValue("@RoleId", roleId);

                con.Open();

                int permission = Convert.ToInt32(permissionCmd.ExecuteScalar());

                if (permission == 0)
                {
                    con.Close();
                    return "AccessDenied";
                }

                SqlCommand cmd = new SqlCommand("DeleteUser", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@RegistrationId", RegistrationId);

                cmd.ExecuteNonQuery();

                con.Close();
            }

            return "Success";
        }
        [WebMethod]
        public static string ChangeUserStatus(int RegistrationId)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

            SqlCommand cmd = new SqlCommand("ChangeUserStatus", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@RegistrationId", RegistrationId);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            return "Success";
        }
        [WebMethod]
        public static int GetTotalUsersCount()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

            SqlCommand cmd = new SqlCommand("GetTotalUsersCount", con);
            cmd.CommandType = CommandType.StoredProcedure;

            con.Open();

            int total = Convert.ToInt32(cmd.ExecuteScalar());

            con.Close();

            return total;
        }
        private bool HasPermission(string permissionName)
        {
            if (Session["RoleId"] == null)
                return false;

            int roleId = Convert.ToInt32(Session["RoleId"]);

            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
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

                return Convert.ToInt32(cmd.ExecuteScalar()) > 0;
            }
        }
        public void ShowUsers()
        {
            SqlCommand cmd = new SqlCommand("GetAllUsersAdminPaging", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PageNumber", 1);
            cmd.Parameters.AddWithValue("@PageSize", 10);


            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            StringBuilder sb = new StringBuilder();

            while (dr.Read())
            {
                sb.Append("<tr>");

                sb.Append("<td>" + dr["RegistrationId"] + "</td>");
                sb.Append("<td>" + dr["Name"] + "</td>");
                sb.Append("<td>" + dr["Email"] + "</td>");
                sb.Append("<td>" + dr["MobileNo"] + "</td>");
                sb.Append("<td>" + dr["Gender"] + "</td>");
                sb.Append("<td>" + dr["Religion"] + "</td>");
                sb.Append("<td>" + dr["Hobbies"] + "</td>");
                sb.Append("<td>" + dr["Qualification"] + "</td>");


                sb.Append("<td><a href='AdminEditUser.aspx?id=" + dr["RegistrationId"] + "' class='btn btn-warning btn-sm'>Edit</a></td>");
                if (Convert.ToBoolean(dr["Status"]))
                {
                    sb.Append("<td><button class='btn btn-success btnStatus' data-id='" + dr["RegistrationId"] + "' data-status='1'>Active</button></td>");
                }
                else
                {
                    sb.Append("<td><button class='btn btn-secondary btnStatus' data-id='" + dr["RegistrationId"] + "' data-status='0'>Inactive</button></td>");
                }
                sb.Append("<td><button class='btn btn-danger btn-sm btnDelete' data-id='" + dr["RegistrationId"] + "'>Delete</button></td>");

                sb.Append("</tr>");
            }

            tblBody.InnerHtml = sb.ToString();

            dr.Close();
            con.Close();
        }

        

        protected void btnExport_Click1(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("GetAllUsersAdmin", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            da.Fill(dt);

            GridView gv = new GridView();

            gv.DataSource = dt;
            gv.DataBind();

            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=Users.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";

            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            gv.RenderControl(hw);

            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();

        }
    }
    
}


