using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


namespace Assignment1_Assignment2
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["RegistrationId"] == null)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                LoadUser();

                int registrationId = Convert.ToInt32(Session["RegistrationId"]);
                BindQualification(registrationId);
            }
        }
        private void BindQualification(int registrationId)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

            SqlCommand cmd = new SqlCommand("GetQualificationByRegistrationId", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@RegistrationId", registrationId);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            tbodyQualification.InnerHtml = "";

            while (dr.Read())
            {
                tbodyQualification.InnerHtml += "<tr>" +
                    "<td>" + dr["Qualification"] + "</td>" +
                    "<td>" + dr["Board"] + "</td>" +
                    "<td>" + dr["Year"] + "</td>" +
                    "<td>" + dr["Percentage"] + "</td>" +
                    "</tr>";
            }

            con.Close();
        }
       
        public void LoadUser()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

            SqlCommand cmd = new SqlCommand("GetUserById", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@RegistrationId", Session["RegistrationId"]);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                txtName.Value = dr["Name"].ToString();
                txtEmail.Value = dr["Email"].ToString();
                txtMobile.Value = dr["Mobileno"].ToString();
                if (!string.IsNullOrEmpty(dr["UploadResume"].ToString()))
                {
                    lnkResume.HRef = "Uploads/Resume/" + dr["UploadResume"].ToString();
                    
                }
               
                txtGender.Value = dr["Gender"].ToString();
                txtHobbies.Value = dr["Hobbies"].ToString();
                txtReligion.Value = dr["Religion"].ToString();
                txtDOB.Value = Convert.ToDateTime(dr["DateofBirth"]).ToString("dd-MM-yyyy");

                DateTime dob = Convert.ToDateTime(dr["DateofBirth"]);

                int age = DateTime.Now.Year - dob.Year;

                if (DateTime.Now < dob.AddYears(age))
                {
                    age--;
                }

                txtAge.Value = age.ToString();

                txtAddress.Value = dr["Address"].ToString();

                imgPhoto.Src = "Uploads/Photo/" + dr["UploadPhoto"].ToString();
                Response.Write(dr["UploadResume"].ToString());

                
            }

            dr.Close();
            con.Close();
        }
    }
}