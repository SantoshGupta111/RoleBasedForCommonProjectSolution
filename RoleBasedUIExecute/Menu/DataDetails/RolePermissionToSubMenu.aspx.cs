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
using System.Configuration;

namespace UIExecute.Menu.DataDetails
{
    public partial class RolePermissionToSubMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                GetAllRoles();
            }
        }

        protected override void OnInit(EventArgs e)
        {
            InitializeComponent();
            base.OnInit(e);
        }

        private void InitializeComponent()
        {
            this.ddlrole.SelectedIndexChanged += new System.EventHandler(this.ddlRoleSelectIndexChanged);
            this.btnupdaterolepermission.Click += new System.EventHandler(this.UpdateRolePermissionInBulk);
        }

        void ddlRoleSelectIndexChanged(object sender, EventArgs e)
        {
            SubMenuDTO _GetID = GetSubMenuDTOFromForm();
            DataSet _dsSubMenu = SubMenuRepository.GetAllSubMenuBySelectedRoleForRolePermission(ref _GetID);
            if(_dsSubMenu.Tables.Contains("Table")==true)
            {
                if(_dsSubMenu.Tables[0].Rows.Count>0)
                {
                    btnupdaterolepermission.Visible = true;
                    grdrolepermission.DataSource = _dsSubMenu;
                    grdrolepermission.DataBind();
                }
                else
                {
                    btnupdaterolepermission.Visible = false;
                    // No data found, display a message in the GridView
                    grdrolepermission.DataSource = null;
                    grdrolepermission.DataBind();

                    grdrolepermission.EmptyDataText = "No data found.";
                    grdrolepermission.EmptyDataRowStyle.HorizontalAlign = HorizontalAlign.Center;
                    grdrolepermission.EmptyDataRowStyle.VerticalAlign = VerticalAlign.Middle;
                    grdrolepermission.EmptyDataRowStyle.CssClass = "empty-data-message";
                }
            }
            
        }


        //  This will work through  Function from 
        // DAL class which has use of List<RolePermissionDTO> rolePermissions = new List<RolePermissionDTO>();

        void UpdateRolePermissionInBulk(object sender, EventArgs e)
        {
            //  if use of calling Method (" public static void UpdateRolePermissionByRoleID(List<RolePermissionDTO> rolePermissions)"
            // the use below line otherwise direct method which has created in this class not use this line

            List<RolePermissionDTO> rolePermissions = new List<RolePermissionDTO>();

            foreach (GridViewRow grd in grdrolepermission.Rows)
            {                
                RolePermissionDTO _rolePermission = new RolePermissionDTO();
                CheckBox chkselect = (CheckBox)grd.FindControl("chkSelect");
                //if (chkselect.Checked)  // if Checked in FirstColumn for one of then or All selected one time condition,but here is no suitable. now code is comment in design
                //{
                    Label _lblID = (Label)grd.FindControl("lblID");
                    int id = Convert.ToInt32(_lblID.Text);
                    _rolePermission.ID = id;
                    Label _roleid = (Label)grd.FindControl("lblroleid");

                CheckBox chkCanEdit = (CheckBox)grd.FindControl("chkcanEdit");
                bool canEdit = chkCanEdit.Checked;
               // string displayValueEdit = canEdit ? "True" : "False";


                CheckBox chkCanView = (CheckBox)grd.FindControl("chkcanview");
                bool canView = chkCanView.Checked;
               // string displayValueView = canView ? "True" : "False";

                CheckBox chkCanDelete = (CheckBox)grd.FindControl("chkcanDelete");
                bool canDelete = chkCanDelete.Checked;
                //string displayValueDelete = canDelete ? "True" : "False";

                CheckBox chkCanInsert = (CheckBox)grd.FindControl("chkcanInsert");
                bool canInsert = chkCanInsert.Checked;
               // string displayValueInsert = canInsert ? "True" : "False";

                _rolePermission.RoleID = Convert.ToInt32(ddlrole.SelectedValue);

                _rolePermission.ID = id;
                _rolePermission.CanEdit = canEdit;
                _rolePermission.CanView = canView;
                _rolePermission.CanDelete = canDelete;
                _rolePermission.CanInsert = canInsert;

                rolePermissions.Add(_rolePermission);  //  If we will use List then add with object name of ListObject name

                // Here  If you want update through Method function from DAL then use below
                RolePermissionRepository.UpdateRolePermissionByRoleID(rolePermissions);  // assigned Object Name of ( List<RolePermissionDTO> rolePermissions = new List<RolePermissionDTO>();)

                // Here if you want update normal below method in this class then use below
                //       working is same for both sanerio....

                //UpdateRolePermission(ref _rolePermission);    //  assigned Object Name (RolePermissionDTO _rolePermission = new RolePermissionDTO();

                //}   // for checkList selection closing
            }
            lblmsg.Text = "Role Permission has been Updateded Successfully";

        }
            
                //  Below code was working but  now not used .  we have called method.  
            private void UpdateRolePermission(ref RolePermissionDTO _rolePR)
            {              
               using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["conNewprojectdemoDB"].ConnectionString))
                {
                SqlCommand command = new SqlCommand("sp_updateRolePermissionByRoleID", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@CanView", _rolePR.CanView);
                command.Parameters.AddWithValue("@CanEdit", _rolePR.CanEdit);
                command.Parameters.AddWithValue("@CanDelete", _rolePR.CanDelete);
                command.Parameters.AddWithValue("@CanInsert", _rolePR.CanInsert);
                command.Parameters.AddWithValue("@ID", _rolePR.ID);

                connection.Open();
                command.ExecuteNonQuery();
                }
             }

       


        protected SubMenuDTO GetSubMenuDTOFromForm()
        {
            SubMenuDTO _subMenu = new SubMenuDTO();
            _subMenu.RoleId = Convert.ToInt32(ddlrole.SelectedValue);
            return _subMenu;
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



        //   below code for Checked all or one of then for updation

        protected void chkSelectAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chkSelectAll = (CheckBox)grdrolepermission.HeaderRow.FindControl("chkSelectAll");

            foreach (GridViewRow row in grdrolepermission.Rows)
            {
                CheckBox chkSelect = (CheckBox)row.FindControl("chkSelect");
                chkSelect.Checked = chkSelectAll.Checked;
            }
        }


    }
}