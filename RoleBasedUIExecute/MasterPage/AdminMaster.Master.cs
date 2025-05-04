using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Data;
using System.Data.SqlClient;
using BAL;
using BAL.Menus;
using BAL.Users;
using Common.Menus;
using System.Configuration;
using DAL;

namespace UIExecute.MasterPage
{
    public partial class AdminMaster : System.Web.UI.MasterPage
    {
        #region
        // string unit = UtilityFramWork.GridViewControls.CpossUnit();
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            //Note : If any changes in the url then direct open login page. dcomment below line.
            //SecurityManagerUrl.CheckSecurity();

            if (!Page.IsPostBack)
            {
                bool _IsDefaultPasswordChanged;
                _IsDefaultPasswordChanged = Convert.ToBoolean(Session["IsChangedDefaultPassword"]);

                if (Session["empno"] != null)// && _IsDefaultPasswordChanged == true && Convert.ToInt32(Session["userrole"]) != 12)
                {
                    if (_IsDefaultPasswordChanged == false)
                    {
                        Response.Redirect("~/Account/changedefaultpassword.aspx?changedefaultpass='" + Session["empno"].ToString() + "'");
                    }

                    // here userrole ==12 means roleName=None which has created by default during the registration...
                    if (Convert.ToInt32(Session["userrole"]) == 12)
                    {
                        lblwelcomename.Text = "Welcome: " + Session["userfirstname"].ToString() + ' ' + Session["userlastname"].ToString(); // +' ' +Session["utype"].ToString();
                        //lblcurrentdate.Text = DateTime.Now.ToLongDateString();
                        Image2.ImageUrl = Session["UserImage"].ToString();
                        lblActionMessage.Text = "You have no any authorized for the role!";
                    }

                    lblwelcomename.Text = "Welcome: " + Session["userfirstname"].ToString() + ' ' + Session["userlastname"].ToString(); // +' ' +Session["utype"].ToString();
                                                                                                                                        // lblcurrentdate.Text = DateTime.Now.ToLongDateString();
                    Image2.ImageUrl = Session["UserImage"].ToString();
                    GetMainMenuByRoleID();
                    GetSubMenu(TreeView1);

                }
                else
                {
                    //SecurityManagerUrl.CheckSecurity();
                    Response.Redirect("~/account/UserLogin.aspx");
                }
            }
        }

        //---Start  New code 13th June23
        protected void GetMainMenuByRoleID()
        {
            if (Session["userrole"] != null)
            {
                MenuDTO _getMenuByRoleID = GetMainMenuHeaderOnRoleIDFromForm();
                DataSet _dsMainMenu = MenuRepository.GetMainMenuHeader(ref _getMenuByRoleID);
                if (_dsMainMenu.Tables.Contains("Table") == true)
                {
                    if (_dsMainMenu.Tables[0].Rows.Count > 0)
                    {
                        DataList2.DataSource = _dsMainMenu;
                        DataList2.DataBind();
                    }
                }
            }
            else
            {
                Response.Redirect("~/account/UserLogin.aspx");
            }
        }

