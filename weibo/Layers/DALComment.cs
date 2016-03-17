using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace weibo.Layers
{
    public class DALComment
    {
        #region Private Members
        weiboPassageModel passage = new weiboPassageModel();
        static string mConnString = System.Configuration.ConfigurationManager.ConnectionStrings["weiboUser"].ConnectionString;
        #endregion
        #region Public Function
        /// <summary>
        /// 插入一条评论
        /// </summary>
        /// <param name="CommentModel"></param>
        /// <returns>0表示成功；-1表示失败</returns>
        public static int InsertComment(commentModel CommentModel)
        { 
            int result = 0;
            //声明数据库连接
            SqlConnection connection = new SqlConnection();
            //声明数据库操作的命令
            SqlCommand command = new SqlCommand();
            try
            {
                //数据库连接打开
                connection.ConnectionString = mConnString;
                connection.Open();
                //设置数据库命令属性
                command.Connection = connection;
                command.CommandText = "Insert Into commentTable(passageNo,comment,commentTime) Values(@PassageNo,@Comment,@CommentTime)";
                //command.Parameters.Add("@passageNo",passage.PassageNo);
                command.Parameters.Add("@PassageNo", CommentModel.PassageNo);
                command.Parameters.Add("@Comment", CommentModel.Comment);
                command.Parameters.Add("@CommentTime", CommentModel.CommentTime);
                result = command.ExecuteNonQuery();

                return result;
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally
            {
                if (connection.State != System.Data.ConnectionState.Closed)
                    connection.Close();
                command.Dispose();
                connection.Dispose();
            }

        }
        #endregion

    }
}