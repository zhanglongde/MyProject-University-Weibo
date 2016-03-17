using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using weibo.Layers;
using System.Web.Script.Serialization;

namespace weibo
{
    /// <summary>
    /// getAllWeibos 的摘要说明
    /// </summary>
    public class getAllWeibos : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string userName = context.Request["userName"];
            List<string> concerns = DALConcerns.QueryConcernsUser(userName);
            List<weiboPassageModel> concernAndUserPassages = new List<weiboPassageModel>();
            List<weiboPassageModel> singleUserPassages = weibo.Layers.DALWeiboPassage.QueryweiboPassages(userName);
            foreach (weiboPassageModel wpm in singleUserPassages)
            {
                concernAndUserPassages.Add(wpm);
            }
            foreach (string concern in concerns)
            {
                singleUserPassages = weibo.Layers.DALWeiboPassage.QueryweiboPassages(concern);
                foreach (weiboPassageModel wpm in singleUserPassages)
                {
                    concernAndUserPassages.Add(wpm);

                }
            }
          JavaScriptSerializer jss = new JavaScriptSerializer();
          context.Response.Write(jss.Serialize(concernAndUserPassages));

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