        // ByDefault TreeView Show after click for URL
        public void GetSubMenu(TreeView TreeView1)
        {
            try
            {
                // Session["Action"]--  for Finding MainMenuID in tbl_submenu
                //Session["Title"]--  for finding MenuName in tbl_MainMenu
                if (Session["Action"] != null && Session["Title"] != null)
                {
                    // lblhead.Text = Session["Title"].ToString();
                    TreeView1.Nodes.Clear();
                    TreeView1.Nodes.Add(new TreeNode(Session["Title"].ToString()));
                    TreeNode tNode = new TreeNode();
                    tNode = TreeView1.Nodes[0];
                    TreeView1.Nodes[0].ShowCheckBox = false;
                    PopulateTreeView(Convert.ToInt32(Session["Action"].ToString()), tNode);
                    tNode.Expand();

                    #region  It was issue for GetSubMenuID-  We have used in content page in RowDataBound Of GridView which isworkingfine.
                    //string currentUrl = HttpContext.Current.Request.Url.PathAndQuery;  // This property returns the path and query string portion of the URL.
                    ////string currentUrl = HttpContext.Current.Request.Url.AbsolutePath;  // This property returns only the absolute path of the URL.
                    //lblSubMenuUrl.Text = currentUrl.ToString();
                    //lblRoleID.Text = Session["userrole"].ToString();
                    //lblMainMenuID.Text = Session["Action"].ToString();
                    //lblSubMenuName.Text = Session["Title"].ToString();

                    //    int roleId = Convert.ToInt32(lblRoleID.Text);
                    //    int mainMenuId = Convert.ToInt32(lblMainMenuID.Text);

                    //    SubMenuDTO _SM = new SubMenuDTO
                    //    {
                    //        RoleId = roleId,
                    //        MainMenuID = mainMenuId,
                    //        submenuurl = currentUrl.ToString()
                    //    };

                    //    DataSet ds = SubMenuRepository.RetrieveSubMenuId(ref _SM); // Get SubMenuID
                    //    if (ds.Tables.Contains("Table") == true)
                    //    {
                    //        if (ds.Tables[0].Rows.Count > 0)
                    //        {
                    //            lblSubMenuID.Text = ds.Tables[0].Rows[0]["SubMenuID"].ToString();
                    //            Session["submenuid"] = lblSubMenuID.Text;
                    //        }
                    //    }
                    #endregion

                    divmaster.Visible = true;

                }
                else
                {

                }
            }
            catch (Exception ex)
            {
                lblActionMessage.Text = ex.Message;
            }
        }

