using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using weibo.Layers;

namespace weibo
{
    public partial class personInfSet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        /// <summary>
        /// 本地上传图片
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void localUpLoadImg_Click(object sender, EventArgs e)
        {
           string url=Server.UrlDecode(Request.UrlReferrer.ToString());
           string userName=url.Substring(url.LastIndexOf("=")+1);
            if (FileUpload1.HasFile)
            {
                ///限定上传图片格式为jpg
                if (FileUpload1.FileName.Substring(FileUpload1.FileName.LastIndexOf(".") + 1) != "jpg")
                {
                    Response.Write("只能上传格式为jpg的图片！");
                    return;
                }
                else
                {
                    string path = Server.MapPath("~/themes/default/headImage/");
                    if (userName == null)
                        throw new Exception("没有ID");
                    string uploadPath = "themes/default/headImage/" + userName + ".jpg";
                    if (!BLLuser.updateHeadFacePath(userName, uploadPath))
                    {
                        LabelHint.Text = "上传图片失败，请重试";
                        throw new Exception("上传头像路径出现异常");
                    }
                    else
                    {
                        LabelHint.Visible = true;
                        LabelHint.Text = "上传图片成功";
                    }
                    FileUpload1.PostedFile.SaveAs(path + userName + ".jpg");
                    LabelHint.Text = "上传图片成功";
                }
            }
        }
    }
}