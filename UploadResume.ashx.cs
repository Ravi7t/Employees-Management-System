using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assignment1_Assignment2
{
    /// <summary>
    /// Summary description for UploadResume
    /// </summary>
    public class UploadResume : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Write("Hello World");
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}