using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common.Menus;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Web;


namespace DAL.Menus
{
   public class RolePermissionDb:DALBase
    {
        // This below method is not working in Bulk update from GridView of RolePermission due to not List used
        public static void UpdateRolePermissionByRoleID_ForSingRow(ref RolePermissionDTO _updateRP)
        {
            SqlCommand cmd =GetDbSprocCommand("sp_updateRolePermissionByRoleID");
         
            cmd.Parameters.Add(CreateParameter("@CanEdit", _updateRP.CanEdit));
            cmd.Parameters.Add(CreateParameter("@CanView", _updateRP.CanView));
            cmd.Parameters.Add(CreateParameter("@CanDelete", _updateRP.CanDelete));
            cmd.Parameters.Add(CreateParameter("@CanInsert", _updateRP.CanInsert));
            cmd.Parameters.Add(CreateParameter("@ID", _updateRP.ID));

            cmd.Connection.Open();
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();

        }

        public static void UpdateRolePermissionByRoleID(List<RolePermissionDTO> rolePermissions)
        {
            //using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["conNewprojectdemoDB"].ConnectionString.ToString()))
            using (SqlConnection connection = new SqlConnection(DALBase.ProtectedConnectionString))
            {
                connection.Open();

                using (SqlTransaction transaction = connection.BeginTransaction())
                {
                    try
                    {
                        foreach (RolePermissionDTO permission in rolePermissions)
                        {
                            int id = permission.ID;
                            bool canEdit = permission.CanEdit;
                            bool canView = permission.CanView;
                            bool canDelete = permission.CanDelete;
                            bool canInsert = permission.CanInsert;

                            SqlCommand command = connection.CreateCommand();
                            command.Transaction = transaction;

                            //--  If we want query syntax then below can use. and by defualt commandtype.Text . can we do or do'not mention this 
                            //command.CommandText = "UPDATE tbl_rolepermissions SET CanEdit = @CanEdit, CanView = @CanView, CanDelete = @CanDelete, CanInsert = @CanInsert WHERE ID = @ID";
                            
                            //--- if we want store procedure call then below code use.
                            command.CommandText = "sp_updateRolePermissionByRoleID";
                            command.CommandType = CommandType.StoredProcedure;
                            command.Parameters.AddWithValue("@CanEdit", canEdit);
                            command.Parameters.AddWithValue("@CanView", canView);
                            command.Parameters.AddWithValue("@CanDelete", canDelete);
                            command.Parameters.AddWithValue("@CanInsert", canInsert);
                            command.Parameters.AddWithValue("@ID", id);

                            command.ExecuteNonQuery();
                        }

                        transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        // Handle the exception or rethrow it
                        throw ex;
                    }
                }
            }
        }





        // Method Created  1st July 2023
        // For purpose-  RolePermissionAccessbility for the Action Button On GridView as per RoleID [View/Edit/Delete & Insert]
        // This method has been used in Gridview of UserDetail.aspx.cs page into Account Folder
        public static void ApplyRolePermissionsIntoGridView(GridViewRowEventArgs e)
        {
            int roleId = Convert.ToInt32(HttpContext.Current.Session["userrole"]);
            int mainMenuId = Convert.ToInt32(HttpContext.Current.Session["Action"]);
            string currentUrl = HttpContext.Current.Request.Url.PathAndQuery;

            SubMenuDTO sm = new SubMenuDTO
            {
                RoleId = roleId,
                MainMenuID = mainMenuId,
                submenuurl = currentUrl
            };

            // DataSet ds = SubMenuRepository.RetrieveSubMenuId(ref sm); // Get SubMenuID
            DataSet ds =SubMenuDb.RetrieveSubMenuId(ref sm); // Get SubMenuID
            if (ds.Tables.Contains("Table") && ds.Tables[0].Rows.Count > 0)
            {
                int submenuId = Convert.ToInt32(ds.Tables[0].Rows[0]["SubMenuID"]);

                HttpContext.Current.Session["submenuid"] = submenuId.ToString();
            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Button lnkEdit = (Button)e.Row.FindControl("lnkEdit");
                Button lnkView = (Button)e.Row.FindControl("lnkView");
                Button lnkDelete = (Button)e.Row.FindControl("lnkDelete");
                Button lnkInsert = (Button)e.Row.FindControl("lnkInsert");

                int submenuId = Convert.ToInt32(HttpContext.Current.Session["submenuid"]);
                bool canEdit = GetRolePermission(roleId, submenuId, "CanEdit");
                bool canView = GetRolePermission(roleId, submenuId, "CanView");
                bool canDelete = GetRolePermission(roleId, submenuId, "CanDelete");
                bool canInsert = GetRolePermission(roleId, submenuId, "CanInsert");

                lnkEdit.Visible = canEdit;
                lnkView.Visible = canView;
                lnkDelete.Visible = canDelete;
                lnkInsert.Visible = canInsert;

                lnkEdit.Enabled = canEdit;
                lnkView.Enabled = canView;
                lnkDelete.Enabled = canDelete;
                lnkInsert.Enabled = canInsert;
            }
        }

