using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text.pdf;
using iTextSharp.text;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Assignment1_Assignment2
{
    public partial class DownloadProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["RegistrationId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
            DownloadPDF();
        }
        public void DownloadPDF()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

            SqlCommand cmd = new SqlCommand("GetUserById", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@RegistrationId", Session["RegistrationId"]);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            Document pdfDoc = new Document(PageSize.A4, 20, 20, 20, 20);

            MemoryStream ms = new MemoryStream();

            PdfWriter.GetInstance(pdfDoc, ms);

            pdfDoc.Open();

            Font titleFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 18);
            Font headingFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12);
            Font normalFont = FontFactory.GetFont(FontFactory.HELVETICA, 11);

            Paragraph title = new Paragraph("PROFILE DETAILS", titleFont);
            title.Alignment = Element.ALIGN_CENTER;
            pdfDoc.Add(title);

            pdfDoc.Add(new Paragraph(" "));

            if (dr.Read())
            {
                pdfDoc.Add(new Paragraph("Name : " + dr["Name"].ToString(), normalFont));
                pdfDoc.Add(new Paragraph("Email : " + dr["Email"].ToString(), normalFont));
                pdfDoc.Add(new Paragraph("Mobile : " + dr["Mobileno"].ToString(), normalFont));
                pdfDoc.Add(new Paragraph("Gender : " + dr["Gender"].ToString(), normalFont));
                pdfDoc.Add(new Paragraph("Religion : " + dr["Religion"].ToString(), normalFont));
                pdfDoc.Add(new Paragraph("Hobbies : " + dr["Hobbies"].ToString(), normalFont));
                pdfDoc.Add(new Paragraph("DOB : " + Convert.ToDateTime(dr["DateofBirth"]).ToString("dd-MM-yyyy"), normalFont));
                pdfDoc.Add(new Paragraph("Address : " + dr["Address"].ToString(), normalFont));

                pdfDoc.Add(new Paragraph(" "));
                if (!string.IsNullOrEmpty(dr["UploadPhoto"].ToString()))
                {
                    string photoPath = Server.MapPath("~/Uploads/Photo/" + dr["UploadPhoto"].ToString());

                    if (File.Exists(photoPath))
                    {
                        iTextSharp.text.Image img = iTextSharp.text.Image.GetInstance(photoPath);
                        img.ScaleToFit(120f, 120f);
                        img.Alignment = Element.ALIGN_RIGHT;
                        pdfDoc.Add(img);
                    }
                }
            }

            dr.Close();

            pdfDoc.Add(new Paragraph(" "));
            pdfDoc.Add(new Paragraph("Qualification Details", headingFont));
            pdfDoc.Add(new Paragraph(" "));

            PdfPTable table = new PdfPTable(4);
            table.WidthPercentage = 100;

            table.AddCell("Qualification");
            table.AddCell("Board");
            table.AddCell("Year");
            table.AddCell("Percentage");

            SqlCommand cmd2 = new SqlCommand("GetQualificationByRegistrationId", con);
            cmd2.CommandType = CommandType.StoredProcedure;
            cmd2.Parameters.AddWithValue("@RegistrationId", Session["RegistrationId"]);

            SqlDataReader dr2 = cmd2.ExecuteReader();

            while (dr2.Read())
            {
                table.AddCell(dr2["Qualification"].ToString());
                table.AddCell(dr2["Board"].ToString());
                table.AddCell(dr2["Year"].ToString());
                table.AddCell(dr2["Percentage"].ToString());
            }

            dr2.Close();

            pdfDoc.Add(table);

            pdfDoc.Close();

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Profile.pdf");
            Response.BinaryWrite(ms.ToArray());
            Response.End();

            con.Close();
        }
    }
        }
    
