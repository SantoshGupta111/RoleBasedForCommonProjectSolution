using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UIExecute.Account
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                if(Request.QueryString["default"]=="success")
                {
                    divDefault.Visible = true;
                    divWelcome.Visible = true;
                }
                else
                {
                    divDefault.Visible = false;
                    divWelcome.Visible = true;
                }
            }

            

        }
    }
}