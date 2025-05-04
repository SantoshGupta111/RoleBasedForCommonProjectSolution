using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Common.Users;
using BAL.Users;

namespace UIExecute.Account
{
    public partial class changepassword : System.Web.UI.Page
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

        protected void Submit(object sender, EventArgs e)
        {
            UserRegistrationDTO _user = new UserRegistrationDTO();
            _user.EMPNO = txtEmployeeCode.Text.Trim();
            // Check this below method for OLD password is correct or not correct as per EMPNO 
            DataSet _dsUser = UserRegistrationRepository.GetAllUsersBYEmpNO(ref _user);
            if (txtNewPassword.Text.Trim() == txtConfirmPassword.Text.Trim())
            {
                if (_dsUser.Tables[0].Rows[0]["password"].ToString() == txtOldPassword.Text.Trim())
                {
                    UserRegistrationDTO _updateChangePass = GetUserRegistrationForChangePassFromForm();
                    UserRegistrationRepository.ChangePasswordRegistration(ref _updateChangePass);
                    lblErrorList.Text = _updateChangePass.ERROR;
                }
                else
                {
                    lblErrorList.Text = "Please correct input old password";
                }
            }
            else
            {
                lblErrorList.Text = "Please input correct same new & confirm password";
            }
        }

        protected void Cancel(object sender, EventArgs e)
        {

        }

        private UserRegistrationDTO GetUserRegistrationForChangePassFromForm()
        {
            UserRegistrationDTO _ChngPass = new UserRegistrationDTO();
            _ChngPass.EMPNO = txtEmployeeCode.Text.Trim();
            _ChngPass.Password = txtNewPassword.Text.Trim();

            return _ChngPass;
        }

        protected void GetUserDetail()
        {
            string _empcode = Session["empno"].ToString();
            string _empName = Session["userfirstname"].ToString() + ' ' + Session["userlastname"].ToString();
            txtEmployeeCode.Text = _empcode.ToString().Trim();
            txtEmployeeName.Text = _empName.ToString().Trim();
            
        }
    }
}