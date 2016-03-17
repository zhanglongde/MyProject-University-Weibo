using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace weibo.Layers
{
    public class DALConcerns
    {
        #region Private Members
        userModel user = new userModel();
        static string mConnString = System.Configuration.ConfigurationManager.ConnectionStrings["weiboUser"].ConnectionString;
        #endregion
        #region Public Function
        /// <summary>
        /// 根据用户名获取他的关注数组
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public static List<string> QueryConcernsUser(string userName)
        {
            List<string> concerns= new List<string>();              
            SqlConnection connection = new SqlConnection();
            SqlCommand command = new SqlCommand();
            string username = String.Empty;
            try
            {
                //数据库连接打开
                connection.ConnectionString = mConnString;
                connection.Open();
                //设置数据库命令属性
                command.Connection = connection;
                command.CommandText = "Select concern From concernTable Where UserName=@user";
                command.Parameters.Add("@user", userName);
                SqlDataReader dr = command.ExecuteReader();
                while (dr.Read())
                {
                    concerns.Add(Convert.ToString(dr["concern"]));
                    
                }
                return concerns;
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
        /// 添加关注 传入用户名 和被关注的用户名
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="concern"></param>
        /// <returns></returns>
        public static int addConcernFan(string userName,string concern)
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
                command.CommandText = "Insert Into concernTable(UserName,concern) Values(@UserName,@concern)";
                command.Parameters.Add("@UserName", userName);
                command.Parameters.Add("@concern", concern);
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
        /// 删除关注
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="concern"></param>
        /// <returns></returns>
        public static int delConcernFan(string userName, string concern)
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
                command.CommandText = "Delete From concernTable WHERE UserName=@UserName and concern=@concern";
                command.Parameters.Add("@UserName", userName);
                command.Parameters.Add("@concern", concern);
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
        /// 选择可能感兴趣的人
        /// </summary>
        /// <returns></returns>
        public static DataSet GetInterestingPeople()
        {
            DataSet ds = new DataSet();

            string sql = @"select top 3 * from userTable  
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
        #endregion
    }
}