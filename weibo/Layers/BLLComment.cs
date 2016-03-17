using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using weibo.Layers;

namespace weibo.Layers
{
    public class BLLComment
    {  
        /// <summary>
        /// 发布评论
        /// </summary>
        /// <param name="CommentModel"></param>
        /// <returns>"评论失败"表示失败    "评论成功"表示成功</returns>
        public static string issueComment(commentModel CommentModel)
        {
            #region Members //返回给提示层的提示信息
            string retMsg = String.Empty;
            #endregion
            #region Functions

            #region Step1 //对输入的信息进行判断
            #endregion
            #region //处理数据访问层可能抛出的异常
            try
            {
                int result = -1;
                //在数据库中验证该登入用户是否存在               
                result = DALComment.InsertComment(CommentModel);
                if (result == -1)
                {
                    retMsg = "评论失败" + CommentModel.Comment;
                }
                //返回0时，则发布成功
                else
                {
                    retMsg = "评论成功";
                }

            }
            catch (Exception ex)
            {
                retMsg = "发生异常：" + ex.Message;

            }
            #endregion
            return retMsg;


            #endregion
        }
    }
}