using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using weibo.Layers;

namespace ajax实例
{
    /// <summary>
    /// PostComment 的摘要说明
    /// </summary>
    public class PostComment : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            string passageClient = context.Request["passage"];
            string userName=context.Request["userName"];
            weiboPassageModel passageServer = new weiboPassageModel();
            passageServer.PassageNo = DateTime.Now.ToString();
            passageServer.Passage = passageClient;
            passageServer.Issuer = userName;
            passageServer.IssueTime = DateTime.Now;
            userModel us = weibo.Layers.BLLuser.QueryLegalUserMessage(userName);
            passageServer.PhotoPath1= us.PhotoPath1;
           //向数据库中插入微博
            //new ...().Insert(context.Request.UserHostAddress,msg,DateTime.Now);
            String message = weibo.Layers.BLLWeiboPassage.issuePassage(passageServer);
            
            if (message == "发布成功")
            {
                //发布成功
                context.Response.Write("OK|" + passageServer.PassageNo + "|"
                    + passageServer.Passage + "|" + passageServer.Issuer + "|" + passageServer.IssueTime.ToString() +"|"+ us.PhotoPath1);
  
            }
            else
            {  //发布失败
                context.Response.Write("Sorry|0|0|0|0|0");
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