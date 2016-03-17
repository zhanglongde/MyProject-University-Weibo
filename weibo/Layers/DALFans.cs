using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace weibo.Layers
{
    public class DALFans
    {
        #region Private Members
        userModel user = new userModel();
        static string mConnString = System.Configuration.ConfigurationManager.ConnectionStrings["weiboUser"].ConnectionString;
        #endregion
        #region Public Function
        /// <summary>
        /// 传入用户名获得4个粉丝
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public static List<string> Query4FansUser(string userName)
        {
            List<string> fans = new List<string>();
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
                command.CommandText = "Select fan From fanTable Where UserName=@user ";
                command.Parameters.Add("@user", userName);
                SqlDataReader dr = command.ExecuteReader();
                while (dr.Read())
                {
                    fans.Add(Convert.ToString(dr["fan"]));
                   
                }
                return fans;
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
        /// 根据用户名获取他的粉丝数组
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public static List<string> QueryFansUser(string userName)
        {
            List<string> fans=new List<string>();              
            SqlConnection connection = new SqlConnection();
            SqlCommand command = new SqlCommand();

            try
            {
                //数据库连接打开
                connection.ConnectionString = mConnString;
                connection.Open();
                //设置数据库命令属性
                command.Connection = connection;
                command.CommandText = "Select fan From fanTable Where UserName=@user";
                command.Parameters.Add("@user", userName);
                SqlDataReader dr = command.ExecuteReader();
                while (dr.Read())
                {
                    int i = 0;
                    fans[i] = Convert.ToString(dr["fan"]);
                    i++;
                }
                return fans;
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