        // This below method use for Normal button can be show or hide accordingly role based in any simple content form within master page
        //   this has been used in form as  "Newadmissionform.aspx.cs"   into account folder
        //   please mention button name should be same but you can any other name apply with text like btn name is btnedit 
        //and display should be "Update" yes it is possiblebut btnedit is fixed for the each and every pages which you want apply as role permission
        public static void ApplyRolePermissionsToButtons(Button btnEdit = null, Button btnView = null, Button btnDelete = null, Button btnInsert = null)
        {
            int roleId = Convert.ToInt32(HttpContext.Current.Session["userrole"]);
            int mainMenuId = Convert.ToInt32(HttpContext.Current.Session["Action"]);
            string currentUrl_1= HttpContext.Current.Request.Url.PathAndQuery; // Get page url
            string currentUrl_2 = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Path);  // get url with host name without query string

            // check below for both-  if normal or with query string redirect page.  this is good for always
            string currentUrl = HttpContext.Current.Request.Url.PathAndQuery;
            int queryStringIndex = currentUrl.IndexOf('?');
            if (queryStringIndex >= 0)
            {
                currentUrl = currentUrl.Substring(0, queryStringIndex);
            }


            int submenuId;

            SubMenuDTO sm = new SubMenuDTO
            {
                RoleId = roleId,
                MainMenuID = mainMenuId,
                submenuurl = currentUrl
            };

            DataSet ds = SubMenuDb.RetrieveSubMenuId(ref sm); // Get SubMenuID
            if (ds.Tables.Contains("Table") && ds.Tables[0].Rows.Count > 0)
            {
                submenuId = Convert.ToInt32(ds.Tables[0].Rows[0]["SubMenuID"]);

                HttpContext.Current.Session["submenuid"] = submenuId.ToString();
            }

            submenuId = Convert.ToInt32(HttpContext.Current.Session["submenuid"]);

            if (btnEdit != null)
            {
                bool canEdit = GetRolePermission(roleId, submenuId, "CanEdit");
                btnEdit.Visible = canEdit;
                btnEdit.Enabled = canEdit;
            }

            if (btnView != null)
            {
                bool canView = GetRolePermission(roleId, submenuId, "CanView");
                btnView.Visible = canView;
                btnView.Enabled = canView;
            }
            if (btnDelete != null)
            {
                bool canDelete = GetRolePermission(roleId, submenuId, "CanDelete");
                btnDelete.Visible = canDelete;
                btnDelete.Enabled = canDelete;
            }

            if (btnInsert != null)
            {
                bool canInsert = GetRolePermission(roleId, submenuId, "CanInsert");
                btnInsert.Visible = canInsert;
                btnInsert.Enabled = canInsert;
            }
        }
               
        private static bool GetRolePermission(int roleId, int submenuId, string permissionColumn)
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


    }
}
