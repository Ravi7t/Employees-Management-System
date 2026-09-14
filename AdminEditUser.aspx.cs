using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web.UI.WebControls;
namespace Assignment1_Assignment2
{
    public partial class AdminEditUser : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminId"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }
            if (!HasPermission("EditUsers"))
            {
                Response.Redirect("AccessDenied.aspx");
                return;
            }
            if (!IsPostBack)
            {
                BindGender();
                BindReligion();
                BindHobbies();

                LoadAdminUser();

            }
        }
        public void BindGender()
        {
            SqlCommand cmd = new SqlCommand("GetGender", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            rblGender.Items.Clear();

            while (dr.Read())
            {
                rblGender.Items.Add(
                    new ListItem(
                        dr["Gendername"].ToString(),
                        dr["Genderid"].ToString()
                    )
                );
            }

            dr.Close();
            con.Close();
        }
        public void BindReligion()
        {
            SqlCommand cmd = new SqlCommand("GetReligion", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            ddlReligion.Items.Clear();

            while (dr.Read())
            {
                ddlReligion.Items.Add(
                    new ListItem(
                        dr["Religionname"].ToString(),
                        dr["Religionid"].ToString()
                    )
                );
            }

            dr.Close();
            con.Close();
        }
        public void BindHobbies()
        {
            SqlCommand cmd = new SqlCommand("GetHOBBIES", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            cblHobbies.Items.Clear();

            while (dr.Read())
            {
                cblHobbies.Items.Add(
                    new ListItem(
                        dr["Hobbiesname"].ToString(),
                        dr["Hobbiesid"].ToString()
                    )
                );
            }

            dr.Close();
            con.Close();
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            int id = Convert.ToInt32(Request.QueryString["id"]);
            string hobbies = "";
            foreach (ListItem item in cblHobbies.Items)
            {
                if (item.Selected)
                {
                    if (hobbies == "")
                        hobbies = item.Value;
                    else
                        hobbies += "," + item.Value;
                }
            }
            SqlCommand cmd = new SqlCommand(@"UPDATE tblRegistrations SET Name=@Name, Email=@Email,MobileNo=@MobileNo, Gender=@Gender,Religion=@Religion, Hobbies=@Hobbies, DateofBirth=@DateofBirth,Address=@Address,Password=@Password WHERE RegistrationId=@RegistrationId", con);
            cmd.Parameters.AddWithValue("@Name", txtName.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@MobileNo", txtMobile.Text);
            cmd.Parameters.AddWithValue("@Gender", rblGender.SelectedValue);
            cmd.Parameters.AddWithValue("@Religion", ddlReligion.SelectedValue);
            cmd.Parameters.AddWithValue("@Hobbies", hobbies);
            cmd.Parameters.AddWithValue("@DateofBirth", txtDOB.Text);
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
            cmd.Parameters.AddWithValue("@RegistrationId", id);
            con.Open();
            cmd.ExecuteNonQuery();
            SqlCommand cmd2 = new SqlCommand(@"UPDATE RegistrationQualification SET Qualification=@Qualification, Board=@Board, Year=@Year, Percentage=@Percentage WHERE RegistrationId=@RegistrationId", con);

            cmd2.Parameters.AddWithValue("@Qualification", txtQualification.Text);
            cmd2.Parameters.AddWithValue("@Board", txtBoard.Text);
            cmd2.Parameters.AddWithValue("@Year", txtYear.Text);
            cmd2.Parameters.AddWithValue("@Percentage", txtPercentage.Text);
            cmd2.Parameters.AddWithValue("@RegistrationId", id);

            cmd2.ExecuteNonQuery();
            con.Close();

            Response.Redirect("AdminUsers.aspx");
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

        public void LoadAdminUser()
        {

            {
                int id = Convert.ToInt32(Request.QueryString["id"]);

                SqlCommand cmd = new SqlCommand(
                    "SELECT * FROM  tblRegistrations WHERE RegistrationId=@RegistrationId", con);

                cmd.Parameters.AddWithValue("@RegistrationId", id);

                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    txtName.Text = dr["Name"].ToString();
                    txtEmail.Text = dr["Email"].ToString();
                    txtMobile.Text = dr["MobileNo"].ToString();

                    // Gender
                    rblGender.SelectedValue = dr["Gender"].ToString();

                    // Religion
                    ddlReligion.SelectedValue = dr["Religion"].ToString();

                    // Hobbies
                    string[] hobbies = dr["Hobbies"].ToString().Split(',');

                    foreach (ListItem item in cblHobbies.Items)
                    {
                        if (hobbies.Contains(item.Value))
                        {
                            item.Selected = true;
                        }

                    }
                    txtDOB.Text = Convert.ToDateTime(dr["DateofBirth"]).ToString("yyyy-MM-dd");
                    txtAddress.Text = dr["Address"].ToString();
                    txtPassword.Text = dr["Password"].ToString();


                }


                dr.Close();
                SqlCommand cmdQual = new SqlCommand("SELECT Qualification, Board, Year, Percentage FROM RegistrationQualification WHERE RegistrationId=@RegistrationId", con);

                cmdQual.Parameters.AddWithValue("@RegistrationId", id);

                SqlDataReader drQual = cmdQual.ExecuteReader();

                if (drQual.Read())
                {
                    txtQualification.Text = drQual["Qualification"].ToString();
                    txtBoard.Text = drQual["Board"].ToString();
                    txtYear.Text = drQual["Year"].ToString();
                    txtPercentage.Text = drQual["Percentage"].ToString();
                }

                drQual.Close();
                con.Close();
            }
        }

    }
}
