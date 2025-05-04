using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common.Menus;
using Common.Users;
using System.Data;
using System.Data.SqlClient;


namespace DAL.Menus
{
   public class SubMenuDb:DALBase
    {
        // Insert

       public static void NewInsertSubMenu(ref SubMenuDTO _insertSubMenu)
        {
            string message = string.Empty;
            // SqlCommand cmd = GetDbSprocCommand("sp_NewInsertSubMenu");   // good working
            SqlCommand cmd = GetDbSprocCommand("sp_InsertSubMenuWithRolePermission");  // for insert into multiple table with rolepermission
            cmd.Parameters.Add(CreateParameter("@SubMenuName", _insertSubMenu.submenuname,50));
            cmd.Parameters.Add(CreateParameter("@SubMenuUrl", _insertSubMenu.submenuurl, 200));
            cmd.Parameters.Add(CreateParameter("@SubMenuDescription", _insertSubMenu.submenudescription, 200));
            cmd.Parameters.Add(CreateParameter("@SubMenuDisplaySequence", _insertSubMenu.submenudisplaysequence));
            cmd.Parameters.Add(CreateParameter("@IsActive", _insertSubMenu.IsActive));
            cmd.Parameters.Add(CreateParameter("@MainmenuID", _insertSubMenu.MainMenuID));
            cmd.Parameters.Add(CreateParameter("@RoleID", _insertSubMenu.RoleId));
            cmd.Parameters.Add(CreateParameter("@CreatedDate", _insertSubMenu.CreatedDate));
            //cmd.Parameters.Add(CreateParameter("@CanView",false));
            //cmd.Parameters.Add(CreateParameter("@CanEdit", false));
            //cmd.Parameters.Add(CreateParameter("@CanDelete", false));
            //cmd.Parameters.Add(CreateParameter("@CanInsert", false));
            //cmd.Parameters.Add(CreateParameter("@CanNone", false));


            // for help https://www.c-sharpcorner.com/UploadFile/rohatash/get-out-parameter-from-a-stored-procedure-in-Asp-Net/
            // Check already exists from store procedure. 
            cmd.Parameters.Add("@ERROR", SqlDbType.Char, 500);
            cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
            cmd.Connection.Open();
            cmd.ExecuteNonQuery();
            message = (string)cmd.Parameters["@ERROR"].Value;
            _insertSubMenu.ERROR = message;   // assign for display message in aspx page
            cmd.Connection.Close();

        }

        // Update

        public static void UpdateSubMenu(ref SubMenuDTO _updateSubMenu)
        {
            string message = string.Empty;
            SqlCommand cmd = GetDbSprocCommand("sp_updateSubMenus");
            cmd.Parameters.Add(CreateParameter("@SubMenuID", _updateSubMenu.submenuid));
            cmd.Parameters.Add(CreateParameter("@SubMenuName", _updateSubMenu.submenuname, 50));
            cmd.Parameters.Add(CreateParameter("@SubMenuUrl", _updateSubMenu.submenuurl, 200));
            cmd.Parameters.Add(CreateParameter("@SubMenuDescription", _updateSubMenu.submenudescription, 200));
            cmd.Parameters.Add(CreateParameter("@SubMenuDisplaySequence", _updateSubMenu.submenudisplaysequence));
            cmd.Parameters.Add(CreateParameter("@IsActive", _updateSubMenu.IsActive));
            cmd.Parameters.Add(CreateParameter("@MainmenuID", _updateSubMenu.MainMenuID));
            cmd.Parameters.Add(CreateParameter("@RoleID", _updateSubMenu.RoleId));

            // for help https://www.c-sharpcorner.com/UploadFile/rohatash/get-out-parameter-from-a-stored-procedure-in-Asp-Net/
            // Check already exists from store procedure. 

            cmd.Parameters.Add("@ERROR", SqlDbType.Char, 500);
            cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
            cmd.Connection.Open();
            cmd.ExecuteNonQuery();
            message = (string)cmd.Parameters["@ERROR"].Value;
            _updateSubMenu.ERROR = message;  // assign for display message in aspx page
            cmd.Connection.Close();

        }


        public static DataSet GetAllRolesAssignedToMainMenu()
        {
            DataSet ds =ExecuteSelectDsCommand("sp_GetAllRolesAssignedToMainMenu", CommandType.StoredProcedure);
            return ds;
        }

        public static DataSet GetAllMenuBySelectedRole(ref MenuDTO _SelectMenu)
        {
            // help this link for implement: https://stackoverflow.com/questions/55063442/sqlcommand-c-sharp-method-with-sql-paramather

            SqlParameter[] myparam = new SqlParameter[1];

            myparam[0] = new SqlParameter("@RoleID", SqlDbType.NVarChar, 50);
            myparam[0].Value = _SelectMenu.RoleID;

            //myparam[1] = new SqlParameter("@password", SqlDbType.NVarChar, 50);
            //myparam[1].Value = _user.Password;

            DataSet ds =ExecuteParamerizedSelectDsCommand("sp_GetMenuBySelectRole", CommandType.StoredProcedure,myparam);
            return ds;
        }


        // For RolePermission ----- select Role then appear from rolePermission with submenu table  
        // 25th June 23 created

