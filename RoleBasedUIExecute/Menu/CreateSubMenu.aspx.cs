using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common.Users;
using Common.Menus;
using BAL.Users;
using BAL.Menus;
using System.Data;
using System.Data.SqlClient;

namespace UIExecute.Menu
{
    public partial class CreateSubMenu : System.Web.UI.Page
    {
        string _currentDate = string.Format("{0:yyyy-MM-dd HH:mm:ss tt}", DateTime.Now);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                GetAllRolesName();
                GetAllMenusName();
            }
        }


        protected override void OnInit(EventArgs e)
        {
            InitializeComponent();
            base.OnInit(e);
        }

        private void InitializeComponent()
        {
            this.btnsubmenu.Click += new System.EventHandler(this.NewInsertSubMenu);
            this.ddlrole.SelectedIndexChanged += new System.EventHandler(this.GetMenuBySelectedRoleName);
        }

        void NewInsertSubMenu(Object sender, EventArgs e)
        {
            if(ddlrole.SelectedItem.Text!= "Select Role" && ddlmenuname.SelectedItem.Text!= "Select MenuName")
            { 
            // code for insert in subMenuTable
            SubMenuDTO _insert = GetSubMenuPropertyFromForm();

                // Note:  Duplicate name should be not insert. coded is in SP in sql

            SubMenuRepository.NewInsertSubMenu(ref _insert);
                lblmsg.Text = _insert.ERROR;
            }
            else
            {
                lblmsg.Text = "Please select at least dropdown list role & Menu";
            }
        }

        void GetMenuBySelectedRoleName(object sender, EventArgs e)
        {
            if(ddlrole.SelectedItem.Text!= "Select Role")
            {
                MenuDTO _select = GetMenuByRoleNameFromForm();
                DataSet ds = SubMenuRepository.GetAllMenuBySelectedRole(ref _select);
                if(ds.Tables.Contains("Table")==true)
                {
                    if(ds.Tables[0].Rows.Count>0)
                    {
                        ddlmenuname.DataSource = ds;
                        ddlmenuname.DataTextField = "MenuName";
                        ddlmenuname.DataValueField = "MenuID";
                        ddlmenuname.DataBind();
                    }
                }
            }
            else
            {
                lblmsg.Text = "Please select role name";
                GetAllMenusName();
            }
        }

        private SubMenuDTO GetSubMenuPropertyFromForm()
        {
            SubMenuDTO _submenu = new SubMenuDTO();
            _submenu.submenuname =txtsubmenuname.Text.Trim();
            _submenu.submenuurl = txtsubmenuurl.Text.Trim();
            _submenu.submenudescription = txtsubmenudescription.Text.Trim();
            _submenu.submenudisplaysequence =Convert.ToInt32(ddldisplaysequence.SelectedValue);

            if (chkisactive.Checked == true)
                _submenu.IsActive = true;
            else
                _submenu.IsActive = false;

            _submenu.MainMenuID = Convert.ToInt32(ddlmenuname.SelectedValue);
            _submenu.RoleId = Convert.ToInt32(ddlrole.SelectedValue);
            _submenu.CreatedDate = Convert.ToDateTime(_currentDate);
            return _submenu;
        }


        // For Menu Name display in dropdownlist by selected ROLE NAME
       private MenuDTO GetMenuByRoleNameFromForm()
        {
            MenuDTO _selectMenu = new MenuDTO();
            _selectMenu.RoleID = Convert.ToInt32(ddlrole.SelectedValue);
            return _selectMenu;
        }

        protected void  GetAllRolesName()
        {
            DataSet ds = SubMenuRepository.GetAllRolesAssignedToMainMenu();
            if(ds.Tables.Contains("Table")==true)
            {
                if(ds.Tables[0].Rows.Count>0)
                {
                    ddlrole.DataSource = ds;
                    ddlrole.DataTextField = "RoleName";
                    ddlrole.DataValueField = "RoleID";
                    ddlrole.DataBind();
                    ddlrole.Items.Insert(0, "Select Role");
                }
            }
        }

        protected void GetAllMenusName()
        {
            DataSet ds = MenuRepository.GetAllMenu();
            if(ds.Tables.Contains("Table")==true)
            {
                if(ds.Tables[0].Rows.Count>0)
                {
                    ddlmenuname.DataSource = ds;
                    ddlmenuname.DataTextField = "MenuName";
                    ddlmenuname.DataValueField = "MenuID";
                    ddlmenuname.DataBind();
                    ddlmenuname.Items.Insert(0, "Select MenuName");
                }
            }
        }

    }
}