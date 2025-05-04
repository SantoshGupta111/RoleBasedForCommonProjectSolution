using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using DAL;
using DAL.Menus;
using Common;
using Common.Menus;
using System.Web.UI.WebControls; // for MenuItem

namespace BAL.Menus
{
    public class MenuRoleRepository
    {
        public static void PopulateTreeView1(Int32 inParentID, MenuItem inTreeNode, Int32 roleID1)
        {
            //MenuRoleDb.PopulateTreeView1(inParentID, inTreeNode, roleID1);
        }
        public static void PopulateTreeView2(Int32 inParentID, MenuItem inTreeNode, Int32 roleID2)
        {
            //MenuRoleDb.PopulateTreeView2(inParentID, inTreeNode, roleID2);
        }
        public static void PopulateTreeView3(Int32 inParentID, MenuItem inTreeNode, Int32 roleID3)
        {
            //MenuRoleDb.PopulateTreeView3(inParentID, inTreeNode, roleID3);
        }
        public static void PopulateTreeView4(Int32 inParentID, MenuItem inTreeNode, Int32 roleID4)
        {
            //MenuRoleDb.PopulateTreeView4(inParentID, inTreeNode, roleID4);
        }

        //only one method for common all
        public static void PopulateTreeView(Int32 inParentID, MenuItem inTreeNode, string query)
        {
            MenuRoleDb.PopulateTreeView(inParentID, inTreeNode, query);
        }


        public static DataSet GetALLPopulateTreeView()
        {
            return MenuRoleDb.GetALLPopulateTreeView();
        }
        public static DataSet GetReferenceIDPopulateTreeView(int _Id)
        {
            return MenuRoleDb.GetReferenceIDPopulateTreeView(_Id);
        }


        //========
        public static DataSet GetRoleType1(int roletype1)
        {
            return MenuRoleDb.GetRoleType1(roletype1);
        }
        public static DataSet GetRoleType2(int roletype2)
        {
            return MenuRoleDb.GetRoleType2(roletype2);
        }
        public static DataSet GetRoleType3(int roletype3)
        {
            return MenuRoleDb.GetRoleType3(roletype3);
        }
        public static DataSet GetRoleType4(int roletype4)
        {
            return MenuRoleDb.GetRoleType4(roletype4);
        }
        public static DataSet GetRoleTypeActive(int _roletypeActive)
        {
            return MenuRoleDb.GetRoleTypeActive(-_roletypeActive);
        }
        //==============

        public static DataSet GetRoleTypeFORALL(int _RoleTypeALL)
        {
            return MenuRoleDb.GetRoleTypeFORALL(_RoleTypeALL);
        }
        public static DataSet GetRoleTypeFORRD(int _RoleType, int _roledesign)
        {
            return MenuRoleDb.GetRoleTypeFORRD(_RoleType, _roledesign);
        }
    }
}