        public static DataSet GetAllSubMenuBySelectedRoleForRolePermission(ref SubMenuDTO _SelectID)
        {
            // help this link for implement: https://stackoverflow.com/questions/55063442/sqlcommand-c-sharp-method-with-sql-paramather

            SqlParameter[] myparam = new SqlParameter[1];

            myparam[0] = new SqlParameter("@RoleID", SqlDbType.Int);
            myparam[0].Value = _SelectID.RoleId;

            //myparam[1] = new SqlParameter("@password", SqlDbType.NVarChar, 50);
            //myparam[1].Value = _user.Password;

            DataSet ds = ExecuteParamerizedSelectDsCommand("sp_GetSubMenuOnClickOnRoles", CommandType.StoredProcedure, myparam);
            return ds;
        }

        //  Get SubMenu ID for RolePermission Purpose after click on Child Node SubMenu Url Page
        public static DataSet RetrieveSubMenuId(ref SubMenuDTO _Getdetail)
        {
            SqlParameter[] myparam = new SqlParameter[3];

            myparam[0] = new SqlParameter("@RoleID", SqlDbType.Int);
            myparam[0].Value = _Getdetail.RoleId;

            myparam[1] = new SqlParameter("@MainMenuID", SqlDbType.Int);
            myparam[1].Value = _Getdetail.MainMenuID;

            myparam[2] = new SqlParameter("@SubMenuUrl", SqlDbType.NVarChar,200);
            myparam[2].Value = _Getdetail.submenuurl;

            DataSet _ds = ExecuteParamerizedSelectDsCommand("sp_GetSubMenuID",CommandType.StoredProcedure, myparam);

            return _ds;
             
        }

        public static DataSet RetrieveSubMenuId_(string currentUrl, int roleId, int mainMenuId)
        {
            SqlParameter[] myparam = new SqlParameter[3];

            myparam[0] = new SqlParameter("@SubMenuUrl", SqlDbType.NVarChar, 200);
            myparam[0].Value = currentUrl;

            myparam[1] = new SqlParameter("@RoleID", SqlDbType.Int);
            myparam[0].Value = roleId;

            myparam[2] = new SqlParameter("@MainMenuID", SqlDbType.Int);
            myparam[0].Value = mainMenuId;

          

            DataSet _ds = ExecuteParamerizedSelectDsCommand("sp_GetSubMenuID", CommandType.StoredProcedure, myparam);

            return _ds;

        }

        public static DataSet GetAllMain_Sub_Menu()
        {
            DataSet ds = ExecuteSelectDsCommand("sp_GetAllMain_sub_Menu", CommandType.StoredProcedure);
            return ds;
        }

        // create Sp on 12th July  1 AM - midnight
        public static DataSet GetAllSubMenuDetailWithoutBySubMenuIDForCommonUse()
        {
            DataSet ds = ExecuteSelectDsCommand("sp_GetAllSubMenuWithAndWithoutSubMenuID", CommandType.StoredProcedure);
            return ds;
        }

        public static DataSet GetAllSubMenuDetailWithBySubMenuID(ref SubMenuDTO _SMenuID)
        {
            SqlParameter[] myparam = new SqlParameter[1];

            myparam[0] = new SqlParameter("@SubMenuID", SqlDbType.Int);
            myparam[0].Value = _SMenuID.submenuid;

           
            DataSet ds =ExecuteParamerizedSelectDsCommand("sp_GetAllSubMenuWithAndWithoutSubMenuID", CommandType.StoredProcedure,myparam);
            return ds;
        }


        //create method 15th July  use of Multiple condition with three - Either- byMainMenuID   or ByRoleID  or ByAll
        public static DataSet GetAllSubMenuDetailWithBy_MainMenuID_Not_RoleID(ref SubMenuDTO _mainMenuID)
        {
            SqlParameter[] myparam = new SqlParameter[1];

            myparam[0] = new SqlParameter("@MainMenuID", SqlDbType.Int);
            myparam[0].Value = _mainMenuID.MainMenuID;

            // This Sp is used for Multiple use as ByMainMenuID  or  RoleID  or AllDetail
            DataSet ds = ExecuteParamerizedSelectDsCommand("sp_GetAllSubMenuWithAndWithoutByMainMenuID_OR_RoleID", CommandType.StoredProcedure, myparam);
            return ds;
        }

        //create method 15th July  use of Multiple condition with three - Either- byMainMenuID   or ByRoleID  or ByAll
        public static DataSet GetAllSubMenuDetailWithBy_RoleID_Not_MainMenuID(ref SubMenuDTO _roleID)
        {
            SqlParameter[] myparam = new SqlParameter[1];

            myparam[0] = new SqlParameter("@RoleID", SqlDbType.Int);
            myparam[0].Value = _roleID.RoleId;

            // This Sp is used for Multiple use as ByMainMenuID  or  RoleID  or AllDetail
            DataSet ds = ExecuteParamerizedSelectDsCommand("sp_GetAllSubMenuWithAndWithoutByMainMenuID_OR_RoleID", CommandType.StoredProcedure, myparam);
            return ds;
        }

        public static DataSet GetAllSubMenuDetailWithByALL_No_RoleID_Not_MainMenuID()
        {
            DataSet ds = ExecuteSelectDsCommand("sp_GetAllSubMenuWithAndWithoutByMainMenuID_OR_RoleID", CommandType.StoredProcedure);
            return ds;
        }


    }
}
