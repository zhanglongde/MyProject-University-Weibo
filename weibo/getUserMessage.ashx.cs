using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using weibo.Layers;

namespace weibo
{
    /// <summary>
    /// getUserMessage 的摘要说明
    /// </summary>
    public class getUserMessage: IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string userName = context.Request["userName"];
            userModel user = new userModel();
            user = weibo.Layers.BLLuser.QueryLegalUserMessage(userName);
            if (user.CityAddress1 != String.Empty)
            {
                //获取用户信息成功
                context.Response.Write("OK|" + user.UserName1 + "|"
                    + user.ProvinceAddress1+ "|" + user.CityAddress1+
                    "|" + user.ConcernsQuantity + "|" + user.FansQuantity + "|" + user.WeiboPassageQuantity + "|" + user.PhotoPath1);

            }
            else
            {  //获取用户信息失败
                context.Response.Write("Sorry|0|0|0|0|0|0|0");
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