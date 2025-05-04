using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System;
using System.Web.UI.WebControls;
using BAL.Users;
using BAL.Menus;
using BAL.MasterDB;
using Common.Users;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Common.Menus;
using System.IO;
using UIExecute.MasterPage;
using System.Globalization;


namespace UIExecute.Account
{
    public partial class UsersDetail : System.Web.UI.Page
    {
        //string connStr = ConfigurationManager.ConnectionStrings["conNewprojectdemoDB"].ConnectionString;
        string connStr = DAL.DALBase.PublicConnectionString;  // instead of above use of webConfig file.not from webconfig file

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["userrole"] != null)
                {
                    GetRoleName();
                    GetLocationCode();
                    GetAllCityName();
                    GetAllStateName();
                    ShowAgeRange();
                    //BindGridView();
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
            this.btnsearch.Click += new System.EventHandler(this.Search);
            this.btnreset.Click += new System.EventHandler(this.Reset);
        }

        // this is not working after  use of collepse update panel....search and reset button. it will work on click event
        void Search(object sender, EventArgs e)
        {
            #region  Searching- OK and It is working fine.  same has create in Method ["BindGridViewGetFilteredData"] for paging purpose.
            UserRegistrationDTO _userDTO = SearchUserRegistrationFromForm();
            DataSet _dtGetSearch = UserRegistrationRepository.SearchUserRegistrationByOneORMultipleConditions(ref _userDTO);
            if (_dtGetSearch.Tables.Contains("Table") == true)
            {
                // this is below used for Default ALL data
                if ((txtfromdate.Text != "") || (txttodate.Text != "") || (ddlgender.SelectedValue != "0") || (ddlrolename.SelectedValue != "-Select-") || (ddlstate.SelectedValue != "-Select-") || (ddlcity.SelectedValue != "-Select-") || (ddllocationcode.SelectedValue != "-Select-") || (txtfirstname.Text != "") || (txtlastname.Text != "") || (txtemailid.Text != "") || (txtmobileno.Text != ""))
                {
                    if ((txtfromdate.Text == "") || (txttodate.Text == "") || (Convert.ToDateTime(txtfromdate.Text.Trim())) < (Convert.ToDateTime(txttodate.Text.Trim())))
                    {
                        if (_dtGetSearch.Tables[0].Rows.Count > 0)
                        {
                            lblmsg.Text = "";
                            grdusers.DataSource = _dtGetSearch;
                            grdusers.DataBind();
                            grdusers.AllowPaging = _dtGetSearch.Tables[0].Rows.Count > 0;
                            ViewState["SearchResults"] = _dtGetSearch;
                        }
                        else
                        {
                            grdusers.DataSource = null;
                            grdusers.DataBind();
                            grdusers.EmptyDataText = "Data not found!!!";
                        }
                    }

                    else
                    {
                        // Default All data will be reflect if none of these selected or input value for searching
                        lblmsg.Text = "Registration start date must be less than or equal to end date";
                        grdusers.DataSource = null;
                        grdusers.DataBind();
                        grdusers.EmptyDataText = "Data not found!!!";
                    }
                }
                else
                {
                    lblmsg.Text = "At least one input or select field must be provided for the search; otherwise, all data will be displayed.";
                    grdusers.PageSize = 5;
                    grdusers.DataSource = _dtGetSearch;
                    grdusers.DataBind();
                    grdusers.AllowPaging = _dtGetSearch.Tables[0].Rows.Count > 0;
                    ViewState["SearchResults"] = _dtGetSearch;
                }

            }

        }

        #endregion

