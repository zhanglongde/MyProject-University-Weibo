using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using weibo.Layers;
using System.Web.Script.Serialization;

namespace weibo
{
    /// <summary>
    /// getAllConcernsInf 的摘要说明
    /// </summary>
    public class getAllConcernsInf : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string userName = context.Request["userName"];
            userModel singleConcernsModel = new userModel();
            List<userModel> concernModels = new List<userModel>();
            List<string> concernNames = weibo.Layers.DALConcerns.QueryConcernsUser(userName);
            foreach (string concernName in concernNames)
            {
                singleConcernsModel = weibo.Layers.DALuser.QueryUserMessage(concernName);
                concernModels.Add(singleConcernsModel);
            }
            JavaScriptSerializer jss = new JavaScriptSerializer();
            context.Response.Write(jss.Serialize(concernModels));
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