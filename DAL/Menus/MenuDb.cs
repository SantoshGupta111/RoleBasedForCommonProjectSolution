using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common.Menus;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DAL.Menus
{
  public class MenuDb:DALBase
    {
        public static void NewCreateMenu(ref MenuDTO _insertMenu)
        {
            string message = string.Empty;
            SqlCommand cmd = GetDbSprocCommand("sp_newinsertMenus");
            cmd.Parameters.Add(CreateParameter("MenuName", _insertMenu.MenuName, 50));
            cmd.Parameters.Add(CreateParameter("@MenuUrl", _insertMenu.MenuUrl, 200));
            cmd.Parameters.Add(CreateParameter("@MenuDescription", _insertMenu.MenuDescription, 200));
            cmd.Parameters.Add(CreateParameter("@DisplaySequence", _insertMenu.DisplaySequence));
            cmd.Parameters.Add(CreateParameter("@IsActive", _insertMenu.IsActive));
            cmd.Parameters.Add(CreateParameter("@RoleID", _insertMenu.RoleID));
            //cmd.Parameters.Add(CreateParameter("@CreatedDate", _insertMenu.CreateDate));

            // for help https://www.c-sharpcorner.com/UploadFile/rohatash/get-out-parameter-from-a-stored-procedure-in-Asp-Net/
            // Check already exists from store procedure. 
            cmd.Parameters.Add("@ERROR", SqlDbType.Char, 500);
            cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
            cmd.Connection.Open();
            cmd.ExecuteNonQuery();
            message = (string)cmd.Parameters["@ERROR"].Value;
            _insertMenu.ERROR = message;   // assign for display message in aspx page
            cmd.Connection.Close();

        }
       

        // Update tbl_mainMenu  -- Note:  here RoleID will updated into tbl_mainMenu but also impact and update into
        // tbl_subMenu and tbl_rolePermissions.  because  this is Master data MainMenu table and this is mainMaster Menu..

        public static void UpdateMainMenu(ref MenuDTO _updateMainMenu)
        {
            string message = string.Empty;
            SqlCommand cmd = GetDbSprocCommand("sp_updateMainMenus");
            cmd.Parameters.Add(CreateParameter("@MenuID", _updateMainMenu.MenuID));
            cmd.Parameters.Add(CreateParameter("@MenuName", _updateMainMenu.MenuName, 50));
            cmd.Parameters.Add(CreateParameter("@MenuUrl", _updateMainMenu.MenuUrl, 200));
            cmd.Parameters.Add(CreateParameter("@MenuDescription", _updateMainMenu.MenuDescription, 200));
            cmd.Parameters.Add(CreateParameter("@DisplaySequence", _updateMainMenu.DisplaySequence));
            cmd.Parameters.Add(CreateParameter("@IsActive", _updateMainMenu.IsActive));
            cmd.Parameters.Add(CreateParameter("@RoleId", _updateMainMenu.RoleID));
            // for help https://www.c-sharpcorner.com/UploadFile/rohatash/get-out-parameter-from-a-stored-procedure-in-Asp-Net/
            // Check already exists from store procedure. 
            cmd.Parameters.Add("@ERROR", SqlDbType.Char, 500);
            cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
            cmd.Connection.Open();
            cmd.ExecuteNonQuery();
            message = (string)cmd.Parameters["@ERROR"].Value;
            _updateMainMenu.ERROR = message;   // assign for display message in aspx page
            cmd.Connection.Close();

        }

        public static DataSet GetAllMenu()
        {
            DataSet ds = ExecuteSelectDsCommand("sp_GetAllMainMenu", CommandType.StoredProcedure);
            return ds;
        }

        public static DataSet GetMainMenuHeader(ref MenuDTO _Menu)
        {

            // help this link for implement: https://stackoverflow.com/questions/55063442/sqlcommand-c-sharp-method-with-sql-paramather

            SqlParameter[] myparam = new SqlParameter[1];

            myparam[0] = new SqlParameter("@RoleID", SqlDbType.Int);
            myparam[0].Value = _Menu.RoleID;
                      
            DataSet ds = ExecuteParamerizedSelectDsCommand("sp_GetMainMenuHeader", CommandType.StoredProcedure, myparam);
            return ds;

            //-- Good and it is working fine -  created  date 7th JUne 1 PM. mid night
        }

        // Get MenuTable detail accordingly MenuID
        public static DataSet GetMenuHeaderTitleForRedirectionIntoSubMenu(ref MenuDTO _MenuHead)
        {
            // help this link for implement: https://stackoverflow.com/questions/55063442/sqlcommand-c-sharp-method-with-sql-paramather

            SqlParameter[] myparam = new SqlParameter[1];

            myparam[0] = new SqlParameter("@MenuID", SqlDbType.Int);
            myparam[0].Value = _MenuHead.MenuID;

            DataSet ds = ExecuteParamerizedSelectDsCommand("sp_GetMainMenuHeaderTitle", CommandType.StoredProcedure, myparam);
            return ds;

            //-- Good and it is working fine -  created  date 7th JUne 1 PM. mid night
        }

        public static DataSet GetSubMenuHeaderTitleAfterClickOnMainMenu(ref SubMenuDTO _SubMenuHead)
        {
            // help this link for implement: https://stackoverflow.com/questions/55063442/sqlcommand-c-sharp-method-with-sql-paramather

            SqlParameter[] myparam = new SqlParameter[1];

            myparam[0] = new SqlParameter("@MainMenuID", SqlDbType.Int);
            myparam[0].Value = _SubMenuHead.MainMenuID;

            DataSet ds = ExecuteParamerizedSelectDsCommand("sp_GetSubMenuOnClickMainMenu", CommandType.StoredProcedure, myparam);
            return ds;

            //-- Good and it is working fine -  created  date 7th JUne 1 PM. mid night
        }


        // Create method on 13th July 11 AM night for MenuDetail and Updation
        public static DataSet GetAllMainMenuDetailWithoutByMainMenuIDForCommonUse()
        {
            DataSet ds = ExecuteSelectDsCommand("sp_GetAllMainMenuWithAndWithoutMainMenuID", CommandType.StoredProcedure);
            return ds;
        }

        // Create method on 13th July 11 AM night for MenuDetail and Updation
        public static DataSet GetAllMainMenuDetailWithByMainMenuID(ref MenuDTO _MainMenuID)
        {
            SqlParameter[] myparam = new SqlParameter[1];

            myparam[0] = new SqlParameter("@MenuID", SqlDbType.Int);
            myparam[0].Value = _MainMenuID.MenuID;
            
            DataSet ds = ExecuteParamerizedSelectDsCommand("sp_GetAllMainMenuWithAndWithoutMainMenuID", CommandType.StoredProcedure, myparam);
            return ds;
        }
           

        // create method on 15th July  2 PM for MenuDetail by Filter condition with RoleID
        public static DataSet GetAllMainMenuDetailWithByRoleID(ref MenuDTO _roleID)
        {
            SqlParameter[] myparam = new SqlParameter[1];

            myparam[0] = new SqlParameter("@RoleID", SqlDbType.Int);
            myparam[0].Value = _roleID.RoleID;

            DataSet ds = ExecuteParamerizedSelectDsCommand("sp_GetAllMainMenuWithAndWithoutRoleID", CommandType.StoredProcedure, myparam);
            return ds;
        }


        //   Three Condition either By RoleID  OR   MenuID   or AllData
        // create method on 15th July  2 PM for MenuDetail by Filter condition with RoleID
        public static DataSet GetAllMainMenuDetailWithByRoleIDNotMenuID(ref MenuDTO _roleID)
        {
            SqlParameter[] myparam = new SqlParameter[1];

            myparam[0] = new SqlParameter("@RoleID", SqlDbType.Int);
            myparam[0].Value = _roleID.RoleID;

            DataSet ds = ExecuteParamerizedSelectDsCommand("sp_GetAllMainMenuWithAndWithoutByMainMenuID_OR_RoleID", CommandType.StoredProcedure, myparam);
            return ds;
        }

      
        // create method on 15th July  2 PM for MenuDetail by Filter condition with RoleID
        public static DataSet GetAllMainMenuDetailWithByMenuIDNotRoleID(ref MenuDTO _MenuID)
        {
            SqlParameter[] myparam = new SqlParameter[1];

            myparam[0] = new SqlParameter("@MenuID", SqlDbType.Int);
            myparam[0].Value = _MenuID.MenuID;

            DataSet ds = ExecuteParamerizedSelectDsCommand("sp_GetAllMainMenuWithAndWithoutByMainMenuID_OR_RoleID", CommandType.StoredProcedure, myparam);
            return ds;
        }



    }
}
