using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using weibo.Layers;

namespace weibo
{
    public partial class weiboRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitNewUser_Click(object sender, EventArgs e)
        {
            string message = String.Empty;
            userModel user=new userModel();
            user.UserName1=txtUserName.Text.ToString();
            user.UserPwd1=txtPassword.Text.ToString();
            
            user.Email=txtEmail.Text.ToString();
            user.ProvinceAddress1= ddlProvinceAddress.Text.ToString();
            user.CityAddress1=ddlCityAddress.Text.ToString();
            user.ConcernsQuantity = 0;
            user.FansQuantity = 0;
            user.WeiboPassageQuantity = 0;
            user.SelfIntroduction = "默认简介";
            user.PhotoPath1 = "themes/default/headImage/男默认头像.jpg";

            string pwdCnf = txtPwdConfirm.Text.ToString();
             string sex=String.Empty;
            if (rbMan.Checked==true)
            {
                user.Sex = rbMan.Text.ToString();
            }
            else
            {
                user.Sex= rbWoman.Text.ToString();
            }

            message = weibo.Layers.BLLuser.CreateUser(user,pwdCnf);
            if (message=="注册成功")
            {
               
                 LabelHint.Text = message+"      3秒后，自动跳转到登录界面。";
                 LabelHint.Visible = true;
                 System.Threading.Thread.Sleep(5000);
                 Response.Redirect("weiHomepage.htm?username=" + user.UserName1);
            }
            else
            {
                LabelHint.Text = "注册失败:" + message;
            }
           
        }
    }
}