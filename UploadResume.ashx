<%@ WebHandler Language="C#" Class="UploadResume" %>

using System;
using System.Web;

public class UploadResume : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        if (context.Request.Files.Count > 0)
        {
            HttpPostedFile file = context.Request.Files[0];

            string fileName = System.IO.Path.GetFileName(file.FileName);

            string path = context.Server.MapPath("~/Uploads/Resume/");

            if (!System.IO.Directory.Exists(path))
            {
                System.IO.Directory.CreateDirectory(path);
            }

            file.SaveAs(path + fileName);

            context.Response.Write(fileName);
        }
    }

    public bool IsReusable
    {
        get { return false; }
    }
}