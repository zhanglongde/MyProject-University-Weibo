using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using weibo.Layers;

namespace weibo
{
    /// <summary>
    /// checkUserExistence 的摘要说明
    /// </summary>
    public class checkUserExistence : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string userName = context.Request["userName"];
            int result = -1;
            result = DALuser.QueryUser(userName);
            if (result == -1)
            {
                //该用户不存在，可以注册
                context.Response.Write("OK");
            }
            else
            {
                //该用户已经存在，不可以注册
                context.Response.Write("Sorry");
            }
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