        // GetSubMenu clik on Main Menu
        protected void lnkbtntopmenu_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton lnkbtn = (LinkButton)sender;
                //Session["Title"] = lnkbtn.Text;
                Session["Titles"] = lnkbtn.ClientID;
                int i = 0;
                if (lnkbtn != null)
                {
                    Session["Title"] = lnkbtn.Text;
                    DataListItem dit = (DataListItem)lnkbtn.NamingContainer;
                    i = dit.ItemIndex;
                    Label lblid = ((Label)(DataList2.Items[dit.ItemIndex].FindControl("lblid")));
                    Label lblurll = ((Label)(DataList2.Items[dit.ItemIndex].FindControl("lblurll")));

                    // New Class 14th June 23
                    int _MenuID = Convert.ToInt32(lblid.Text);
                    MenuDTO _MenuHeaderTitle = GetMenuHeaderTitleFromForm(_MenuID);
                    DataSet _dsMenuClickOnMainMenu = MenuRepository.GetMenuHeaderTitleForRedirectionIntoSubMenu(ref _MenuHeaderTitle);
                    if (_dsMenuClickOnMainMenu.Tables.Contains("Table") == true)
                    {
                        // if (_dsMenuClickOnMainMenu.Tables[0].Rows[0]["MenuUrl"].ToString() == "~/Account/Home.aspx")
                        if (_dsMenuClickOnMainMenu.Tables[0].Rows[0]["MenuUrl"].ToString() !=null && _dsMenuClickOnMainMenu.Tables[0].Rows[0]["MenuUrl"].ToString() != "")
                        {
                            TreeView1.Nodes.Clear();
                            // Session["Title"].ToString() -- For Display MainMenu Header Title
                            TreeView1.Nodes.Add(new TreeNode(Session["Title"].ToString()));
                            TreeNode tNode = new TreeNode();
                            tNode = TreeView1.Nodes[0];
                            TreeView1.Nodes[0].ShowCheckBox = false;
                            // Created below method for calling for adding one by one subMenuTital

                            PopulateTreeView(Convert.ToInt32(lblid.Text), tNode);
                            tNode.Expand();
                            string _PageUrl = _dsMenuClickOnMainMenu.Tables[0].Rows[0]["MenuUrl"].ToString();
                            Response.Redirect(_PageUrl);

                            // Page.ClientScript.RegisterStartupScript(this.GetType(), "Ming1", "SetColor('" + lnkbtn.ClientID + "')", true);
                            //lblhead.Text = Session["Title"].ToString();

                        }
                    }
                    else
                    {
                        Session["Title"] = null;
                        string _PageUrl = _dsMenuClickOnMainMenu.Tables[0].Rows[0]["MenuUrl"].ToString();
                        Response.Redirect(_PageUrl);
                    }

                }

            }
            catch (Exception ex)
            {
                lblActionMessage.Text = ex.Message;
            }

        }

        public void PopulateTreeView(Int32 inParentID, TreeNode inTreeNode)
        {
            SubMenuDTO _subMenuHeader = GetSubMenuHeaderTitleClickOnMainMenuFromForm(inParentID);
            DataSet _dsGetSubMenuHeader = MenuRepository.GetSubMenuHeaderTitleAfterClickOnMainMenu(ref _subMenuHeader);
            DataTable ParentTable = new DataTable();
            ParentTable = _dsGetSubMenuHeader.Tables[0];

            if (_dsGetSubMenuHeader.Tables.Contains("Table") == true)
            {
                if (_dsGetSubMenuHeader.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow parentrow in ParentTable.Rows)
                    {
                        // Note:  ItemArray[2] -Means table column ID index (start from 0 )-ItemArray[2]=SubMenuUrl
                        TreeNode parentnode = default(TreeNode);
                        string strLabel = parentrow.ItemArray[1] + " (" + parentrow.ItemArray[2] + ")";
                        parentnode = new TreeNode(strLabel);
                        inTreeNode.ChildNodes.Add(parentnode);
                        parentnode.Text = parentrow.ItemArray[1].ToString();
                        parentnode.Value = parentrow.ItemArray[0].ToString();
                        parentnode.NavigateUrl = parentrow.ItemArray[2].ToString();
                        Session["Action"] = parentrow.ItemArray[6].ToString();  // for SubMenuURl showing

                    }

                }
            }

        }



        private MenuDTO GetMainMenuHeaderOnRoleIDFromForm()
        {
            MenuDTO _Menu = new MenuDTO();
            _Menu.RoleID = Convert.ToInt32(Session["userrole"]);
            return _Menu;
        }

        private MenuDTO GetMenuHeaderTitleFromForm(int _MenuID)
        {
            MenuDTO _Menu = new MenuDTO();
            _Menu.MenuID = Convert.ToInt32(_MenuID);
            return _Menu;
        }

        private SubMenuDTO GetSubMenuHeaderTitleClickOnMainMenuFromForm(int _mainMenuID)
        {
            SubMenuDTO _SubMenu = new SubMenuDTO();
            _SubMenu.MainMenuID = Convert.ToInt32(_mainMenuID);
            return _SubMenu;
        }

        // END new code 13th June 23


        #region EventHandler
        protected override void OnInit(EventArgs e)
        {
            InitializeComponent();
            base.OnInit(e);
        }

        private void InitializeComponent()
        {
            this.lnkbtnSignOut.Click += new EventHandler(this.SignOut);
        }

        #endregion

        #region SessionOUt
        void SignOut(object sender, EventArgs e)
        {
            //SetIsLoggedInFlag();
            Session["UID"] = null;
            Session["empno"] = null;
            Session["userfirstname"] = null;
            Session["userlastname"] = null;
            Session["userrole"] = null;
            Session["UserImage"] = null;
            Session["IsChangedDefaultPassword"] = null;
            Session["IsRoleAuthorized"] = null;
            Session["Titles"] = null;
            Session["Title"] = null;
            Session["submenuid"] = null;
            Session["Action"] = null;
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Account/UserLogin.aspx");
        }


        #endregion


    }
}
