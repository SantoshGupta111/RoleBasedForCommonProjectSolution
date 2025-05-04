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

namespace UIExecute.Menu.DataDetails
{
    public partial class Mainmenudetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                GetAllRoles();
                GetAllMainMenu();
            }
        }

        protected void GetAllRoles()
        {
            DataSet ds = RoleRepository.GetAllRoles();
            if (ds.Tables.Contains("Table") == true)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ddlrolename.DataSource = ds;
                    ddlrolename.DataTextField = "RoleName";
                    ddlrolename.DataValueField = "RoleID";
                    ddlrolename.DataBind();
                    ddlrolename.Items.Insert(0, "Select RoleName");
                    ddlrolename.Items.Insert(1, "Select All Role");
                }
            }
        }

        protected void GetAllMainMenu()
        {
            //  Below method means with and without mainMenu detail will be reflet. 
            // sp_GetAllMainMenu-  means result same but we want by menuId then new will create but
            //sp_GetAllMainMenuWithAndWithoutMainMenuID  means use in both

            // DataSet ds = MenuRepository.GetAllMenu(); created on 10th July
            DataSet ds = MenuRepository.GetAllMainMenuDetailWithoutByMainMenuIDForCommonUse(); // created on 14th July ---
            if (ds.Tables.Contains("Table") == true)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    grdmenu.DataSource = ds;
                    grdmenu.DataBind();
                }
            }
        }

        protected void grdmenu_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // For role permission for Edit/View/Delete and insert--
            SubMenuRepository.ApplyRolePermissionsIntoGridView(e);
        }

        protected void grdmenu_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string _menuid = Convert.ToString(e.CommandArgument.ToString());
            if (e.CommandName == "MenuEdit")
            {
                // if we click for View then we will find in redirection page every contril will be enabled true.
                // means we can Edit/Update
                string url = string.Empty;
                url = "~/Menu/Updatemainmenu.aspx?";
                //url += "edit=" + StringHelpers.Encrypt(lblorderid.Text);
                url += "MenuEditDetails=" + _menuid.ToString();
                Response.Redirect(url);

            }
            else if (e.CommandName == "MenuView")
            {              
                // if we click for View then we will find in redirection page every contril will be enabled false
                // means we can't edit/update anything
                string url = string.Empty;
                url = "~/Menu/Updatemainmenu.aspx?";
                //url += "edit=" + StringHelpers.Encrypt(_menuid.Text);
                url += "MenuViewDetails=" + _menuid.ToString();
                Response.Redirect(url);

            }
            else if (e.CommandName == "MenuDelete")
            {
                // if we click for View then we will find in redirection page every contril will be enabled false
                // means we can't edit/update anything
                string url = string.Empty;
                url = "~/Menu/Updatemainmenu.aspx?";
                //url += "edit=" + StringHelpers.Encrypt(_menuid.Text);
                url += "MenuDeleteDetails=" + _menuid.ToString();
                Response.Redirect(url);
            }
            else if (e.CommandName == "MenuInsert")
            {           
                // here:  if click on insert then open the page without query string just create new MenuHead page
                lblmsg.Text = "Selected Insert" + _menuid;
            }
        }

        protected void grdmenu_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdmenu.PageIndex = e.NewPageIndex;
            GetAllMainMenu();
        }

        protected void btndefaultview_Click(object sender, EventArgs e)
        {
            GetAllMainMenu();
        }

        protected void ddlrolename_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlrolename.SelectedValue != "Select RoleName")
            {
                if (ddlrolename.SelectedValue != "Select All Role")
                {
                    lblmsg.Visible = false;
                    MenuDTO _MRoleDTO = new MenuDTO
                    {
                        RoleID = Convert.ToInt32(ddlrolename.SelectedValue)
                    };
                    // DataSet _dsRoleID = MenuRepository.GetAllMainMenuDetailWithByRoleID(ref _MRoleDTO);
                    //   Both are same work and give result.  below Sp for Three Condition and above Sp is for Two Condition we can use
                    DataSet _dsRoleID = MenuRepository.GetAllMainMenuDetailWithByRoleIDNotMenuID(ref _MRoleDTO);
                    if (_dsRoleID.Tables.Contains("Table") == true)
                    {
                        if (_dsRoleID.Tables[0].Rows.Count > 0)
                        {
                            lblmsg.Visible = false;
                            grdmenu.DataSource = _dsRoleID;
                            grdmenu.DataBind();
                        }
                        else
                        {
                            lblmsg.Visible = false;
                            // No data found, display a message in the GridView
                            grdmenu.DataSource = null;
                            grdmenu.DataBind();

                            grdmenu.EmptyDataText = "No data found.";
                            grdmenu.EmptyDataRowStyle.HorizontalAlign = HorizontalAlign.Center;
                            grdmenu.EmptyDataRowStyle.VerticalAlign = VerticalAlign.Middle;
                            grdmenu.EmptyDataRowStyle.CssClass = "empty-data-message";
                        }
                    }
                }
                else
                {
                    lblmsg.Visible = false;
                    GetAllMainMenu();
                }
            }
            else
            {
                lblmsg.Visible = true;
                lblmsg.Text = "Please select at once one option!!!";
            }
        }
    }
}