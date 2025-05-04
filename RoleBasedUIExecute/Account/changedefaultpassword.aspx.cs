using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using BAL.Users;
using Common.Users;

namespace UIExecute.Account
{
    public partial class changedefaultpassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                if (Session["empno"] != null)
                {
                    GetUserDetail();
                }
                else
                {
                    Response.Redirect("~/Account/UserLogin.aspx");
                }
            }
        }

        protected override void OnInit(EventArgs e)
        {
            InitializeComponent();
            base.OnInit(e);
        }

        private void InitializeComponent()
        {
            this.btnSubmit.Click += new System.EventHandler(this.UpdateChangePassword);
        }

        void UpdateChangePassword(object sender, EventArgs e)
        {
            UserRegistrationDTO _UpdateDefPass = GetUserDetailFromForm();
            UserRegistrationRepository.UpdateDefaultPasswordRegistration(ref _UpdateDefPass);
            //lblErrorList.Text = "Default password has been changed successfully";
            Response.Redirect("~/account/default.aspx?default=success");

        }

        private UserRegistrationDTO  GetUserDetailFromForm()
        {
            UserRegistrationDTO _userRegDetail = new UserRegistrationDTO();
            _userRegDetail.EMPNO = txtEmployeeCode.Text.Trim();
            _userRegDetail.Password = txtNewPassword.Text.Trim();
            _userRegDetail.IsChangedDefaultPassword = true;
            // If changed default password then update will be ischangedefaultpassword- status =True
            //If changed default password then update will be IsAuthotenticate- status = True
            _userRegDetail.IsAuthenticated = true;
            return _userRegDetail;
        }

        protected void GetUserDetail()
        {
            if(Request.QueryString["changedefaultpass"]!=null)
            {
                string _empcode = Session["empno"].ToString();
                string _empName = Session["userfirstname"].ToString() + ' ' + Session["userlastname"].ToString();
                txtEmployeeCode.Text = _empcode.ToString().Trim();
                txtEmployeeName.Text = _empName.ToString().Trim();
            }
        }
      
    }
}