using System;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;
using System.Web.Services;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.Web.Services.Description;



namespace Assignment1_Assignment2
{
    public partial class Registration : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //ShowRegistration();
                BindGender();
                BindHobbies();
                BindReligion();
                
            }

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
        [WebMethod]
        public static string SaveRegistration(userRegistration reg)
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            SqlCommand cmd = new SqlCommand("tblRegistrationssubmit", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Name", reg.Name);
            cmd.Parameters.AddWithValue("@Email", reg.Email);
            cmd.Parameters.AddWithValue("@MobileNo", reg.MobileNo);
            cmd.Parameters.AddWithValue("@Gender", reg.Gender);
            cmd.Parameters.AddWithValue("@Hobbies", reg.Hobbies);
            cmd.Parameters.AddWithValue("@Religion", reg.Religion);
            cmd.Parameters.AddWithValue("@DateofBirth", reg.DOB);
            cmd.Parameters.AddWithValue("@Address", reg.Address);
            cmd.Parameters.AddWithValue("@Password", reg.Password);
            cmd.Parameters.AddWithValue("@Uploadphoto", reg.Uploadphoto);
            cmd.Parameters.AddWithValue("@UploadResume", reg.UploadResume);
            con.Open();
           
            int RegistrationId = Convert.ToInt32(cmd.ExecuteScalar());

            foreach (var item in reg.Qualifications)
            {
                SqlCommand cmd2 = new SqlCommand("SaveQualification", con);
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd2.Parameters.AddWithValue("@RegistrationId", RegistrationId);
                cmd2.Parameters.AddWithValue("@Qualification", item.Qualification);
                cmd2.Parameters.AddWithValue("@Board", item.Board);
                cmd2.Parameters.AddWithValue("@Year", item.Year);
                cmd2.Parameters.AddWithValue("@Percentage", item.Percentage);
                cmd2.ExecuteNonQuery();
                con.Close();


                return "Success";

            }
            return "Success";
        }
        

        [WebMethod]
        public void ShowRegistration()
        {
            SqlCommand cmd = new SqlCommand("JoinGenderHobbiesReligion", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            StringBuilder sb = new StringBuilder();
            foreach (DataRow dr in dt.Rows)
            {
                sb.Append("<tr>");
                sb.Append("<td>" + dr["Name"] + "</td>");
                sb.Append("<td>" + dr["Email"] + "</td>");
                sb.Append("<td>" + dr["MobileNo"] + "</td>");
                sb.Append("<td>" + dr["Gendername"] + "</td>");
                sb.Append("<td>" + dr["Hobbies"] + "</td>");
                sb.Append("<td>" + dr["Religionname"] + "</td>");
                sb.Append("<td>" + dr["DateofBirth"] + "</td>");
                sb.Append("<td>" + dr["Address"] + "</td>");
                sb.Append("<td><img src='Uploads/Photo/" + dr["UploadPhoto"] + "' width='60' height='60'/></td>");
                sb.Append("<td><a href='Uploads/Resume/" + dr["UploadResume"] + "' target='_blank'>View Resume</a></td>");
                sb.Append("<td>" + dr["Qualification"] + "</td>");
                sb.Append("<td>" + dr["Board"] + "</td>");
                sb.Append("<td>" + dr["Year"] + "</td>");
                sb.Append("<td>" + dr["Percentage"] + "</td>");
                
               


                sb.Append("</tr>");
            }

            tblBody.InnerHtml = sb.ToString();
        }
        public class RegistrationQualification
        {
            public string Qualification { get; set; }
            public string Board { get; set; }
            public string Year { get; set; }
            public string Percentage { get; set; }
        }
        public class userRegistration
        {
            public int RegistrationId { get; set; }
            public string Name { get; set; }
            public string Email { get; set; }
            public string MobileNo { get; set; }
            public int Gender { get; set; }
            public string Hobbies { get; set; }
            public int Religion { get; set; }
            public string DOB { get; set; }
            public string Address { get; set; }
            public string Password { get; set; }
            public List<RegistrationQualification> Qualifications { get; set; }
            public string Uploadphoto { get; set; }
            public string UploadResume { get; set; }
        }
    }
}