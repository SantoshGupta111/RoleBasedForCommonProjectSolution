using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common.Menus;
using BAL.Menus;
using BAL.Users;
using System.Data;
using System.Data.SqlClient;

namespace UIExecute.Menu
{
    public partial class CreateMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                GetAllRoles();
                GetAllMainMenu();
            }
        }


        protected override void OnInit(EventArgs e)
        {
            InitializeComponent();
            base.OnInit(e);
        }

        private void InitializeComponent()
        {
            this.btncreatemenu.Click += new System.EventHandler(this.NewCreateMenu);
        }

        void NewCreateMenu(Object sender, EventArgs e)
        {
            if (ddlrole.SelectedItem.Text != "Select Role" && ddldisplaysequence.SelectedItem.Text!= "--Select Sequence--")
            {
                MenuDTO _insertMenu = GetNewInsertMenuFromForm();
                MenuRepository.NewCreateMenu(ref _insertMenu);
                //lblmsg.Text = "Menu inserted successfully!!!";
                lblmsg.Text = _insertMenu.ERROR;
                GetAllMainMenu();
            }
            else
            {
                lblmsg.Text = "Please select at least one from dropdownList";
            }
        }

        // MenuDTO 
        private MenuDTO GetNewInsertMenuFromForm()
        {
            MenuDTO _Menu = new MenuDTO();
                     
            _Menu.RoleID = Convert.ToInt32(ddlrole.SelectedValue);
            _Menu.MenuName = txtmenuname.Text.Trim();
            _Menu.MenuUrl = txtmenuurl.Text.Trim();
            _Menu.MenuDescription = txtmenudescription.Text.Trim();
            if (ddldisplaysequence.SelectedValue != "--Select--")
                _Menu.DisplaySequence =Convert.ToInt32( ddldisplaysequence.SelectedValue);
            else
                _Menu.DisplaySequence = 0;

            if(chkisactive.Checked==true)
           
                _Menu.IsActive = true;
            else
                _Menu.IsActive = false;

            return _Menu;
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

        protected void GetAllMainMenu()
        {
            DataSet ds = MenuRepository.GetAllMenu();
            if(ds.Tables.Contains("Table")==true)
            {
                if(ds.Tables[0].Rows.Count>0)
                {
                    grdmenu.DataSource = ds;
                    grdmenu.DataBind();
                }
            }
        }

        protected void ddlrole_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlrole.SelectedItem.Text != "EcomAdmin" && ddlrole.SelectedItem.Text!= "Select Role")
            {
                txtmenuurl.Text = "~/Account/Home.aspx";
            }
            //else if(ddlrole.SelectedItem.Text== "Select Role")
            //{
            //    txtmenuurl.Text = "";
            //}
           else if (ddlrole.SelectedItem.Text == "EcomAdmin" && ddlrole.SelectedItem.Text != "Select Role")
            {
                txtmenuurl.Text = "~/Ecommerce_Admin/EcomHome.aspx";
            }
            else// if(ddlrole.SelectedItem.Text== "Select Role")
            {
                txtmenuurl.Text = "";
                txtmenuname.Text = "";
                txtmenudescription.Text = "";
                ddldisplaysequence.SelectedItem.Text= "--Select Sequence--";
            }
        }
    }
}