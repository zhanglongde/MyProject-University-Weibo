using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace weibo.Layers
{
    public class commentModel
    {
        #region private Members
        private int passageNo = -1;

        private string commentNo = string.Empty;
        private DateTime commentTime = DateTime.Now;     
        private string comment = string.Empty;
        #endregion
        #region public Functions

        public int PassageNo
        {
            get { return passageNo; }
            set { passageNo = value; }
        }
        public string CommentNo
        {
            get { return commentNo; }
            set { commentNo = value; }
        }
        public DateTime CommentTime
        {
            get { return commentTime; }
            set { commentTime = value; }
        }
        public string Comment
        {
            get { return comment; }
            set { comment = value; }
        }
        #endregion
    }
}