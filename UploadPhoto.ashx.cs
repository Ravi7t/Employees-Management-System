using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace Assignment1_Assignment2
{
    public class UploadPhoto : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            if (context.Request.Files.Count > 0)
            {
                HttpPostedFile file = context.Request.Files[0];

                string fileName = Path.GetFileName(file.FileName);

                string folder = context.Server.MapPath("~/Uploads/Photo/");

                if (!Directory.Exists(folder))
                {
                    Directory.CreateDirectory(folder);
                }

                file.SaveAs(Path.Combine(folder, fileName));

                context.Response.ContentType = "text/plain";
                context.Response.Write(fileName);
            }
        }

        public bool IsReusable
        {
            get { return false; }
        }
    }
}