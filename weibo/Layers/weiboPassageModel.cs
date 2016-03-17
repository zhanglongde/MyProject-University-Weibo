using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace weibo.Layers
{
    public class weiboPassageModel
    {
        public weiboPassageModel()
        {
        }
        #region private Members
        private string passageNo = string.Empty;
        private string issuer = string.Empty;
        private DateTime issueTime = DateTime.Now;
        private string passage = string.Empty;
        private string PhotoPath = string.Empty;
      
        #endregion

        #region public Functions
        public string PassageNo
        {
            get { return passageNo; }
            set { passageNo = value; }
        }
        public string Passage
        {
            get { return passage; }
            set { passage = value; }
        }
        public DateTime IssueTime
        {
            get { return issueTime; }
            set { issueTime = value; }
        }
        public string Issuer
        {
            get { return issuer; }
            set { issuer = value; }
        }
        public string PhotoPath1
        {
            get { return PhotoPath; }
            set { PhotoPath = value; }
        }
  
        #endregion
    }
}