        void BindGridViewGetFilteredData()
        {
            UserRegistrationDTO _userDTO = SearchUserRegistrationFromForm();

            DataSet _dtGetSearch = UserRegistrationRepository.SearchUserRegistrationByOneORMultipleConditions(ref _userDTO);
            if (_dtGetSearch.Tables.Contains("Table") == true)
            {
                if (_dtGetSearch.Tables[0].Rows.Count > 0)
                {
                    //if ((Convert.ToDateTime(Fromdate) <= (Convert.ToDateTime(ToDate))))
                    //{
                    grdusers.DataSource = _dtGetSearch;
                    grdusers.DataBind();
                    //grdusers.AllowPaging = _dtGetSearch.Tables[0].Rows.Count > 0;

                    // Here use of ViewState for the Paging after Searching with
                    // condition if more then data it will reflect with page and it will be display correctly data after filtering
                    ViewState["SearchResults"] = _dtGetSearch;
                    //}
                    //else
                    //{
                    //    lblmsg.Text = "Registration start date must be less than or equal to end date";
                    //}

                }
                else
                {
                    grdusers.DataSource = null;
                    grdusers.DataBind();
                    grdusers.EmptyDataText = "Data not found!!!";
                }

            }
        }

        private UserRegistrationDTO SearchUserRegistrationFromForm()
        {
            DateTime Fromdate;
            DateTime ToDate;
            // DateTime _RegistrationStartDate =Convert.ToDateTime( string.Format("{0:yyyy/MM/dd}", txtfromdate.Text.Trim()));
            // DateTime _RegistrationEndDate = Convert.ToDateTime( string.Format("{0:yyyy/MM/dd}", txttodate.Text.Trim()));

            UserRegistrationDTO _userSearch = new UserRegistrationDTO();
            _userSearch.FirstName = txtfirstname.Text.Trim();
            _userSearch.LastName = txtlastname.Text.Trim();
            _userSearch.EmailID = txtemailid.Text.Trim();
            _userSearch.MobileNo = txtmobileno.Text.Trim();
            _userSearch.Gender = ddlgender.SelectedValue;

            if (!string.IsNullOrEmpty(txtfromdate.Text.Trim()))
            {
                Fromdate = DateTime.Parse(string.Format("{0:MM/dd/yyyy}", txtfromdate.Text.Trim()));
                _userSearch.FromRegistrationDate = Fromdate;
            }
            if (!string.IsNullOrEmpty(txttodate.Text.Trim()))
            {
                ToDate = DateTime.Parse(string.Format("{0:MM/dd/yyyy}", txttodate.Text.Trim()));
                _userSearch.ToRegistrationDate = ToDate;
            }

            int roleId;
            if (int.TryParse(ddlrolename.SelectedValue, out roleId))
            {
                _userSearch.RoleID = roleId;
            }
            int stateId;
            if (int.TryParse(ddlstate.SelectedValue, out stateId))
            {
                _userSearch.StateID = stateId;
            }

            int locationId;
            if (int.TryParse(ddllocationcode.SelectedValue, out locationId))
            {
                _userSearch.LocationZoneID = locationId;
            }

            int cityId;
            if (int.TryParse(ddlcity.SelectedValue, out cityId))
            {
                _userSearch.CityID = cityId;
            }

            int MinAge;
            if (int.TryParse(ddlminage.SelectedValue, out MinAge))
            {
                _userSearch.MinAge = MinAge;
            }
            int Maxage;
            if (int.TryParse(ddlmaxage.SelectedValue, out Maxage))
            {
                _userSearch.MaxAge = Maxage;
            }

            return _userSearch;

        }


        void Reset(object Sender, EventArgs e)
        {
            txtfromdate.Text = "";
            txttodate.Text = "";
            txtfirstname.Text = "";
            txtlastname.Text = "";
            txtemailid.Text = "";
            txtmobileno.Text = "";
            ddlrolename.ClearSelection();
            ddlstate.ClearSelection();
            ddlcity.ClearSelection();
            ddllocationcode.ClearSelection();
            ddlgender.ClearSelection();
            txtfirstname.Focus();
            BindGridView();

        }

        protected void GetCountpage()
        {
            // Calculate the current page number.
            int currentPage = grdusers.PageIndex + 1;
            // Update the Label control with the current page information.
            lblHeaderSearch.Text = "<i>You are viewing page :</i> " + currentPage.ToString() +
               " of " + grdusers.PageCount;
        }


