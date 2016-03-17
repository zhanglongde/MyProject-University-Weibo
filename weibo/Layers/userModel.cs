using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace weibo.Layers
{
    /// <summary>
    /// 注册用户实体类
    /// </summary>
    public class userModel
    {
        public userModel()
        {
        }
        #region private Members
        private string UserName = string.Empty;
        private string UserPwd = string.Empty;     
        private string email = string.Empty;
        private string sex = string.Empty;
        private string ProvinceAddress = string.Empty;
        private string CityAddress = string.Empty;
        private string PhotoPath = string.Empty;
        private string selfIntroduction = string.Empty;
        private int fansQuantity = 0;
        private int concernsQuantity = 0;
        private int weiboPassageQuantity = 0;
        #endregion

        #region protected Functions
        public string UserName1
        {
            get { return UserName; }
            set { UserName = value; }
        }
        public string UserPwd1
        {
            get { return UserPwd; }
            set { UserPwd = value; }
        }
        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        public string Sex
        {
            get { return sex; }
            set { sex = value; }
        }
        public string ProvinceAddress1
        {
            get { return ProvinceAddress; }
            set { ProvinceAddress = value; }
        }
        public string CityAddress1
        {
            get { return CityAddress; }
            set { CityAddress = value; }
        }
        public string PhotoPath1
        {
            get { return PhotoPath; }
            set { PhotoPath = value; }
        }
        public string SelfIntroduction
        {
            get { return selfIntroduction; }
            set { selfIntroduction = value; }
        }
        public int FansQuantity
        {
            get { return fansQuantity; }
            set { fansQuantity = value; }
        }
        public int ConcernsQuantity
        {
            get { return concernsQuantity; }
            set { concernsQuantity = value; }
        }
        public int WeiboPassageQuantity
        {
            get { return weiboPassageQuantity; }
            set { weiboPassageQuantity = value; }
        }
        #endregion
    }
}