using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common.Menus;
using DAL.Menus;
using System.Data;
using System.Data.SqlClient;

namespace BAL.Menus
{
    public class MenuRepository
    {
        public static void NewCreateMenu(ref MenuDTO _insertMenu)
        {
            MenuDb.NewCreateMenu(ref _insertMenu);
        }

        public static void UpdateMainMenu(ref MenuDTO _updateMainMenu)
        {
            MenuDb.UpdateMainMenu(ref _updateMainMenu);
        }


        public static DataSet GetAllMenu()
        {
            return MenuDb.GetAllMenu();
        }

        public static DataSet GetMainMenuHeader(ref MenuDTO _Menu)
        {
            return MenuDb.GetMainMenuHeader(ref _Menu);
        }

        public static DataSet GetMenuHeaderTitleForRedirectionIntoSubMenu(ref MenuDTO _MenuHead)
        {
            return MenuDb.GetMenuHeaderTitleForRedirectionIntoSubMenu(ref _MenuHead);
        }

        public static DataSet GetSubMenuHeaderTitleAfterClickOnMainMenu(ref SubMenuDTO _SubMenuHead)
        {
            return MenuDb.GetSubMenuHeaderTitleAfterClickOnMainMenu(ref _SubMenuHead);
        }

        public static DataSet GetAllMainMenuDetailWithoutByMainMenuIDForCommonUse()
        {
            return MenuDb.GetAllMainMenuDetailWithoutByMainMenuIDForCommonUse();
        }

        // BY MenuID get mainmenudetail
        public static DataSet GetAllMainMenuDetailWithByMainMenuID(ref MenuDTO _MainMenuID)
        {
            return MenuDb.GetAllMainMenuDetailWithByMainMenuID(ref _MainMenuID);
        }

        // ByRoleID MainMenuDetail
        public static DataSet GetAllMainMenuDetailWithByRoleID(ref MenuDTO _roleID)
        {
            return MenuDb.GetAllMainMenuDetailWithByRoleID(ref _roleID);
        }

        public static DataSet GetAllMainMenuDetailWithByRoleIDNotMenuID(ref MenuDTO _roleID)
        {
            return MenuDb.GetAllMainMenuDetailWithByRoleIDNotMenuID(ref _roleID);
        }
        public static DataSet GetAllMainMenuDetailWithByMenuIDNotRoleID(ref MenuDTO _MenuID)
        {
            return MenuDb.GetAllMainMenuDetailWithByMenuIDNotRoleID(ref _MenuID);
        }
    }

}
