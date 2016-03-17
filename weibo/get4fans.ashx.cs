using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using weibo.Layers;
using System.Web.Script.Serialization;

namespace weibo
{
    /// <summary>
    /// get4fans 的摘要说明
    /// </summary>
    public class get4fans : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string userName = context.Request["userName"];
            userModel singleFansModel = new userModel();
            List<userModel> fanModels = new List<userModel>();
            List<string> fanNames = DALFans.Query4FansUser(userName);
            foreach (string fanName in fanNames)
            {
                singleFansModel= weibo.Layers.DALuser.QueryUserMessage(fanName);
                fanModels.Add(singleFansModel);
            }
            JavaScriptSerializer jss = new JavaScriptSerializer();
            context.Response.Write(jss.Serialize(fanModels));
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