        void GetRoleName()
        {
            DataSet _dsrolename = RoleRepository.GetAllRoles();
            if (_dsrolename.Tables.Contains("Table") == true)
            {
                if (_dsrolename.Tables[0].Rows.Count > 0)
                {
                    ddlrolename.DataSource = _dsrolename;
                    ddlrolename.DataTextField = "RoleName";
                    ddlrolename.DataValueField = "RoleID";
                    ddlrolename.DataBind();
                    ddlrolename.Items.Insert(0, "-Select-");
                }
            }
        }

        void GetLocationCode()
        {
            DataTable _dslocationcode = LocationCodeRepository.GetAllLocationZone();
            if (_dslocationcode != null)
            {
                if (_dslocationcode.Rows.Count > 0)
                {
                    ddllocationcode.DataSource = _dslocationcode;
                    ddllocationcode.DataTextField = "LocationCodeName";
                    ddllocationcode.DataValueField = "LocationCodeID";
                    ddllocationcode.DataBind();
                    ddllocationcode.Items.Insert(0, "-Select-");
                }
            }
        }

        protected void GetAllStateName()
        {
            DataTable _dtStateName = StateRepository.GetAllStateName();
            if (_dtStateName != null)
            {
                if (_dtStateName.Rows.Count > 0)
                {
                    ddlstate.DataSource = _dtStateName;
                    ddlstate.DataTextField = "StateName";
                    ddlstate.DataValueField = "StateID";
                    ddlstate.DataBind();
                    ddlstate.Items.Insert(0, "-Select-");
                }
            }
        }

        protected void GetAllCityName()
        {
            DataTable _dtCityName = CityRepository.GetAllCityName();
            if (_dtCityName != null)
            {
                if (_dtCityName.Rows.Count > 0)
                {
                    ddlcity.DataSource = _dtCityName;
                    ddlcity.DataTextField = "CityName";
                    ddlcity.DataValueField = "CityID";
                    ddlcity.DataBind();
                    ddlcity.Items.Insert(0, "-Select-");
                }
            }
        }


        void ShowAgeRange()
        {
            for (int i = 1; i < 99; i++)
            {
                ddlminage.Items.Add(i.ToString());
                ddlmaxage.Items.Add(i.ToString());

            }
        }
        protected void BindGridView()
        {
            DataTable _dTUsers = UserRegistrationRepository.GetAllUsersByDataTable();
            if (_dTUsers.Rows.Count > 0)
            {
                grdusers.AllowPaging = true;
                ViewState["dirState"] = _dTUsers;
                ViewState["sortdr"] = "ASC";
                grdusers.DataSource = _dTUsers.DefaultView;
                grdusers.DataBind();


            }
        }

        // This method for Customer Page. but not working now.  see further
        protected void BindGridView(int _pageNo)
        {
            int _pageSize = 8;
            grdusers.PageSize = _pageSize;
            // int _totalRecords;
            //DataTable _dTUsers = UserRegistrationRepository.GetAllUsersByDataTable();
            UserRegistrationDTO _userDTO = new UserRegistrationDTO
            {
                PageNo = _pageNo,
                PageSize = _pageSize
            };
            DataTable _dTUsers = UserRegistrationRepository.GetAllUsersByDataTableForCustomerPaging(ref _userDTO);
            if (_dTUsers.Rows.Count > 0)
            {
                //https://www.yogihosting.com/asp-net-gridview-custom-paging/
                // see tomorrow
                ViewState["dirState"] = _dTUsers;
                ViewState["sortdr"] = "ASC";

                // grdusers.VirtualItemCount = _totalRecords.ToString();
                grdusers.DataSource = _dTUsers;//.DefaultView;
                grdusers.DataBind();

            }

        }

