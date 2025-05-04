using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BAL.Menus;
using Common.Menus;
using System.Data;
using System.Data.SqlClient;

namespace UIExecute.Menu
{
    public partial class Updatesubmenu : System.Web.UI.Page
    {
        string _requestQueryString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
               // GetSubMenuDetailOnselectedSubMenuID();
                GetSubMenuUrl();
                //  Start -  this is use I have need in both query string name but we need if view query then 
                //  every control will be enable false  if call query string Edit then by default means enable is true..
                //  this is benefit for in one method not for seperate of edit and view or other things....
                if (Request.QueryString["ViewDetails"] != null)
                {
                    _requestQueryString = "ViewDetails";
                    ControlEnableDesable();  // call for not editable textbox and dropdown anything. only view
                    GetSubMenuDetailOnselectedSubMenuID(_requestQueryString);
                }
                else if (Request.QueryString["EditDetails"] != null)
                {
                    _requestQueryString = "EditDetails";
                    GetSubMenuDetailOnselectedSubMenuID(_requestQueryString);
                }
                else if(Request.QueryString["DeleteDetails"]!=null)
                {
                    _requestQueryString = "DeleteDetails";
                    ControlEnableDesable();  // call for not editable textbox and dropdown anything. only view
                    GetSubMenuDetailOnselectedSubMenuID(_requestQueryString);
                }
                else
                {
                    string url = string.Empty;
                    url = "~/Menu/DataDetails/Submenudetails.aspx";
                    Response.Redirect(url);
                }
                // End-----

