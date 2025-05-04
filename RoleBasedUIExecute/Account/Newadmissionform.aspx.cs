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

namespace UIExecute.Account
{
    public partial class Newadmissionform : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                //GetActionButton();  // create below method..
                SubMenuRepository.ApplyRolePermissionsToButtons(btnedit, btnView, btndelete, btninsert);
            }
        }

        #region  Code below  and working fine.  but for reduce code we have implemented in Method Class and call for eachpages..with below one also method name [GetRolePermission]  both are commented due to create new method function for the same working...
        //protected void GetActionButton()
        //{
        //    int _roleId = Convert.ToInt32(Session["userrole"]);
        //    int _mainmenuID = Convert.ToInt32(Session["Action"].ToString());
        //    int _submenuID;
        //    string _currentUrl = HttpContext.Current.Request.Url.PathAndQuery;
        //    SubMenuDTO _SM = new SubMenuDTO
        //    {
        //        RoleId = _roleId,
        //        MainMenuID = _mainmenuID,
        //        submenuurl = _currentUrl.ToString()
        //    };

        //    DataSet ds = SubMenuRepository.RetrieveSubMenuId(ref _SM); // Get SubMenuID
        //    if (ds.Tables.Contains("Table") == true)
        //    {
        //        if (ds.Tables[0].Rows.Count > 0)
        //        {
        //            _submenuID = Convert.ToInt32(ds.Tables[0].Rows[0]["SubMenuID"].ToString());

        //            //lblSubMenuID.Text = ds.Tables[0].Rows[0]["SubMenuID"].ToString();
        //            Session["submenuid"] = _submenuID.ToString();
        //        }
        //    }
              
        //        // Retrieve the role permissions for the given role ID and submenu ID
        //        int _SMID = Convert.ToInt32(Session["submenuid"]);
        //        bool canEdit = GetRolePermission(_roleId, _SMID, "CanEdit");
        //        bool canView = GetRolePermission(_roleId, _SMID, "CanView");
        //        bool canDelete = GetRolePermission(_roleId, _SMID, "CanDelete");
        //        bool canInsert = GetRolePermission(_roleId, _SMID, "CanInsert");

        //        // Set the button visibility based on role permissions
        //        btnedit.Visible = canEdit;
        //        btnView.Visible = canView;
        //        btndelete.Visible = canDelete;
        //        btninsert.Visible = canInsert;

        //    // Enable or disable the buttons as needed
        //        btnedit.Enabled = canEdit;
        //        btnView.Enabled = canView;
        //        btndelete.Enabled = canDelete;
        //        btninsert.Enabled = canInsert;
         
        //}
       
        //private bool GetRolePermission(int roleId, int submenuId, string permissionColumn)
        //{
        //    bool hasPermission = false;
        //    string connectionString = DAL.DALBase.PublicConnectionString;

        //    using (SqlConnection connection = new SqlConnection(connectionString))
        //    {
        //        string query = "SELECT " + permissionColumn + " FROM tbl_RolePermissions WHERE RoleId = @RoleId AND SubmenuId = @SubmenuId";
        //        SqlCommand command = new SqlCommand(query, connection);
        //        command.Parameters.AddWithValue("@RoleId", roleId);
        //        command.Parameters.AddWithValue("@SubmenuId", submenuId);
        //        connection.Open();
        //        object result = command.ExecuteScalar();

        //        if (result != null && result != DBNull.Value)
        //        {
        //            hasPermission = Convert.ToBoolean(result);
        //        }
        //    }

        //    return hasPermission;
        //}

        #endregion
    }
}