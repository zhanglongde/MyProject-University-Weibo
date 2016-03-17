using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using weibo.Layers;

namespace weibo
{
    public partial class weiboLoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataSet ds = DALWeiboPassage.GetAllPassage();
                repList.DataSource = ds.Tables[0].DefaultView;
                repList.DataBind();
                LabelHint.Visible =false;
            }
        }
        /// <summary>
        /// 调转到注册界面
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void registerbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("weiboRegister.aspx");
        }

        /// <summary>
        /// 验证登入信息
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e">密码是否正确</param>
        protected void login_submit_btn_Click(object sender, EventArgs e)
        {
            string message = String.Empty;
            string userName = txtUserName.Text.Trim().ToString();
            string pwd = txtPassword.Text.Trim().ToString();
            string pwdCnf = "";
            message = weibo.Layers.BLLuser.UserLogin(userName, pwd, pwdCnf);
            if (message == "密码正确")
            {
                
                //  Response.Redirect("loginedUserWeb.htm?username="+userName);
                
                message= "正在登入....".ToString();
                LabelHint.Text = message;
                LabelHint.Visible = true;
                //System.Threading.Thread.Sleep(5000);
                //System.Threading.Thread.Sleep(5000);
                Response.Redirect("weiHomepage.htm?username=" + userName);
                
            }
            else
            {
                LabelHint.Text = message;
                LabelHint.Visible = true;
            }
        }


    }
}