                SubMenuRepository.ApplyRolePermissionsToButtons(btnEdit, btnView, btndelete, btninsert);
            }
        }

        // created on 3rd July 24
        protected override void OnInit(EventArgs e)
        {
            InitializeComponent();
            base.OnInit(e);
        }

       private void InitializeComponent()
        {
            this.btnEdit.Click += new System.EventHandler(this.editSubMenu);
            this.btndelete.Click += new System.EventHandler(this.deleteSubMenu);
        }

        //  Edit created on 4th July 24
        void editSubMenu(object sender, EventArgs e)
        {
            try
            {
                bool _isActive = (radiosubmenuisactive.SelectedValue == "Published") ? true : false;
                SubMenuDTO _smdtoUpdate = new SubMenuDTO
                {
                    submenuid = Convert.ToInt32(Request.QueryString["EditDetails"].ToString()),
                    submenuname = txtsubmenuname.Text.Trim().ToString(),
                    submenuurl=ddlsubmenuurl.SelectedItem.Text,
                    submenudescription=txtsubmenudescription.Text.Trim().ToString(),
                    submenudisplaysequence=Convert.ToInt32(ddlsubmenudisplaysequence.SelectedValue),
                    IsActive=_isActive,
                    MainMenuID=Convert.ToInt32(hiddenmenuid.Value),
                    RoleId=Convert.ToInt32(hiddenroleid.Value)

                };

                if(Request.QueryString["EditDetails"].ToString()!=null)
                {
                    if(txtsubmenuname.Text!=string.Empty || txtsubmenudescription.Text!=string.Empty || ddlsubmenuurl.SelectedItem.Text!= "Select SubMenuUrl")
                    {
                        SubMenuRepository.UpdateSubMenu(ref _smdtoUpdate);
                        lblmsg.Text = _smdtoUpdate.ERROR;
                    }
                    else
                    {
                        lblmsg.Text = "Please select at least one from dropdownList";
                    }
                }
            }
            catch(SqlException ex)
            {
                LogError(ex);
                // An error occured
                string errorMessage = ex.Message;
                // Display the error message on the web page
                lblmsg.Text = "Error: " + errorMessage;
            }

            catch(Exception ex)
            {
                LogError(ex);
                string errorMessage ="An error occurred: " + ex.Message;
                lblmsg.Text = errorMessage;
            }
        }

        void deleteSubMenu(object sender, EventArgs e)
        {
            //
        }


        protected void GetSubMenuDetailOnselectedSubMenuID(string _querystring)
        {
            int _subMenuID;
            if (Request.QueryString[_querystring] != null && int.TryParse(Request.QueryString[_querystring], out _subMenuID))
            {
                _subMenuID = Convert.ToInt32(Request.QueryString[_querystring]);
                SubMenuDTO SMD = new SubMenuDTO
                {
                    submenuid = _subMenuID
                };

                DataSet _dsGetSubMenu = SubMenuRepository.GetAllSubMenuDetailWithBySubMenuID(ref SMD);
                if(_dsGetSubMenu.Tables.Contains("Table")==true)
                {
                    if(_dsGetSubMenu.Tables[0].Rows.Count>0)
                    {
                        txtmenuname.Text = _dsGetSubMenu.Tables[0].Rows[0]["MenuName"].ToString();
                        txtrolename.Text = _dsGetSubMenu.Tables[0].Rows[0]["RoleName"].ToString();
                        hiddenmenuid.Value= _dsGetSubMenu.Tables[0].Rows[0]["MainMenuID"].ToString();
                        hiddenroleid.Value= _dsGetSubMenu.Tables[0].Rows[0]["RoleID"].ToString();

                        txtsubmenuname.Text = _dsGetSubMenu.Tables[0].Rows[0]["SubMenuName"].ToString();
                        if(Convert.ToInt32(_dsGetSubMenu.Tables[0].Rows[0]["SubMenuID"].ToString())!=0)
                        {
                            ddlsubmenuurl.SelectedValue = _dsGetSubMenu.Tables[0].Rows[0]["SubMenuID"].ToString();
                        }
                        else
                        {
                            ddlsubmenuurl.Items.Insert(0, "Select SubMenuUrl");
                        }
                        txtsubmenudescription.Text= _dsGetSubMenu.Tables[0].Rows[0]["SubMenuDescription"].ToString();
                        ddlsubmenudisplaysequence.SelectedValue=_dsGetSubMenu.Tables[0].Rows[0]["SubMenuDisplaySequence"].ToString();
                        chkcanedit.Checked=Convert.ToBoolean(_dsGetSubMenu.Tables[0].Rows[0]["CanEdit"].ToString());
                        chkcanview.Checked = Convert.ToBoolean(_dsGetSubMenu.Tables[0].Rows[0]["CanView"].ToString());
                        chkcandelete.Checked = Convert.ToBoolean(_dsGetSubMenu.Tables[0].Rows[0]["CanDelete"].ToString());
                        chkcaninsert.Checked = Convert.ToBoolean(_dsGetSubMenu.Tables[0].Rows[0]["CanInsert"].ToString());
                        bool isActive = Convert.ToBoolean(_dsGetSubMenu.Tables[0].Rows[0]["IsActive"]);
                        if (isActive)
                        {
                            radiosubmenuisactive.Items.FindByValue("Published").Selected = true;
                        }
                        else
                        {
                            radiosubmenuisactive.Items.FindByValue("Hidden").Selected = true;
                        }
                    }
                }
            }
           
            
        }

        void ControlEnableDesable()
        {
            txtmenuname.Enabled = false;
            txtsubmenuname.Enabled = false;
            txtrolename.Enabled = false;
            txtsubmenudescription.Enabled = false;
            ddlsubmenuurl.Enabled = false;
            radiosubmenuisactive.Enabled = false;
            ddlsubmenudisplaysequence.Enabled = false;
            chkcanedit.Enabled = false;
            chkcanview.Enabled = false;
            chkcandelete.Enabled = false;
            chkcaninsert.Enabled = false;

        }

        //  action like edit and deletionis pending .......

        protected void GetSubMenuUrl()
        {
            DataSet ds = SubMenuRepository.GetAllSubMenuDetailWithoutBySubMenuIDForCommonUse();
            if(ds.Tables.Contains("Table")==true)
            {
                if(ds.Tables[0].Rows.Count>0)
                {
                    ddlsubmenuurl.DataSource = ds;
                    ddlsubmenuurl.DataTextField = "SubMenuUrl";
                    ddlsubmenuurl.DataValueField = "SubMenuID";
                    ddlsubmenuurl.DataBind();
                    ddlsubmenuurl.Items.Insert(0, "Select SubMenuUrl");
                }
            }
        }

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


    }
}