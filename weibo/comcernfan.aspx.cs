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
    public partial class comcernfan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataSet ds = DALConcerns.GetInterestingPeople();
                repList.DataSource = ds.Tables[0].DefaultView;
                repList.DataBind();
               // LabelHint.Visible = false;
            }
        }

    
    }
}