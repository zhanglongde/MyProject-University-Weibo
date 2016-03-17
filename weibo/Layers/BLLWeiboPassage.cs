using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using weibo.Layers;

namespace weibo.Layers
{
    public class BLLWeiboPassage
    {
        /// <summary>
        /// 向数据库中插入一条微博
        /// </summary>
        /// <param name="passage"></param>
        /// <returns></returns>
        public static string issuePassage(weiboPassageModel passage)
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
                int result =-1;
                //在数据库中验证该登入用户是否存在               
                result = DALWeiboPassage.InsertWeiboPassage(passage);
                if (result==-1)
                {
                    retMsg = "发布失败"+passage.PassageNo;
                } 
                //返回0时，则发布成功
                else
                {
                    retMsg = "发布成功";
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
        /// <summary>
        /// 获得某用户及其关注用户的微博数组
        /// </summary>
        /// <param name="userName">用户名</param>
        /// <returns>某用户及其关注用户的微博数组</returns>
        public static List<weiboPassageModel> PageloadPassages(string userName)
       {
           List<weiboPassageModel> concernAndUserPassages = new List<weiboPassageModel>();
           List<weiboPassageModel> singleUserPassages = new List<weiboPassageModel>();
           List<string> fans = DALConcerns.QueryConcernsUser(userName);
           for (int i = 0; i < fans.Count;i++ )
           {
               singleUserPassages = weibo.Layers.DALWeiboPassage.QueryweiboPassages(fans[i]);
               for (int j = 0; j< singleUserPassages.Count;j++ )
                   concernAndUserPassages.Add(singleUserPassages[j]);
           }
           singleUserPassages = weibo.Layers.DALWeiboPassage.QueryweiboPassages(userName);
           for (int j = 0; j < singleUserPassages.Count; j++)
               concernAndUserPassages.Add(singleUserPassages[j]);
           return concernAndUserPassages;

       }
    }
}