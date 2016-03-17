using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace weibo.Layers
{
    public class DALWeiboPassage
    {
        #region Private Members
        weiboPassageModel passage = new weiboPassageModel();
        static string mConnString = System.Configuration.ConfigurationManager.ConnectionStrings["weiboUser"].ConnectionString;
        #endregion
        #region Public Function
        /// <summary>
        /// 获取所有用户的微博文章
        /// </summary>
        /// <returns></returns>
        public static DataSet GetAllPassage()
        {
            DataSet ds = new DataSet();

            string sql = @"select passageNo,issuer,issueTime,passage,PhotoPath
                            from weiboPassageTable
                            ";

            try
            {
                ds = SqlHelper.ExecuteDataset(mConnString, CommandType.Text, sql);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return ds;
        }

        /// <summary>
        /// 获取用户本人及其关注的微博
        /// </summary>
        /// <returns></returns>
        public static DataSet GetUserAndConcernAllPassage(string userName)
        {
            DataSet ds = new DataSet();

            string sql = @"select passageNo,issuer,issueTime,passage
                            from weiboPassageTable 
                            ";
            try
            {
                ds = SqlHelper.ExecuteDataset(mConnString, CommandType.Text, sql);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return ds;
        }
        /// <summary>
        /// 向数据库中插入一片博文，及其属性
        /// </summary>
        /// <param name="passage"></param>
        /// <returns>0表示成功；-1表示失败</returns>
        public static int InsertWeiboPassage(weiboPassageModel passage)
        {

            updateWeiboQuantity(passage.Issuer);
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
                command.CommandText = "Insert Into weiboPassageTable(issuer,issueTime,passage,PhotoPath) Values(@issuer,@issueTime,@passage,@PhotoPath)";
                //command.Parameters.Add("@passageNo",passage.PassageNo);
                command.Parameters.Add("@issuer", passage.Issuer);
                command.Parameters.Add("@issueTime", passage.IssueTime);
                command.Parameters.Add("@passage",passage.Passage);
                command.Parameters.Add("@PhotoPath", passage.PhotoPath1);
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

        //;UPDATE userTable SET weiboPassageQuantit=1 WHERE UserName=@issuer

        public static int updateWeiboQuantity(string userName)
        {
            //            string sql= string.Format(
            //                   "UPDATE userTable SET weiboPassageQuantity+=1 WHERE UserName='{0}'",
            //userName); 
            int result = 0;
            //声明数据库连接
            SqlConnection connection = new SqlConnection();
            //声明数据库操作的命令
            SqlCommand command = new SqlCommand();
            try
            {
                connection.ConnectionString = mConnString;
                connection.Open();
                //设置数据库命令属性
                command.Connection = connection;
                command.CommandText = "UPDATE userTable SET weiboPassageQuantity+=1 WHERE UserName=@issuer";
                //command.Parameters.Add("@passageNo",passage.PassageNo);
                command.Parameters.Add("@issuer", userName);

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
        /// <summary>
        /// 根据用户名查询微博实体组
        /// </summary>
        /// <param name="passageNo"></param>
        /// <returns></returns>
        public static weiboPassageModel QueryweiboPassage(string passageNo)
        {
            weiboPassageModel p = new weiboPassageModel();
            SqlConnection connection = new SqlConnection(mConnString);
            string sql = string.Format("SELECT * FROM weiboPassageTable where passageNo='{0}'", passageNo);
            SqlCommand command = new SqlCommand(sql, connection);
            //SqlCommand command = new SqlCommand();
            //object obj = new object();
            string pwd = string.Empty;
            try
            {
                //数据库连接打开
                //connection.ConnectionString = mConnString;
                connection.Open();
                //设置数据库命令属性
                //command.Connection = connection;
                //command.CommandText = "Select UserPwd From userTable Where UserName=@user";
                //command.Parameters.Add("@user", userName);
                SqlDataReader dr = command.ExecuteReader();
                while (dr.Read())
                {
                    p.PassageNo = Convert.ToString(dr["passageNo"]); 
                    p.Passage= Convert.ToString(dr["passage"]); 
                    p.IssueTime=Convert.ToDateTime( dr["issueTime"]); 
                    p.Issuer= Convert.ToString(dr["issuer"]);                     
                }
                return p;
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

        public static List<weiboPassageModel> QueryweiboPassages(string issuer)
        {
            //weiboPassageModel wpm = new weiboPassageModel();
            SqlConnection connection = new SqlConnection(mConnString);
            string sql = string.Format("SELECT * FROM weiboPassageTable where issuer='{0}'", issuer);
            SqlCommand command = new SqlCommand(sql, connection);
            List<weiboPassageModel> weiboPassages = new List<weiboPassageModel>();
            try
            {
                connection.Open();
                SqlDataReader dr = command.ExecuteReader();
                while (dr.Read())
                {
                       weiboPassages.Add(new weiboPassageModel { 
                       PassageNo= Convert.ToString(dr["passageNo"]),
                       Passage=Convert.ToString(dr["passage"]),
                       IssueTime = Convert.ToDateTime(dr["issueTime"]),
                       Issuer=Convert.ToString(dr["issuer"]),
                       PhotoPath1=Convert.ToString(dr["PhotoPath"])
                    });
                   
                }
                return weiboPassages;
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