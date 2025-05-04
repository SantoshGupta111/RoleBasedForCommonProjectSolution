using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common.Users;
using BAL.Users;
using System.Data;
using System.Data.SqlClient;

namespace UIExecute.Account
{
    public partial class UserLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                txtusername.Focus();
            }
        }
        protected override void OnInit(EventArgs e)
        {
            InitializeComponent();
            base.OnInit(e);
        }

        private void InitializeComponent()
        {
            this.btnLogin.Click += new System.EventHandler(this.ClickOnLogin);

        }
         
        void ClickOnLogin(object Sender, EventArgs e)
        {
            if (txtusername.Text != null || txtpassword.Text != string.Empty)
            {               
                UserRegistrationDTO _validLogin = GetValidLoginFromForm();
                DataSet _DsValidLogin = UserLoginRepository.GetValidLoginByID(ref _validLogin);
                if (_DsValidLogin.Tables.Contains("Table") == true)
                {
                    if (_DsValidLogin.Tables[0].Rows.Count > 0)
                    {
                        bool _userIsActive =Convert.ToBoolean(_DsValidLogin.Tables[0].Rows[0]["IsActive"].ToString());
                        bool _userIsBlocked= Convert.ToBoolean(_DsValidLogin.Tables[0].Rows[0]["IsLockedAccount"].ToString());
                        if (_userIsActive==true) //1
                        {
                            if (_userIsBlocked==false) // 0
                            {
                                Session["UID"] = _DsValidLogin.Tables[0].Rows[0]["UID"].ToString();
                                Session["empno"] = _DsValidLogin.Tables[0].Rows[0]["EMPNO"].ToString();
                                Session["userfirstname"] = _DsValidLogin.Tables[0].Rows[0]["FirstName"].ToString();
                                Session["userlastname"] = _DsValidLogin.Tables[0].Rows[0]["LastName"].ToString();
                                Session["userrole"] = _DsValidLogin.Tables[0].Rows[0]["RoleID"].ToString();
                                Session["UserImage"] = _DsValidLogin.Tables[0].Rows[0]["UserImagePath"].ToString();
                                Session["IsChangedDefaultPassword"] = _DsValidLogin.Tables[0].Rows[0]["IsChangedDefaultPassword"].ToString();
                                Session["IsRoleAuthorized"] = _DsValidLogin.Tables[0].Rows[0]["IsAuthorized"].ToString();
                                OnSuccessfulAuthentication();
                                //lblmsg.Text = "Login Success";
                            }
                            else
                            {
                                lblmsg.Text = "Username has been bloacked, Kindly coordinate with IT Header";
                            }
                        }
                        else
                        {
                            lblmsg.Text = "Username is not activated, Kindly coordinate with IT Header";
                        }
                    }
                }
                else
                {
                    lblmsg.Text = "Please input username & password correctly";
                }

            }
            else
            {
                lblmsg.Text = "Please input username & password correctly";
            }
        }

        private void OnSuccessfulAuthentication()
        {
            try
            {
                string url = string.Empty;
                url = "Home.aspx";
                Response.Redirect(url);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

     
        // Here all property show from common class
        private UserRegistrationDTO GetValidLoginFromForm()
        {
            UserRegistrationDTO _login = new UserRegistrationDTO();
            _login.EMPNO = txtusername.Text.Trim();
            _login.Password = txtpassword.Text.Trim();

            return _login;
        }

      
    }
}