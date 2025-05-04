using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common.Menus;
using DAL.Menus;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace BAL.Menus
{
    public class SubMenuRepository
    {

        public static void NewInsertSubMenu(ref SubMenuDTO _insertSubMenu)
        {
            SubMenuDb.NewInsertSubMenu(ref _insertSubMenu);
        }
        public static void UpdateSubMenu(ref SubMenuDTO _updateSubMenu)
        {
            SubMenuDb.UpdateSubMenu(ref _updateSubMenu);
        }



        public static DataSet GetAllRolesAssignedToMainMenu()
        {
            return SubMenuDb.GetAllRolesAssignedToMainMenu();
        }

        public static DataSet GetAllMenuBySelectedRole(ref MenuDTO _SelectMenu)
        {
            return SubMenuDb.GetAllMenuBySelectedRole(ref _SelectMenu);
        }

        // For RolePermission ----- select Role then appear from rolePermission with submenu table  
        // 25th June 23 created
        public static DataSet GetAllSubMenuBySelectedRoleForRolePermission(ref SubMenuDTO _SelectID)
        {
            return SubMenuDb.GetAllSubMenuBySelectedRoleForRolePermission(ref _SelectID);
        }

        public static DataSet RetrieveSubMenuId(ref SubMenuDTO _Getdetail)
        {
            return SubMenuDb.RetrieveSubMenuId(ref _Getdetail);
        }


        // Method Created  1st July 2023
        // For purpose-  RolePermissionAccessbility for the Action Button On GridView as per RoleID [View/Edit/Delete & Insert]

        public static void ApplyRolePermissionsIntoGridView(GridViewRowEventArgs e)
        {
            RolePermissionDb.ApplyRolePermissionsIntoGridView(e);
        }

        public static void ApplyRolePermissionsToButtons(Button btnEdit = null, Button btnView = null, Button btnDelete = null, Button btnInsert = null)
        {
            RolePermissionDb.ApplyRolePermissionsToButtons(btnEdit, btnView, btnDelete, btnInsert);
        }

        public static DataSet GetAllMain_Sub_Menu()
        {
            return SubMenuDb.GetAllMain_Sub_Menu();
        }

        public static DataSet GetAllSubMenuDetailWithoutBySubMenuIDForCommonUse()
        {
            return SubMenuDb.GetAllSubMenuDetailWithoutBySubMenuIDForCommonUse();
        }

        public static DataSet GetAllSubMenuDetailWithBySubMenuID(ref SubMenuDTO _SMenuID)
        {
            return SubMenuDb.GetAllSubMenuDetailWithBySubMenuID(ref _SMenuID);
        }

        public static DataSet GetAllSubMenuDetailWithBy_MainMenuID_Not_RoleID(ref SubMenuDTO _mainMenuID)
        {
            return SubMenuDb.GetAllSubMenuDetailWithBy_MainMenuID_Not_RoleID(ref _mainMenuID);
        }
        public static DataSet GetAllSubMenuDetailWithBy_RoleID_Not_MainMenuID(ref SubMenuDTO _roleID)
        {
            return SubMenuDb.GetAllSubMenuDetailWithBy_RoleID_Not_MainMenuID(ref _roleID);
        }

        public static DataSet GetAllSubMenuDetailWithByALL_No_RoleID_Not_MainMenuID()
        {
            return SubMenuDb.GetAllSubMenuDetailWithByALL_No_RoleID_Not_MainMenuID();
        }
    }
}

