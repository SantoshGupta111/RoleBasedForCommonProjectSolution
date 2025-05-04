using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Common.Menus;
using BAL.Menus;
using System.Configuration;
using BAL.Users;


namespace UIExecute.Menu.DataDetails
{
    public partial class Submenudetails : System.Web.UI.Page
    {       
     
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                BindDataAllRoles();
                BindDataAllMainMenuName();
                GetAllMain_Sub_MainMenu();
            }
        }

        void BindDataAllRoles()
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

        void BindDataAllMainMenuName()
        {
            DataSet _dsGetAllMenuname = MenuRepository.GetAllMainMenuDetailWithoutByMainMenuIDForCommonUse();
            if(_dsGetAllMenuname.Tables.Contains("Table")==true)
            {
                if(_dsGetAllMenuname.Tables[0].Rows.Count>0)
                {
                    ddlmainmenuname.DataSource = _dsGetAllMenuname;
                    ddlmainmenuname.DataTextField = "MenuName";
                    ddlmainmenuname.DataValueField = "MenuID";
                    ddlmainmenuname.DataBind();
                    ddlmainmenuname.Items.Insert(0, "Select ManuName");
                    ddlmainmenuname.Items.Insert(1, "Select All MenuName");
                }
            }
        }

        protected void GetAllMain_Sub_MainMenu()
        {
            DataSet ds = SubMenuRepository.GetAllSubMenuDetailWithByALL_No_RoleID_Not_MainMenuID();
            if (ds.Tables.Contains("Table") == true)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    grdsubmenu.DataSource = ds;
                    grdsubmenu.DataBind();
                }
            }
        }

        // if we want Group use in gridView  please click on below link for help
        //https://www.c-sharpcorner.com/UploadFile/rahul4_saxena/showing-grouping-of-data-in-Asp-Net-grid-view/

        protected void grdsubmenu_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            SubMenuRepository.ApplyRolePermissionsIntoGridView(e);
        }

        protected void grdsubmenu_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdsubmenu.PageIndex = e.NewPageIndex;
            GetAllMain_Sub_MainMenu();
        }

        protected void grdsubmenu_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string _submenuid = Convert.ToString(e.CommandArgument.ToString());
            if (e.CommandName == "SubMenuEdit")
            {
                string url = string.Empty;
                url = "~/Menu/Updatesubmenu.aspx?";
                //url += "edit=" + StringHelpers.Encrypt(lblorderid.Text);
                url += "EditDetails=" + _submenuid.ToString();
                Response.Redirect(url);

            }
            else if (e.CommandName == "SubMenuView")
            {
                string url = string.Empty;
                url = "~/Menu/Updatesubmenu.aspx?";
                //url += "edit=" + StringHelpers.Encrypt(_menuid.Text);
                url += "ViewDetails=" + _submenuid.ToString();
                Response.Redirect(url);

            }
            else if (e.CommandName == "SubMenuDelete")
            {
                string url = string.Empty;
                url = "~/Menu/Updatesubmenu.aspx?";
                //url += "edit=" + StringHelpers.Encrypt(_menuid.Text);
                url += "DeleteDetails=" + _submenuid.ToString();
                Response.Redirect(url);
            }
            else if (e.CommandName == "SubMenuInsert")
            {
                lblmsg.Text = "Selected Insert" + _submenuid;
            }
        }

        protected void btndefaultview_Click(object sender, EventArgs e)
        {
            GetAllMain_Sub_MainMenu();
        }

        protected void ddlrolename_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindDataAllMainMenuName();
            if (ddlrolename.SelectedValue!= "Select RoleName")
            {
                if(ddlrolename.SelectedValue!= "Select All Role")
                {
                    SubMenuDTO _SMDto = new SubMenuDTO
                    {
                        RoleId = Convert.ToInt32(ddlrolename.SelectedValue)
                    };
                    DataSet _dsrole = SubMenuRepository.GetAllSubMenuDetailWithBy_RoleID_Not_MainMenuID(ref _SMDto);
                    if (_dsrole.Tables.Contains("Table")==true)
                    {
                        if(_dsrole.Tables[0].Rows.Count>0)
                        {
                            lblmsg.Visible = false;
                            grdsubmenu.DataSource = _dsrole;
                            grdsubmenu.DataBind();
                        }
                        else
                        {
                            lblmsg.Visible = false;
                            // No data found, display a message in the GridView
                            grdsubmenu.DataSource = null;
                            grdsubmenu.DataBind();

                            grdsubmenu.EmptyDataText = "No data found.";
                            grdsubmenu.EmptyDataRowStyle.HorizontalAlign = HorizontalAlign.Center;
                            grdsubmenu.EmptyDataRowStyle.VerticalAlign = VerticalAlign.Middle;
                            grdsubmenu.EmptyDataRowStyle.CssClass = "empty-data-message";
                        }
                    }
                    
                }
                else
                {
                    lblmsg.Visible = false;
                    GetAllMain_Sub_MainMenu();
                }
            }
            else
            {
                lblmsg.Visible = true;
                lblmsg.Text = "Please select at once one option!!!";
            }
      
        }

        protected void ddlmainmenuname_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindDataAllRoles();
           if (ddlmainmenuname.SelectedValue != "Select ManuName")
            {
                if (ddlmainmenuname.SelectedValue != "Select All MenuName")
                {
                    SubMenuDTO _SMDto = new SubMenuDTO
                    {
                       MainMenuID = Convert.ToInt32(ddlmainmenuname.SelectedValue)
                    };
                    DataSet _dsrole = SubMenuRepository.GetAllSubMenuDetailWithBy_MainMenuID_Not_RoleID(ref _SMDto);
                    if (_dsrole.Tables.Contains("Table") == true)
                    {
                        if (_dsrole.Tables[0].Rows.Count > 0)
                        {
                            lblmsg.Visible = false;
                            grdsubmenu.DataSource = _dsrole;
                            grdsubmenu.DataBind();
                        }
                        else
                        {
                            lblmsg.Visible = false;
                            // No data found, display a message in the GridView
                            grdsubmenu.DataSource = null;
                            grdsubmenu.DataBind();

                            grdsubmenu.EmptyDataText = "No data found.";
                            grdsubmenu.EmptyDataRowStyle.HorizontalAlign = HorizontalAlign.Center;
                            grdsubmenu.EmptyDataRowStyle.VerticalAlign = VerticalAlign.Middle;
                            grdsubmenu.EmptyDataRowStyle.CssClass = "empty-data-message";
                        }
                    }

                }
                else
                {
                    lblmsg.Visible = false;
                    GetAllMain_Sub_MainMenu();
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



