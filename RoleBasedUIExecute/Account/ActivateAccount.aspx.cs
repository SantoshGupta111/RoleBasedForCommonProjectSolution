using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace UIExecute.Account
{
    public partial class ActivateAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ActivateMyAccount();
            }
        }

        private void ActivateMyAccount()
        {
            // https://www.webcodeexpert.com/2013/08/create-registration-form-and-send.html

            //Update and manage into this table:  ActivationLink
            SqlConnection con = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            try
            {
                con = new SqlConnection(DAL.DALBase.PublicConnectionString);

                if ((!string.IsNullOrEmpty(Request.QueryString["EMPNO"])) & (!string.IsNullOrEmpty(Request.QueryString["EmailId"])))

                cmd = new SqlCommand("UPDATE tbl_userregistration SET IsApprovedThroughEmailID=1 WHERE EMPNO=@EMPNO AND EmailId=@EmailId", con);
                cmd.Parameters.AddWithValue("@EMPNO", Request.QueryString["EMPNO"]);
                cmd.Parameters.AddWithValue("@EmailId", Request.QueryString["EmailId"]);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                cmd.ExecuteNonQuery();
                Response.Write("You account has been activated. You can <a href='UserLogin.aspx'>Login</a> now! ");
            }

            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Error occured : " + ex.Message.ToString() + "');", true);
                return;
            }
            finally
            {
                con.Close();
                cmd.Dispose();
            }

        }
    }

}