        // Paging uses below:  
        protected void grdusers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            // Here use of ViewState for the Paging after Searching with 
            //condition if more then data it will reflect with page and it will be display correctly data after filtering
            if (ViewState["SearchResults"] != null)
            {
                grdusers.PageIndex = e.NewPageIndex;
                BindGridViewGetFilteredData();
                GetCountpage();
            }
            else
            {
                grdusers.PageIndex = e.NewPageIndex;
                BindGridView();
                GetCountpage();
            }

        }

        // Method create and call into gridview for download Doc file
        protected void DownloadFile(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument;
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
            Response.WriteFile(filePath);
            Response.End();
        }



        //  For redirect Page after Action on View/Edit/Delete and Insert......
        protected void grdusers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string _empno = Convert.ToString(e.CommandArgument.ToString());
            if (e.CommandName == "UserEdit")
            {
                // Handle Edit action
                // Perform necessary logic
                lblmsg.Text = _empno.ToString() + "Selected Edit";
                //string url = string.Empty;
                //url = "usersEdit.aspx?";
                ////url += "edit=" + StringHelpers.Encrypt(lblorderid.Text);
                //url += "EditDetails=" + _empno.ToString();
                //Response.Redirect(url);

            }
            else if (e.CommandName == "UserView")
            {
                // Handle View action
                // string _empno1 = Convert.ToString(e.CommandArgument.ToString());
                // Perform necessary logic
                lblmsg.Text = "Selected View" + _empno;
            }
            else if (e.CommandName == "UserDelete")
            {
                // Handle View action
                // string _empno1 = Convert.ToString(e.CommandArgument.ToString());
                // Perform necessary logic
                lblmsg.Text = "Selected Delete" + _empno;
            }
            else if (e.CommandName == "UserInsert")
            {
                // Handle Insert action
                //string _empno3 = Convert.ToString(e.CommandArgument.ToString());
                // Perform necessary logic
                lblmsg.Text = "Selected Insert" + _empno;
            }
        }


        // Role Permission For View/Edit/Delete & Insert as per RoleID and SubMenuID
        protected void grdusers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // Method Created  1st July 2023
            // For purpose-  RolePermissionAccessbility for the Action Button On GridView as per RoleID [View/Edit/Delete & Insert]
            //  Here Call Method   [ due to reduce code ]  not repeated for each gridView in each page.  only call below method

            SubMenuRepository.ApplyRolePermissionsIntoGridView(e);

            #region  Code below  and working fine.  but for reduce code we have implemented in Method Class and call for eachpages..with below one also method name [GetRolePermission]  both are commented due to create new method function for the same working...
            //int _roleId = Convert.ToInt32(Session["userrole"]);
            //int _mainmenuID = Convert.ToInt32(Session["Action"].ToString());
            //int _submenuID;
            //string _currentUrl = HttpContext.Current.Request.Url.PathAndQuery;
            //SubMenuDTO _SM = new SubMenuDTO
            //{
            //    RoleId = _roleId,
            //    MainMenuID = _mainmenuID,
            //    submenuurl = _currentUrl.ToString()
            //};

            //DataSet ds = SubMenuRepository.RetrieveSubMenuId(ref _SM); // Get SubMenuID
            //if (ds.Tables.Contains("Table") == true)
            //{
            //    if (ds.Tables[0].Rows.Count > 0)
            //    {
            //        _submenuID=Convert.ToInt32(ds.Tables[0].Rows[0]["SubMenuID"].ToString());

            //        //lblSubMenuID.Text = ds.Tables[0].Rows[0]["SubMenuID"].ToString();
            //        Session["submenuid"] = _submenuID.ToString();
            //    }
            //}

            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    // Find the buttons in the current row

            //    Button lnkEdit = (Button)e.Row.FindControl("lnkEdit");
            //    Button lnkView = (Button)e.Row.FindControl("lnkView");
            //    Button lnkDelete = (Button)e.Row.FindControl("lnkDelete");
            //    Button lnkInsert = (Button)e.Row.FindControl("lnkInsert");

            //    // Retrieve the role permissions for the given role ID and submenu ID
            //    int _SMID = Convert.ToInt32(Session["submenuid"]);
            //    bool canEdit = GetRolePermission(_roleId, _SMID, "CanEdit");
            //    bool canView = GetRolePermission(_roleId, _SMID, "CanView");
            //    bool canDelete = GetRolePermission(_roleId, _SMID, "CanDelete");
            //    bool canInsert = GetRolePermission(_roleId, _SMID, "CanInsert");

            //    // Set the button visibility based on role permissions
            //    lnkEdit.Visible = canEdit;
            //    lnkView.Visible = canView;
            //    lnkDelete.Visible = canDelete;
            //    lnkInsert.Visible = canInsert;

            //    // Enable or disable the buttons as needed
            //    lnkEdit.Enabled = canEdit;
            //    lnkView.Enabled = canView;
            //    lnkDelete.Enabled = canDelete;
            //    lnkInsert.Enabled = canInsert;
            //}
            #endregion
        }

        #region  Code below  and working fine.  but for reduce code we have implemented in Method Class and call for eachpages..
        //   Get RolePermission for accessbility of ActionButton:   View/Edit/Delete & Insert....
        private bool GetRolePermission(int roleId, int submenuId, string permissionColumn)
        {
            bool hasPermission = false;
            string connectionString = DAL.DALBase.PublicConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT " + permissionColumn + " FROM tbl_RolePermissions WHERE RoleId = @RoleId AND SubmenuId = @SubmenuId";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@RoleId", roleId);
                command.Parameters.AddWithValue("@SubmenuId", submenuId);
                connection.Open();
                object result = command.ExecuteScalar();

                if (result != null && result != DBNull.Value)
                {
                    hasPermission = Convert.ToBoolean(result);
                }
            }

            return hasPermission;
        }
        #endregion



        // Data Sorting Uses.....use of ViewState
        protected void grdusers_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dt = (DataTable)ViewState["dirState"];
            if (dt.Rows.Count > 0)
            {
                if (ViewState["sortdr"].ToString() == "Asc")
                {
                    dt.DefaultView.Sort = e.SortExpression + " DESC";
                    ViewState["sortdr"] = "Desc";
                }
                else
                {
                    dt.DefaultView.Sort = e.SortExpression + " ASC";
                    ViewState["sortdr"] = "Asc";
                }

                grdusers.DataSource = dt;
                grdusers.DataBind();
            }
        }

        protected void ddlpagesize_SelectedIndexChanged(object sender, EventArgs e)
        {
            int _pageSize = int.Parse(ddlpagesize.SelectedValue);
            grdusers.PageSize = _pageSize;
            BindGridViewGetFilteredData();
        }

        protected void ddlrefreshinterval_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedInterval = Convert.ToInt32(ddlrefreshinterval.SelectedValue);
           // Timer1.Interval = selectedInterval;
            //lblHeaderSearch.Text = DateTime.Now.ToString();
           
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            //lblHeaderSearch.Text = DateTime.Now.ToString();
            grdusers.DataBind();
            BindGridViewGetFilteredData();
        }

        protected void ExportToExcel(object sender, EventArgs e)
        {
            // not working.  
            ExportToExcelRepository.Export(grdusers, txtExportFileName.Text.Trim());
            #region
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                //To Export all pages
                grdusers.AllowPaging = false;
                grdusers.Columns[0].Visible = false;
                this.BindGridViewGetFilteredData();

                grdusers.HeaderRow.BackColor = System.Drawing.Color.White;
                foreach (TableCell cell in grdusers.HeaderRow.Cells)
                {
                    cell.BackColor = grdusers.HeaderStyle.BackColor;
                }
                foreach (GridViewRow row in grdusers.Rows)
                {
                    row.BackColor = System.Drawing.Color.White;
                    foreach (TableCell cell in row.Cells)
                    {
                        if (row.RowIndex % 2 == 0)
                        {
                            cell.BackColor = grdusers.AlternatingRowStyle.BackColor;
                        }
                        else
                        {
                            cell.BackColor = grdusers.RowStyle.BackColor;
                        }
                        cell.CssClass = "textmode";
                    }
                }

                grdusers.RenderControl(hw);

                //style to format numbers to string
                string style = @"<style> .textmode { } </style>";
                Response.Write(style);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }
            #endregion
        }

        // Below it will be add for the Export file into excel and 
        //also add in design View in above as with @Page....... EnableEventValidation="false"
        // without these it will be come to error for the downloading and exporting
        public override void VerifyRenderingInServerForm(Control control)
        {

        }


    }
}