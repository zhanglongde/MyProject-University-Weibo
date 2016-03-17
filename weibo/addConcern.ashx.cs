using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using weibo.Layers;


namespace weibo
{
    /// <summary>
    /// addConcern 的摘要说明
    /// </summary>
    public class addConcern : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string userName = context.Request["userName"];
            string concern = context.Request["concern"];
            userModel us = weibo.Layers.BLLuser.QueryLegalUserMessage(userName);
            int concernsQuantity = us.ConcernsQuantity+1;
            int result = weibo.Layers.DALConcerns.addConcernFan(userName, concern);
            weibo.Layers.DALuser.concernsQuantityUpdate(userName,concernsQuantity);
            if (result != 1)
            {
                //添加关注失败
                context.Response.Write("Sorry");
            }
            else
            {  
                //添加关注成功
                context.Response.Write("OK");
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