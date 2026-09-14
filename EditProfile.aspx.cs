using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Assignment1_Assignment2.Registration;

namespace Assignment1_Assignment2
{
    public partial class EditProfile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["RegistrationId"] == null)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }
                BindGender();
                BindHobbies();
                BindReligion();

                LoadUserForEdit();
            }
        }
        [WebMethod(EnableSession = true)]
        public static string UpdateProfile(userRegistration user)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

            SqlCommand cmd = new SqlCommand("UpdateUser", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@RegistrationId", HttpContext.Current.Session["RegistrationId"]);
            cmd.Parameters.AddWithValue("@Name", user.Name);
            cmd.Parameters.AddWithValue("@Email", user.Email);
            cmd.Parameters.AddWithValue("@MobileNo", user.MobileNo);
            cmd.Parameters.AddWithValue("@Gender", user.Gender);
            cmd.Parameters.AddWithValue("@Hobbies", user.Hobbies);
            cmd.Parameters.AddWithValue("@Religion", user.Religion);
            cmd.Parameters.AddWithValue("@DateOfBirth", user.DOB);
            cmd.Parameters.AddWithValue("@Address", user.Address);
            cmd.Parameters.AddWithValue("@Password", user.Password);
            cmd.Parameters.AddWithValue("@UploadPhoto", user.Uploadphoto);
            cmd.Parameters.AddWithValue("@UploadResume", user.UploadResume);

            con.Open();
            cmd.ExecuteNonQuery();
            int registrationId = Convert.ToInt32(HttpContext.Current.Session["RegistrationId"]);

            // Purani qualification delete
            SqlCommand cmdDelete = new SqlCommand(
                "DELETE FROM RegistrationQualification WHERE RegistrationId=@RegistrationId", con);

            cmdDelete.Parameters.AddWithValue("@RegistrationId", registrationId);
            cmdDelete.ExecuteNonQuery();

            // Nayi qualification insert
            if (user.Qualifications != null) { 
            foreach (RegistrationQualification q in user.Qualifications)
            {
                SqlCommand cmdInsert = new SqlCommand(
        "INSERT INTO RegistrationQualification(RegistrationId, Qualification, Board, Year, Percentage) VALUES(@RegistrationId,@Qualification,@Board,@Year,@Percentage)", con);

                cmdInsert.Parameters.AddWithValue("@RegistrationId",registrationId);
                cmdInsert.Parameters.AddWithValue("@Qualification",q.Qualification);
                cmdInsert.Parameters.AddWithValue("@Board", q.Board);
                cmdInsert.Parameters.AddWithValue("@Year", q.Year);
                cmdInsert.Parameters.AddWithValue("@Percentage",q.Percentage);

                cmdInsert.ExecuteNonQuery();
            }
            }
            con.Close();

            return "Success";
        }
        
        [WebMethod(EnableSession = true)]
        public static List<QualificationModel> GetQualification()
        {
            List<QualificationModel> list = new List<QualificationModel>();

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

            SqlCommand cmd = new SqlCommand("GetQualificationByRegistrationId", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@RegistrationId",
                HttpContext.Current.Session["RegistrationId"]);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                list.Add(new QualificationModel
                {
                    QId = Convert.ToInt32(dr["QId"]),
                    Qualification = dr["Qualification"].ToString(),
                    Board = dr["Board"].ToString(),
                    Year = dr["Year"].ToString(),
                    Percentage = dr["Percentage"].ToString()
                });
            }

            con.Close();

            return list;
        }
        public class QualificationModel
        {
            public int QId { get; set; }
            public string Qualification { get; set; }
            public string Board { get; set; }
            public string Year { get; set; }
            public string Percentage { get; set; }
        }



        [WebMethod]
        public void BindReligion()
        {

            SqlCommand cmd = new SqlCommand("GetReligion", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            ddlReligion.Items.Clear();
            ddlReligion.Items.Add(new ListItem("Select Religion", ""));
            while (dr.Read())
            {
                ddlReligion.Items.Add(new ListItem(dr["Religionname"].ToString(),
                dr["Religionid"].ToString()
                    ));
            }
            con.Close();
        }

        public void BindHobbies()
        {

            SqlCommand cmd = new SqlCommand("GetHOBBIES", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            StringBuilder sb = new StringBuilder();
            while (dr.Read())
            {
                sb.Append("<input type='checkbox' name='Hobbies' value='" + dr["Hobbiesid"] + "'/>");
                sb.Append(dr["Hobbiesname"]);
                sb.Append("&nbsp;&nbsp;");
            }
            divHobbies.InnerHtml = sb.ToString();
            con.Close();
        }
        public void BindGender()
        {

            SqlCommand cmd = new SqlCommand("GetGender", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            StringBuilder sb = new StringBuilder();
            while (dr.Read())
            {
                sb.Append("<input type='radio' name='Gender' value='" + dr["Genderid"] + "'/>");
                sb.Append(dr["Gendername"]);
                sb.Append("&nbsp;&nbsp;");
            }
            divGender.InnerHtml = sb.ToString();
            con.Close();

        }
        public void LoadUserForEdit()
        {
            SqlCommand cmd = new SqlCommand("GetUserById_Edit", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@RegistrationId", Session["RegistrationId"]);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            string gender = "";
            string hobbies = "";
            string religion = "";

            if (dr.Read())
            {
                txtName.Value = dr["Name"].ToString();
                txtEmail.Value = dr["Email"].ToString();
                txtMobile.Value = dr["Mobileno"].ToString();

                gender = dr["Gender"].ToString();
                hobbies = dr["Hobbies"].ToString();
                religion = dr["Religion"].ToString();

                txtDOB.Value = Convert.ToDateTime(dr["DateofBirth"]).ToString("yyyy-MM-dd");
                txtAddress.Value = dr["Address"].ToString();

                txtPassword.Value =Convert.ToString(dr["Password"]);
                txtConfirmPassword.Value = dr["Password"].ToString();

                // Age Calculate
                DateTime dob = Convert.ToDateTime(dr["DateofBirth"]);
                int age = DateTime.Now.Year - dob.Year;
                if (DateTime.Now < dob.AddYears(age))
                {
                    age--;
                }
                txtAge.Value = age.ToString();

                // Religion
                
                ddlReligion.Value = religion;

                // Photo
                if (!string.IsNullOrEmpty(dr["UploadPhoto"].ToString()))
                {
                    imgPreview.Src = "Uploads/Photo/" + dr["UploadPhoto"].ToString();
                    imgPreview.Style["display"] = "block";
                }

                // Resume
                if (!string.IsNullOrEmpty(dr["UploadResume"].ToString()))
                {
                    lnkResume.HRef = "Uploads/Resume/" + dr["UploadResume"].ToString();
                    lnkResume.InnerText = "Download Resume";
                }
            }

            dr.Close();
            con.Close();

            // Gender
            

            divGender.InnerHtml = $@"
            <input type='radio' name='Gender' value='1' {(gender == "1" ? "checked='checked'" : "")}> Male
            <input type='radio' name='Gender' value='2' {(gender == "2" ? "checked='checked'" : "")}> Female
            <input type='radio' name='Gender' value='3' {(gender == "3" ? "checked='checked'" : "")}> Others";

            // Religion
            //ddlReligion.Value = religion;

            // Hobbies
            //foreach (string h in hobbies.Split(','))
            //{
            //    divHobbies.InnerHtml = divHobbies.InnerHtml.Replace(
            //        "value=\"" + h.Trim() + "\"",
            //        "value=\"" + h.Trim() + "\" checked");
            //}
            foreach (string h in hobbies.Split(','))
            {
                divHobbies.InnerHtml = divHobbies.InnerHtml.Replace(
                    $"value='{h.Trim()}'",
                    $"value='{h.Trim()}' checked='checked'");
            }
        }

        
    }
}
