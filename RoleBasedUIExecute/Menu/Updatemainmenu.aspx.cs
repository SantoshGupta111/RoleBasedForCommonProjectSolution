using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using BAL.Menus;
using BAL.Users;
using Common.Menus;


namespace UIExecute.Menu
{
    public partial class Updatemainmenu : System.Web.UI.Page
    {
        string _requestQueryString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                GetAllRoles();
                GetMainMenuUrl();
                //  Start -  this is use I have need in both query string name but we need if view query then 
                //  every control will be enable false  if call query string Edit then by default means enable is true..
                //  this is benefit for in one method not for seperate of edit and view or other things....
                if (Request.QueryString["MenuViewDetails"] != null)
                {
                    _requestQueryString = "MenuViewDetails";
                    ControlEnableDesable();  // call for not editable textbox and dropdown anything. only view
                    GetMainMenuAllDetailsByMainMenuIDOnSelected(_requestQueryString);
                }
                else if (Request.QueryString["MenuEditDetails"] != null)
                {
                    _requestQueryString = "MenuEditDetails";
                    GetMainMenuAllDetailsByMainMenuIDOnSelected(_requestQueryString);
                }
                else if(Request.QueryString["MenuDeleteDetails"]!=null)
                {
                    _requestQueryString = "MenuDeleteDetails";
                    ControlEnableDesable();  // call for not editable textbox and dropdown anything. only can delete mark status in DB
                    GetMainMenuAllDetailsByMainMenuIDOnSelected(_requestQueryString);
                }
                else
                {
                    string url = string.Empty;
                    url = "~/Menu/DataDetails/mainmenudetails.aspx";
                    Response.Redirect(url);
                }
                // End-----

                SubMenuRepository.ApplyRolePermissionsToButtons(btnedit, btnView, btndelete, btninsert);
            }
        }

        protected override void OnInit(EventArgs e)
        {
            InitializeComponent();
            base.OnInit(e);
        }

        private void InitializeComponent()
        {
            this.btnedit.Click += new System.EventHandler(this.editMainMenu);
            this.btndelete.Click += new System.EventHandler(this.deleteMainMenu);
        }

        void editMainMenu(object sender, EventArgs e)
        {
            try
            { 
            bool _isActive = (radiomenuisactie.SelectedValue == "Published") ? true : false;
            MenuDTO _mdtoUpdate = new MenuDTO
            {

                MenuID = Convert.ToInt32(hiddenMainMenuID.Value),
                MenuName = txtmenuname.Text.Trim(),
                MenuUrl = ddlmenuurl.SelectedItem.Text,
                MenuDescription = txtmenudescription.Text.Trim(),
                DisplaySequence = Convert.ToInt32(ddlmenudisplaysequence.SelectedValue),
                IsActive=_isActive,
                RoleID = Convert.ToInt32(ddlrole.SelectedValue)             

            };
            if (Convert.ToInt32(hiddenMainMenuID.Value) != 0)
            {
                if (txtmenuname.Text!=string.Empty || txtmenuname.Text!="" && ddlrole.SelectedItem.Text != "Select Role" && ddlmenuurl.SelectedItem.Text != "Select MenuUrl")
                {
                    MenuRepository.UpdateMainMenu(ref _mdtoUpdate);
                    lblmsg.Text = _mdtoUpdate.ERROR;
                }
                else
                {
                    lblmsg.Text = "Please select at least one from dropdownList";
                }
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

        void deleteMainMenu(object sender, EventArgs e)
        {

        }

        protected void GetMainMenuAllDetailsByMainMenuIDOnSelected(string _queryString)
        {            
                int _mainMenuID;
                if (Request.QueryString[_queryString] != null && int.TryParse(Request.QueryString[_queryString], out _mainMenuID))
                {
                    _mainMenuID = Convert.ToInt32(Request.QueryString[_queryString]);
                     hiddenMainMenuID.Value = _mainMenuID.ToString();
                    MenuDTO _menuDTO = new MenuDTO
                    {
                        MenuID = _mainMenuID
                    };

                    DataSet _dsGetMainMenu = MenuRepository.GetAllMainMenuDetailWithByMainMenuID(ref _menuDTO);
                    if (_dsGetMainMenu.Tables.Contains("Table") == true)
                    {
                        if (_dsGetMainMenu.Tables[0].Rows.Count > 0)
                        {
                            txtmenuname.Text = _dsGetMainMenu.Tables[0].Rows[0]["MenuName"].ToString();
                            ddlrole.SelectedValue = _dsGetMainMenu.Tables[0].Rows[0]["RoleID"].ToString();
                            if (Convert.ToInt32(_dsGetMainMenu.Tables[0].Rows[0]["MenuID"].ToString()) != 0)
                            {
                                ddlmenuurl.SelectedValue = _dsGetMainMenu.Tables[0].Rows[0]["MenuID"].ToString();
                            }
                            else
                            {
                                ddlmenuurl.Items.Insert(0, "Select SubMenuUrl");
                            }
                            txtmenudescription.Text = _dsGetMainMenu.Tables[0].Rows[0]["MenuDescription"].ToString();
                            ddlmenudisplaysequence.SelectedValue = _dsGetMainMenu.Tables[0].Rows[0]["DisplaySequence"].ToString();

                            bool isActive = Convert.ToBoolean(_dsGetMainMenu.Tables[0].Rows[0]["IsActive"]);
                            if (isActive)
                            {
                                radiomenuisactie.Items.FindByValue("Published").Selected = true;
                            }
                            else
                            {
                                radiomenuisactie.Items.FindByValue("Hidden").Selected = true;
                            }
                        }
                    }

                }

        }


        void ControlEnableDesable()
        {
            txtmenuname.Enabled = false;
            ddlrole.Enabled = false;
            txtmenudescription.Enabled = false;
            ddlmenuurl.Enabled = false;
            radiomenuisactie.Enabled = false;
            ddlmenudisplaysequence.Enabled = false;

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

        protected void GetMainMenuUrl()
        {
            DataSet _dsUrl = MenuRepository.GetAllMainMenuDetailWithoutByMainMenuIDForCommonUse();
            if(_dsUrl.Tables.Contains("Table")==true)
            {
                if(_dsUrl.Tables[0].Rows.Count>0)
                {
                    ddlmenuurl.DataSource = _dsUrl;
                    // ddlmenuurl.DataTextField = "MenunameUrl";
                     ddlmenuurl.DataTextField = "MenuUrl";
                    ddlmenuurl.DataValueField = "MenuID";
                    ddlmenuurl.DataBind();
                    ddlmenuurl.Items.Insert(0, "Select MenuUrl");
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