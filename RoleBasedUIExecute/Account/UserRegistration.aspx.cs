using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BAL.Users;
using BAL;
using BAL.MasterDB;
using Common.Users;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Text.RegularExpressions;
using System.Text;
using System.Net;
using System.Net.Mail;
using System.Globalization;

namespace UIExecute.Account
{
    public partial class UserRegistration : System.Web.UI.Page
    {
        DateTime dob;
        string dateFormat = "yyyy-MM-dd"; // Replace with the expected date format

        MailMessage msg;
        string ActivationUrl = string.Empty;
        string emailId = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                txtfirstname.Focus();
                GetAllCountry();
                GetAllLocationZone();
                GetAllStateName();
                GetAllCityName();
                GetAllDepartmentName();
                GetAllDesignationName();
                FillCapctha();
            }
        }


        protected override void OnInit(EventArgs e)
        {
            InitializeComponent();
            base.OnInit(e);

        }

        private void InitializeComponent()
        {
            this.btnregistration.Click += new System.EventHandler(this.NewUserRegistration);
        }

        void NewUserRegistration(object Sender, EventArgs e)
        {
            try
            {
                //string activationLink = "abc.com";

                UserRegistrationDTO _Insert = GetNewUserRegistrationFromForm();
                if (Validation.IsValidExtension(fileuploaduserphoto.PostedFile.FileName)) // for image upload only
                {
                    bool _IsValidateEmailID = Validation.IsValidEmailID(txtemailid.Text.Trim());
                    bool _IsValidMobileNo = IsValidMobileNumber(txtmobileno.Text.Trim());
                   
                    if (_IsValidateEmailID != false)
                    {
                        if (_IsValidMobileNo != false)
                        {
                            if (Validation.ValidateDocFile(fileuploaduserdocument.PostedFile.FileName)) // for document upload only
                            {
                                if (Session["captcha"].ToString() == txtCaptcha.Text)
                                {
                                    UserRegistrationRepository.NewInsertUserRegistration(ref _Insert);
                                    lblmsg.Text = "User Registration Succussfully inserted!!";
                                    lblErrorMsg.Text = "";
                                    MailSendForActivationFromUsers();  // OK tested on 17th July mid night 1 AM.  and working and sent mail to my mail ID for testingpurpose.
                                    // send link for Activationlink on his email ID if 
                                    // if activated by user then status 1 in table of column name "IsApprovedThroughEmailID"
                                    // check table in ActivationLink and update into it also
                                }
                                else
                                {
                                    lblErrorMsg.Text = "Invalid Captcha Code";
                                }
                            }
                            else
                            {
                                lblmsg.Text = "Please upload doc file & Only DOC files are allowed.";
                            }
                        }
                        else
                        {
                            lblmsg.Text = "Please input correct mobile number with 10 Digit";
                        }
                    }
                    else
                    {
                        lblmsg.Text = "Please input valid Email ID";
                    }
                }
                else
                {
                    lblmsg.Text = "Please upload .jpeg,.png,.gif,.jpg,.bmp image only";
                }


            }
            catch (SqlException ex)
            {
                LogError(ex);
                // An error occurred
                string errorMessage = ex.Message;
                // Display the error message on the web form
                lblmsg.Text = "Error: " + errorMessage;
            }
            catch (Exception ex)
            {
                LogError(ex);
                string errorMessage = "An error occurred: " + ex.Message;
                lblmsg.Text = errorMessage;
            }
        }

        #region  EmailProcess Sending 
        // https://www.webcodeexpert.com/2013/08/create-registration-form-and-send.html
        //https://www.aspsnippets.com/Articles/Send-user-Confirmation-email-after-Registration-with-Activation-Link-in-ASPNet.aspx

        void MailSendForActivationFromUsers()
        {
           try
           {
             //Sending activation link in the email
             msg = new MailMessage();
            SmtpClient smtp = new SmtpClient();
            emailId = txtemailid.Text.Trim();
            //sender email address
            msg.From = new MailAddress("sgupta.gupta79@gmail.com");
            //Receiver email address
            msg.To.Add(emailId);
            msg.Subject = "Confirmation email for account activation";
            //For testing replace the local host path with your lost host path and while
            //making online replace with your website domain name

            ActivationUrl = Server.HtmlEncode("http://www.MyDemoprojectPersonal.com/Account/ActivateAccount.aspx?EMPNO=" + FetchUserId(emailId) + "&EmailID=" + emailId);
            msg.Body = "HI" + txtfirstname.Text.Trim() + "!\n" +
            "Thanks for showing interest and registring in <a href='http://www.MyDemoprojectPersonal.com'> MyDemoProjectPersonal.com<a> " +
            " Please <a href='" + ActivationUrl + "'>click here to activate</a>  your account and enjoy our services. \nThanks!";
            msg.IsBodyHtml = true;
                // passkey from APP Password in Gmail-account settings
                //https://www.youtube.com/watch?v=Ev_JePVxMyw
                // generate code - after use then we will remove from gmail

                smtp.Credentials = new NetworkCredential("sgupta.gupta79@gmail.com", "ugphulikhzvvexyt");
            smtp.Port = 587;
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            smtp.Send(msg);
            clear_controls();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Confirmation Link to activate your account has been sent to your email address');", true);
            }
            catch (Exception ex)
            {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Error occured : " + ex.Message.ToString() + "');", true);
            return;
            }
            finally
            {
            ActivationUrl = string.Empty;
            emailId = string.Empty;
           
            }
    
        }

        private string FetchUserId(string emailId)
        {
            SqlConnection con = new SqlConnection(DAL.DALBase.PublicConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd = new SqlCommand("SELECT EMPNO FROM tbl_userregistration WHERE EmailId=@EmailId", con);
            cmd.Parameters.AddWithValue("@EmailId", emailId);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            string UserID = Convert.ToString(cmd.ExecuteScalar());
            con.Close();
            cmd.Dispose();
            return UserID;
        }

        private void clear_controls()
        {
           txtfirstname.Text = string.Empty;
           txtemailid.Text = string.Empty;
           
        }

        #endregion


        // Manage UserRegistrationDTO
        private UserRegistrationDTO GetNewUserRegistrationFromForm()
        {
            UserRegistrationDTO _UserRegist = new UserRegistrationDTO();

            //_UserRegist.EMPNO = this is primary key and auto generate with one digit increase . EMP00001/2
            _UserRegist.FirstName = txtfirstname.Text.Trim();
            _UserRegist.LastName = txtlastname.Text.Trim();

            // _UserRegist.Password = txtpassword.Text.Trim(); // Jere We are not inserting manual with user input
            string _Password = CreateRandomPassword(8); //Password auto generate randomanly with 8 character
            _UserRegist.Password = _Password.ToString();

            _UserRegist.Detail = txtdetail.Text.Trim();
            //if (DateTime.TryParseExact(txtDOB.Text, "yyyy-MM-dd", CultureInfo.InvariantCulture, DateTimeStyles.None, out DateTime dob))
            if (DateTime.TryParse(txtDOB.Text, out DateTime dob))
            {
                _UserRegist.DOB = dob;
            }
            else
            {
                lblmsg.Text = "Failed to insert record for the DOB.";
            }
             string _gender = (radiogender.SelectedValue == "Male") ? "Male" : "Female";
            _UserRegist.Gender = _gender.ToString();
            _UserRegist.EmailID = txtemailid.Text.Trim();
            _UserRegist.MobileNo = txtmobileno.Text.Trim();

            // Here Not insert RoleID (it should be blank into RoleID Column Name ) into Registaration Page. 
            //we have RoleAssig to each and every user one byone through UI Form andalready created RoleAssignedTouser.aspx page

            //Extract Image File Name.
            if (fileuploaduserphoto.HasFile && fileuploaduserphoto.PostedFile != null)
            {
                string fileName = Path.GetFileName(fileuploaduserphoto.PostedFile.FileName);
                if (!string.IsNullOrEmpty(fileName))
                {
                    // Set the Image File Path.
                    string filePath = "~/Account/UserUploadImages/" + fileName;
                    fileuploaduserphoto.PostedFile.SaveAs(Server.MapPath(filePath));

                    _UserRegist.UserImage = fileName;
                    _UserRegist.UserImagePath = filePath;
                }
                else
                {
                    lblmsg.Text = "Please select a valid image file.";
                }
            }
            else
            {
                lblmsg.Text = "Please select an image file.";
            }


            //Save the Image File in Folder.


            _UserRegist.LocationZoneID = Convert.ToInt32(ddllocationzone.SelectedValue);
            _UserRegist.CountryID = Convert.ToInt32(ddlcountryname.SelectedValue);
            _UserRegist.StateID = Convert.ToInt32(ddlstatename.SelectedValue);
            _UserRegist.CityID = Convert.ToInt32(ddlcityname.SelectedValue);
            _UserRegist.DepartmentID = Convert.ToInt32(ddldepartmentname.SelectedValue);
            _UserRegist.DesignationID = Convert.ToInt32(ddldesignationname.SelectedValue);
            _UserRegist.CurrentAddress = txtcurrentaddress.Text.Trim();
            _UserRegist.PermanentAddress = txtpermanentaddress.Text.Trim();
            

            //Extract Document File Name.
            string DocfileName = Path.GetFileName(fileuploaduserdocument.PostedFile.FileName);
            //Set the Document File Path.
            string DocfilePath = "~/Account/DocFileUpload/" + DocfileName;
            //Save the Document File in Folder.
            fileuploaduserdocument.PostedFile.SaveAs(Server.MapPath(DocfilePath));

            _UserRegist.DocFileUpload = DocfilePath.ToString();
            _UserRegist.docfileName = DocfileName.ToString();

            return _UserRegist;
        }

        // Check and validate in Upload images in below images type only. not doc and xml file......

        #region Check Validation 
        private bool IsValidExtension(string filePath)
        {
            bool isValid = false;
            string[] fileExtensions = { ".bmp", ".jpg", ".png", ".gif", ".jpeg", ".BMP", ".JPG", ".PNG", ".GIF", ".JPEG" };

            for (int i = 0; i <= fileExtensions.Length - 1; i++)
            {
                if (filePath.Contains(fileExtensions[i]))
                {
                    isValid = true;
                }
            }
            return isValid;
        }

        private bool IsValidMobileNumber(string _mobileno)
        {
            const string motif = @"^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$";
            if (_mobileno != null)
                return Regex.IsMatch(_mobileno, motif);
            else
                return false;
        }

        #endregion

        #region Password Auto Created Onclick on Registration Button

        public static string CreateRandomPassword(int PasswordLength)
        {
            string _allowedChars = "0123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ";
            Random randNum = new Random();
            char[] chars = new char[PasswordLength];
            int allowedCharCount = _allowedChars.Length;
            for (int i = 0; i < PasswordLength; i++)
            {
                chars[i] = _allowedChars[(int)((_allowedChars.Length) * randNum.NextDouble())];
            }
            return new string(chars);
        }

        private void FillCapctha()
        {
            try
            {
                Random random = new Random();
                string combination = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
                StringBuilder captcha = new StringBuilder();
                for (int i = 0; i < 6; i++)
                {
                    captcha.Append(combination[random.Next(combination.Length)]);
                    Session["captcha"] = captcha.ToString();
                    imgCaptcha.ImageUrl = "GenerateCaptcha.aspx?" + DateTime.Now.Ticks.ToString();
                }
            }
            catch (Exception ex)
            {
                LogError(ex);
                string errorMessage = "An error occurred: " + ex.Message;
                lblmsg.Text = errorMessage;
            }
        }


        #endregion

        #region   ErrorLog  Maintain  3rd July 2023.  Mid night 1.50 AM

        private void LogError(Exception ex)
        {
            // Log the error in the error log table
            string connectionString = DAL.DALBase.PublicConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO ErrorLog (ErrorMessage, StackTrace, Timestamp) VALUES (@ErrorMessage, @StackTrace, @Timestamp)";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@ErrorMessage", ex.Message);
                command.Parameters.AddWithValue("@StackTrace", ex.StackTrace);
                command.Parameters.AddWithValue("@Timestamp", DateTime.Now);

                connection.Open();
                command.ExecuteNonQuery();
            }
        }
        #endregion


        #region MasterData  18th JUNE 2023
        protected void GetAllCountry()
        {
            DataTable _dtCountry = CountryRepository.GetAllCountry();
            if (_dtCountry != null)
            {
                if (_dtCountry.Rows.Count > 0)
                {
                    ddlcountryname.DataSource = _dtCountry;
                    ddlcountryname.DataTextField = "CountryName";
                    ddlcountryname.DataValueField = "CountryID";
                    ddlcountryname.DataBind();
                    ddlcountryname.Items.Insert(0, "--Select Country--");
                }
            }
        }

        protected void GetAllLocationZone()
        {
            DataTable _dtLocationZone = LocationCodeRepository.GetAllLocationZone();
            if (_dtLocationZone != null)
            {
                if (_dtLocationZone.Rows.Count > 0)
                {
                    ddllocationzone.DataSource = _dtLocationZone;
                    ddllocationzone.DataTextField = "LocationCodeName";
                    ddllocationzone.DataValueField = "LocationCodeID";
                    ddllocationzone.DataBind();
                    ddllocationzone.Items.Insert(0, "--Select LocationZone--");
                }
            }
        }

        protected void GetAllStateName()
        {
            DataTable _dtStateName = StateRepository.GetAllStateName();
            if(_dtStateName!=null)
            {
                if(_dtStateName.Rows.Count>0)
                {
                    ddlstatename.DataSource = _dtStateName;
                    ddlstatename.DataTextField = "StateName";
                    ddlstatename.DataValueField = "StateID";
                    ddlstatename.DataBind();
                    ddlstatename.Items.Insert(0, "--Select StateName--");
                }
            }
        }

        protected void GetAllCityName()
        {
            DataTable _dtCityName = CityRepository.GetAllCityName();
            if(_dtCityName!=null)
            {
                if(_dtCityName.Rows.Count>0)
                {
                    ddlcityname.DataSource = _dtCityName;
                    ddlcityname.DataTextField = "CityName";
                    ddlcityname.DataValueField = "CityID";
                    ddlcityname.DataBind();
                    ddlcityname.Items.Insert(0, "--Select CityName--");
                }
            }
        }

        protected void GetAllDepartmentName()
        {
            DataTable _dtDepartmentName = DepartmentRepository.GetAllDepartmentName();
            if(_dtDepartmentName!=null)
            {
                if(_dtDepartmentName.Rows.Count>0)
                {
                    ddldepartmentname.DataSource = _dtDepartmentName;
                    ddldepartmentname.DataTextField = "DepartmentName";
                    ddldepartmentname.DataValueField = "DepartmentID";
                    ddldepartmentname.DataBind();
                    ddldepartmentname.Items.Insert(0,"--Select Department Name--");
                }
            }

        }

        protected void GetAllDesignationName()
        {
            DataTable _dtDesignationName = DesignationRepository.GetAllDesignationName();
            if(_dtDesignationName!=null)
            {
                if(_dtDesignationName.Rows.Count>0)
                {
                    ddldesignationname.DataSource = _dtDesignationName;
                    ddldesignationname.DataTextField = "DesignationName";
                    ddldesignationname.DataValueField = "DesignationID";
                    ddldesignationname.DataBind();
                    ddldesignationname.Items.Insert(0, "--Select Designation Name--");
                }
            }
        }

        #endregion

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            FillCapctha();
        }

       
        //protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        //{
        //    txtdob.Text = Calendar1.SelectedDate.ToShortDateString();
        //    Calendar1.Visible = false;
        //}

        //protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        //{
        //   // Calendar1.Visible = true;
        //}

        // we have used requestfield control with message for each.
        // if we would not like to use of requiredvalidation then use below:
       
    }
}
