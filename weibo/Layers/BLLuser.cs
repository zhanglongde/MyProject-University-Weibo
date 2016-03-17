using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using weibo.Layers;

namespace weibo.Layers
{
    public class BLLuser
    { 
        /// <summary>
        /// 注册一个用户
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="Pwd"></param>
        /// <param name="PwdCnf"></param>
        /// <returns></returns>
        public static string CreateUser(userModel user, string PwdCnf)
        {
            #region Member //返回给提示层的提示信息
            string retMsg = String.Empty;
            #endregion
            #region 信息有效性验证需求


            #region Step1//对输入的信息进行判断
            //两次密码必须相同
            if (user.UserPwd1 != PwdCnf)
            {
                retMsg = "两次输入的密码不相同";
                return retMsg;

            }
       
            #endregion

            #region Step2 长度判断
            //用户名的长度不能超过7位
            if (user.UserName1.Length > 10)
            {
                retMsg = "用户名的长度不能超过10位";
                return retMsg;
            }
            //密码长度不能超过7位
            if (user.UserPwd1.Length > 10)
            {
                retMsg = "密码长度不能超过10位";
                return retMsg;
            }
            #endregion

            #region Step3 //其他更多的输入信息的有效性判断
            string base64Pwd = Convert.ToBase64String(System.Text.Encoding.Default.GetBytes(user.UserPwd1));           
            #endregion

            #endregion          
            #region //处理数据访问层可能抛出的异常
            try
            {
                int result = -1;
                result = DALuser.QueryUser(user.UserName1);
                if (result == -1)
                {
                    result = DALuser.InsertUser(user);
                    //该用户可以注册
                    if (result == -1)
                    {
                        retMsg = "注册失败";
                    }
                    else
                    {
                        retMsg = "注册成功";
                    }
                }
                //该用户已经存在，不能注册
                else
                {
                    retMsg = user.UserName1 + "已经存在";
                }
            }
            catch (Exception ex)
            {
                retMsg = "发生异常：" + ex.Message;

            }
            #endregion
            return retMsg;
        }
        /// <summary>
        /// 用户登入
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="Pwd"></param>
        /// <param name="PwdCnf"></param>
        /// <returns></returns>
        public static string UserLogin(string userName,string Pwd,string PwdCnf)
        {
            #region Member //返回给提示层的提示信息
            string retMsg = String.Empty;
            #endregion
            #region Step1 //对输入的信息进行判断
            //两次密码必须相同
            //if (!Pwd.Equals(PwdCnf))
            //{
            //    retMsg = "两次输入的密码不相同";
            //    return retMsg;

            //}

            #endregion
            #region //处理数据访问层可能抛出的异常
            try
            {
                int result =-1;
                //在数据库中验证该登入用户是否存在               
                result = DALuser.QueryUser(userName);
                
                //该用户不存在，登入失败
                if (result==-1)
                {
                    retMsg = "该用户不存在，登入失败！";
                } 
                //该用户存在，验证密码是否正确 
                else
                {
                    //retMsg = "该用户存在，验证密码是否正确 ！";
                    //通过用户名，从数据库中获得密码
                   
                    string downLayerPwd = DALuser.QueryUserPwd(userName);

                    if (downLayerPwd != Pwd)
                    {
                        retMsg = "密码错误，登入失败！";
                    }
                    //该用户存在，且登入密码正确，转到主页面
                    else
                    {
                        retMsg = "密码正确";

                    }
                }
            
            }
            catch (Exception ex)
            {
                retMsg = "发生异常：" + ex.Message;

            }
            #endregion
            return retMsg;
        }

        /// <summary>
        /// 获取用户的合法信息
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public static userModel QueryLegalUserMessage(string userName)
        {
            userModel user=new userModel();
            user=DALuser.QueryUserMessage(userName);
            return user;
        }
        /// <summary>
        /// 上传图片路径
        /// </summary>
        /// <param name="id"></param>
        /// <param name="path"></param>
        /// <returns></returns>
        public static bool updateHeadFacePath(string UserName, string path)
        {
            bool condition = false;
            try
            {
                condition = DALuser.UserHeadFaceUpdate(UserName, path);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return condition;
        }
    }
}