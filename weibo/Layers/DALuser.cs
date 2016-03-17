using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using weibo.Layers;


namespace weibo.Layers
{
    public class DALuser
    { 
        #region Private Members
        userModel user = new userModel();
        static string mConnString = System.Configuration.ConfigurationManager.ConnectionStrings["weiboUser"].ConnectionString;
        #endregion
        #region Public Function
        /// <summary>
       /// 根据用户名验证用户的存在性
       /// </summary>
       /// <param name="userName"></param>
       /// <returns></returns>
        public static int QueryUser(string userName)
        {
            SqlConnection connection = new SqlConnection();
            SqlCommand command = new SqlCommand();
            //object obj = new object();
            string username = String.Empty;
            try
            {
                //数据库连接打开
                connection.ConnectionString = mConnString;
                connection.Open();
                //设置数据库命令属性
                command.Connection = connection;
                command.CommandText = "Select UserName From userTable Where UserName=@user";

                command.Parameters.Add("@user", userName);
                //obj = command.ExecuteScalar();
                //if (obj== null)
                //{
                //    return -1;
                //}
                //else
                //{
                //    return Convert.ToInt32(obj);
                //}
                SqlDataReader dr = command.ExecuteReader();
                while (dr.Read())
                {
                    username = Convert.ToString(dr["UserName"]); ;
                }
                if (username==string.Empty)
                {
                    return -1;
                }
                else
                {
                    return 0;
                }

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
        /// 获取给定用户名的用户信息
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public static userModel QueryUserMessage(string userName)
        {
            SqlConnection connection = new SqlConnection();
            SqlCommand command = new SqlCommand();
            userModel user = new userModel();
            string username = String.Empty;
            try
            {
                //数据库连接打开
                connection.ConnectionString = mConnString;
                connection.Open();
                //设置数据库命令属性
                command.Connection = connection;
                command.CommandText = "Select * From userTable Where UserName=@user";
                command.Parameters.Add("@user", userName);
                SqlDataReader dr = command.ExecuteReader();
                while (dr.Read())
                {
                    user.UserName1 = Convert.ToString(dr["UserName"]);
                    user.UserPwd1 = Convert.ToString(dr["UserPwd"]);
                    user.Sex = Convert.ToString(dr["sex"]);
                    user.Email = Convert.ToString(dr["email"]);
                    user.ProvinceAddress1 = Convert.ToString(dr["ProvinceAddress"]);
                    user.CityAddress1= Convert.ToString(dr["CityAddress"]);
                    user.FansQuantity = Convert.ToInt32(dr["fansQuantity"]);
                    user.ConcernsQuantity = Convert.ToInt32(dr["concernsQuantity"]);
                    user.WeiboPassageQuantity = Convert.ToInt32(dr["weiboPassageQuantity"]);
                    user.PhotoPath1 = Convert.ToString(dr["PhotoPath"]);
                    user.SelfIntroduction = Convert.ToString(dr["selfIntroduction"]);
                }
                return user;

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
        /// 根据用户名验证密码的正确性
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public static string QueryUserPwd(string userName)
        {
           
            SqlConnection connection = new SqlConnection(mConnString);
            string sql = string.Format("SELECT UserPwd FROM userTable where UserName='{0}'", userName);
            SqlCommand command = new SqlCommand(sql, connection);
            //SqlCommand command = new SqlCommand();
            //object obj = new object();
            string pwd=string.Empty;
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
                    pwd = Convert.ToString(dr["UserPwd"]);;
                }
                return pwd;
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
        /// 注册用户不存在，可以注册，插入注册用户信息：用户名、密码
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="Pwd"></param>
        /// <returns></returns>
        public static int InsertUser(string userName, string Pwd)
        {
            //开始注册的流程
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
                command.CommandText = "Insert Into userTable(UserName,UserPwd) Values(@user,@pwd)";

                command.Parameters.Add("@user", userName);
                command.Parameters.Add("@pwd", Pwd);
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
        /// 注册用户不存在，可以注册，插入注册用户全部信息
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="Pwd"></param>
        /// <returns></returns>
        public static int InsertUser(userModel user)
        {
            //开始注册的流程
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
                command.CommandText = "Insert Into userTable(UserName,UserPwd,sex,email,ProvinceAddress,CityAddress,PhotoPath,selfIntroduction,fansQuantity,concernsQuantity,weiboPassageQuantity) "
                                                    + "Values(@user,@pwd,@sex,@email,@province,@city,@PhotoPath,@selfIntroduction,@fansQuantity,@concernsQuantity,@weiboPassageQuantity)";
                command.Parameters.Add("@user",user.UserName1 );
                command.Parameters.Add("@pwd", user.UserPwd1);
                command.Parameters.Add("@sex", user.Sex);
                command.Parameters.Add("@email", user.Email);
                command.Parameters.Add("@province", user.ProvinceAddress1);
                command.Parameters.Add("@city", user.CityAddress1);
                command.Parameters.Add("@PhotoPath", user.PhotoPath1);
                command.Parameters.Add("@selfIntroduction", user.SelfIntroduction);
                command.Parameters.Add("@fansQuantity", user.FansQuantity);
                command.Parameters.Add("@concernsQuantity", user.ConcernsQuantity);
                command.Parameters.Add("@weiboPassageQuantity", user.WeiboPassageQuantity);
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
        /// 上传头像
        /// </summary>
        /// <param name="id"></param>
        /// <param name="path"></param>
        /// <returns></returns>
        public static bool UserHeadFaceUpdate(string UserName, string path)
        {
            //SqlConnection conn = DAL.DBConnection.MyConnection();
            //声明数据库连接
            SqlConnection connection = new SqlConnection();
            bool conditon = false;
            int n = 0;
            string sql = string.Format("UPDATE userTable SET PhotoPath='{0}' WHERE UserName='{1}'", path, UserName);
            SqlCommand command = new SqlCommand(sql, connection);
            try
            {
                //数据库连接打开
                connection.ConnectionString = mConnString;
                connection.Open();
                //设置数据库命令属性
                command.Connection = connection;
                
                n = (int)command.ExecuteNonQuery();
            }
            catch (Exception ex)
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
            if (n >= 1) conditon = true;
            return conditon;
        }
        /// <summary>
        /// 修改关注数
        /// </summary>
        /// <param name="UserName"></param>
        /// <param name="path"></param>
        /// <returns></returns>
        public static bool concernsQuantityUpdate(string userName, int concernsQuantity)
        {
            //SqlConnection conn = DAL.DBConnection.MyConnection();
            //声明数据库连接
            SqlConnection connection = new SqlConnection();
            bool conditon = false;
            int n = 0;
            string sql = string.Format("UPDATE userTable SET concernsQuantity='{0}' WHERE UserName='{1}'", concernsQuantity, userName);
            SqlCommand command = new SqlCommand(sql, connection);
            try
            {
                //数据库连接打开
                connection.ConnectionString = mConnString;
                connection.Open();
                //设置数据库命令属性
                command.Connection = connection;

                n = (int)command.ExecuteNonQuery();
            }
            catch (Exception ex)
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
            if (n >= 1) conditon = true;
            return conditon;
        }
        /// <summary>
        /// 修改粉丝数
        /// </summary>
        /// <param name="UserName"></param>
        /// <param name="path"></param>
        /// <returns></returns>
        public static bool fansQuantityUpdate(string userName, int fansQuantity)
        {
            //SqlConnection conn = DAL.DBConnection.MyConnection();
            //声明数据库连接
            SqlConnection connection = new SqlConnection();
            bool conditon = false;
            int n = 0;
            string sql = string.Format("UPDATE userTable SET fansQuantity='{0}' WHERE UserName='{1}'", fansQuantity, userName);
            SqlCommand command = new SqlCommand(sql, connection);
            try
            {
                //数据库连接打开
                connection.ConnectionString = mConnString;
                connection.Open();
                //设置数据库命令属性
                command.Connection = connection;

                n = (int)command.ExecuteNonQuery();
            }
            catch (Exception ex)
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
            if (n >= 1) conditon = true;
            return conditon;
        }
        #endregion
    }
}