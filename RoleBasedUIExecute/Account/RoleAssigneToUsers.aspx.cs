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
using System.IO;

namespace UIExecute.Account
{
    public partial class RoleAssigneToUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                TabContainer1.ActiveTabIndex = 0;
                GetAllRoles();
                GetAllUsers();
                GetAllUsersAssignedWithRole();
            }
        }


        protected override void OnInit(EventArgs e)
        {
            InitializeComponent();
            base.OnInit(e);
        }


        private void InitializeComponent()
        {
            this.btnroleassigntouser.Click += new System.EventHandler(this.AssignRoleToUsers);
           // this.ddluser.SelectedIndexChanged += new System.EventHandler(this.GetDetailOnSelectUserCode);
        }

        //void GetDetailOnSelectUserCode(object sender, EventArgs e)
        //{
        //    UserRegistrationDTO _user = new UserRegistrationDTO
        //    {
        //        EMPNO = ddluser.SelectedValue.ToString()
        //    };

        //    DataSet ds = UserRegistrationRepository.GetAllUsersForRolesAssignByDataSetWithEMPNO(ref _user);
        //    if (ds.Tables.Contains("Table") == true)
        //    {
        //        if (ds.Tables[0].Rows.Count > 0)
        //        {
                    
        //            TabContainer1.ActiveTabIndex = 0;
        //            lblusercode.Text = ds.Tables[0].Rows[0]["EMPNO"].ToString();
        //            lblusername.Text=   ds.Tables[0].Rows[0]["FirstName"].ToString()+' '+ ds.Tables[0].Rows[0]["LastName"].ToString();
        //        }
        //    }
        //}



            // this method is used for update ROLEID and IsAuthorized status into userregistration.
        void AssignRoleToUsers(Object Sender, EventArgs e)
        {
            if (ddlrole.SelectedItem.Text!= "Select Role" && ddluser.SelectedItem.Text!= "Select User Name")
            {
                UserRegistrationDTO _user = GetUserFromForm();
                UserRegistrationRepository.RoleAssignToUsers(ref _user);
                lblmsg.Text = _user.ERROR;
                GetAllUsersAssignedWithRole();
            }
            else
            {
                lblmsg.Text = "Please select Role and User proper!!!";
            }
        }


        private UserRegistrationDTO GetUserFromForm()
        {
            UserRegistrationDTO _users = new UserRegistrationDTO();
            _users.EMPNO = ddluser.SelectedValue.ToString();
            _users.RoleID = Convert.ToInt32(ddlrole.SelectedValue);
            return _users;
        }

        // This is used for all user who has assigned with ROLE ID ( excluding roleid 12 - NONE) and complete process of registration
        //Authenticated & Authorized Employee List:
        protected void GetAllUsersAssignedWithRole()
        {
            DataSet ds = UserRegistrationRepository.GetAllAssignedUsersWithRoleID();
            if (ds.Tables.Contains("Table") == true)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    grdusers.DataSource = ds;
                    grdusers.DataBind();
                }
                else
                {
                    grdusers.DataSource = null;
                    grdusers.DataBind();
                    grdusers.EmptyDataText = "Data not found!";
                }
            }
        }
               

        protected void GetAllRoles()
        {
            DataSet ds = RoleRepository.GetAllRoles();
            if (ds.Tables.Contains("Table") == true)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ddlrole.DataSource = ds;
                    ddlrole.DataTextField = "RoleName";
                    ddlrole.DataValueField = "RoleID";
                    ddlrole.DataBind();
                    ddlrole.Items.Insert(0, "Select Role");
                }
            }

        }

        // this is used for all user who has complete process of registarion but not assigned to roleID
        protected void GetAllUsers()
        {
            DataSet ds = UserRegistrationRepository.GetAllUsersForRolesAssignByDataSet();
            if (ds.Tables.Contains("Table") == true)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ddluser.DataSource = ds;
                    ddluser.DataTextField = "EMPNO";
                    ddluser.DataValueField = "EMPNO";
                    ddluser.DataBind();
                    ddluser.Items.Insert(0, "Select User Code");
                }
            }
        }

        protected void ddluser_SelectedIndexChanged(object sender, EventArgs e)
        {  
            UserRegistrationDTO _user = new UserRegistrationDTO
            {
                EMPNO = ddluser.SelectedValue.ToString()
            };

            DataSet ds = UserRegistrationRepository.GetAllUsersForRolesAssignByDataSetWithEMPNO(ref _user);
            if (ds.Tables.Contains("Table") == true)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    lblmsg.Text = "";
                    DivTab.Visible = true;
                    //TabContainer1.Visible = true;
                    TabContainer1.ActiveTabIndex = 0;
                    lblusercode.Text = ds.Tables[0].Rows[0]["EMPNO"].ToString();
                    lblusername.Text = ds.Tables[0].Rows[0]["FirstName"].ToString() + ' ' + ds.Tables[0].Rows[0]["LastName"].ToString();
                    lbluseremailid.Text = ds.Tables[0].Rows[0]["EmailID"].ToString();
                    lbluserphoneno.Text = ds.Tables[0].Rows[0]["MobileNo"].ToString();
                    lblusergender.Text = ds.Tables[0].Rows[0]["Gender"].ToString();
                    if (ds.Tables[0].Columns.Contains("Age"))
                    {
                        int age = Convert.ToInt32(ds.Tables[0].Rows[0]["Age"]);
                        lbluserage.Text = age.ToString();
                    }
                    lblcurrentaddress.Text = ds.Tables[0].Rows[0]["CurrentAddress"].ToString();
                    lblpermanentaddress.Text= ds.Tables[0].Rows[0]["PermanentAddress"].ToString();
                    lblcountry.Text= ds.Tables[0].Rows[0]["CountryName"].ToString();
                    lblstate.Text= ds.Tables[0].Rows[0]["StateName"].ToString();
                    lblcity.Text= ds.Tables[0].Rows[0]["CityName"].ToString();
                    lbldepartment.Text= ds.Tables[0].Rows[0]["DepartmentName"].ToString();
                    lbldesignation.Text= ds.Tables[0].Rows[0]["DesignationName"].ToString();
                    lbllocationzone.Text= ds.Tables[0].Rows[0]["LocationCodeName"].ToString();
                    lblrolename.Text= ds.Tables[0].Rows[0]["RoleName"].ToString();

                    // for doc file download
                    string filePath = ds.Tables[0].Rows[0]["DocFileUpload"].ToString();  // Replace this with the actual file path
                    string fileName = ds.Tables[0].Rows[0]["DocFileName"].ToString(); // Replace this with the actual file name
                    // Set the file name to the Label
                    lblFileName.Text = fileName;
                    // Set the file path as CommandArgument for the LinkButton
                    lnkdocfiledownload.CommandArgument = filePath;
                    // Make the LinkButton and Label visible so they are displayed on the page
                    lnkdocfiledownload.Visible = true;
                    lblFileName.Visible = true;


                    // for Image
                    string imagePath = ds.Tables[0].Rows[0]["UserImagePath"].ToString();
                    if (!string.IsNullOrEmpty(imagePath))
                    {
                        imguserphoto.ImageUrl = imagePath;
                    }
                    else
                    {
                        imguserphoto.ImageUrl = "~/Images/placeholder.jpg"; // Set a placeholder image if there is no image
                    }



                }
                else
                {
                    DivTab.Visible = false;
                    lblmsg.Text = "Please select EMPNO for the assign to rolename";
                    //TabContainer1.Visible = false;
                }
            }
        }


        // Method create and call into simplage page (not gridview) for download Doc file
        protected void DownloadFile(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument;
            if (!string.IsNullOrEmpty(filePath) && File.Exists(Server.MapPath(filePath)))
            {
                try
                {
                    Response.ContentType = "application/octet-stream";
                    Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
                    Response.WriteFile(Server.MapPath(filePath));
                    Response.End();
                }
                catch (Exception ex)
                {
                    // Log or display the error message
                    // For example, you can use a label control to show the error message
                    lblmsg.Text = "Error occurred during file download: " + ex.Message;
                }
            }
            else
            {
                // Handle the case when the file does not exist or the file path is invalid
                lblmsg.Text = "File not found or invalid file path.";
            }
        }





    }
}