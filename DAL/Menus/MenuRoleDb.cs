using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using Common.Menus;


namespace DAL.Menus
{
   
     public class MenuRoleDb : DALBase
        {
        // not used in this project
            #region Used By DataSet OR DataTable



            #endregion

            #region ---common method for all role type

            public static void PopulateTreeView(Int32 inParentID, MenuItem inTreeNode, string query)
            {
                string DACategories = "SELECT MenuId, MenuName, ParentID,DisplaySequence,urll,PageTitle,Role1,Role2,Role3,Role4 FROM MenuItems Where status='Published' and ParentID ='" + inParentID + "' and " + query;
                DataSet DSNASPSearch; //= default(DataSet);
                DSNASPSearch = new DataSet();
                DSNASPSearch = ExecuteSelectDsCommand(DACategories, CommandType.Text);

                //DataTable ParentTable = default(DataTable);
                DataTable ParentTable = new DataTable();
                ParentTable = DSNASPSearch.Tables[0]; //ASPSearch_Categories
                foreach (DataRow parentrow in ParentTable.Rows)
                {
                    MenuItem parentnode = default(MenuItem);
                    string strLabel = parentrow.ItemArray[1] + " (" + parentrow.ItemArray[3] + ")";
                    parentnode = new MenuItem(strLabel);
                    inTreeNode.ChildItems.Add(parentnode);
                    parentnode.Text = parentrow.ItemArray[1].ToString();
                    parentnode.Value = parentrow.ItemArray[0].ToString();
                    parentnode.NavigateUrl = parentrow.ItemArray[4].ToString();
                    PopulateTreeView(Convert.ToInt32(parentrow.ItemArray[0].ToString()), parentnode, query);

                }

            }

            public static DataSet GetALLPopulateTreeView()
            {
                string SqlQueryGet = "SELECT distinct (urll),DisplaySequence FROM MenuItems order by Urll";
                DataSet dsAllMenuItems; //= default(DataSet);
                dsAllMenuItems = new DataSet();
                dsAllMenuItems = ExecuteSelectDsCommand(SqlQueryGet, CommandType.Text);
                return dsAllMenuItems;
            }

            public static DataSet GetReferenceIDPopulateTreeView(int _Id)
            {
                string SqlQueryGetID = "SELECT * FROM MenuItems Where MenuId='" + _Id + "'";
                DataSet dsMenuItemsID; //= default(DataSet);
                dsMenuItemsID = new DataSet();
                dsMenuItemsID = ExecuteSelectDsCommand(SqlQueryGetID, CommandType.Text);
                return dsMenuItemsID;
            }


            #endregion




            //=======================Role Type==================

            public static DataSet GetRoleType1(int roletype1)
            {
                string SqlRoleType = "select * from MenuItems where parentid =0 and status='Published' and Role1='" + roletype1 + "' order by DisplaySequence";
                DataSet dsRoleType; //= default(DataSet);
                dsRoleType = new DataSet();
                dsRoleType = ExecuteSelectDsCommand(SqlRoleType, CommandType.Text);
                return dsRoleType;
            }

            public static DataSet GetRoleType2(int roletype2)
            {
                string SqlRoleType = "select * from MenuItems where parentid =0 and status='Published' and Role2='" + roletype2 + "' order by DisplaySequence";
                DataSet dsRoleType; //= default(DataSet);
                dsRoleType = new DataSet();
                dsRoleType = ExecuteSelectDsCommand(SqlRoleType, CommandType.Text);
                return dsRoleType;
            }
            public static DataSet GetRoleType3(int roletype3)
            {
                string SqlRoleType = "select * from MenuItems where parentid =0 and status='Published' and Role3='" + roletype3 + "' order by DisplaySequence";
                DataSet dsRoleType; //= default(DataSet);
                dsRoleType = new DataSet();
                dsRoleType = ExecuteSelectDsCommand(SqlRoleType, CommandType.Text);
                return dsRoleType;
            }

            public static DataSet GetRoleType4(int roletype4)
            {
                string SqlRoleType = "select * from MenuItems where parentid =0 and status='Published' and Role4='" + roletype4 + "' order by DisplaySequence";
                DataSet dsRoleType; //= default(DataSet);
                dsRoleType = new DataSet();
                dsRoleType = ExecuteSelectDsCommand(SqlRoleType, CommandType.Text);
                return dsRoleType;
            }

            public static DataSet GetRoleTypeActive(int _roletypeActive)
            {
                string SqlRoleType = "select * from MenuItems where parentid =0 and status='Published' and Roleactive='" + _roletypeActive + "' order by DisplaySequence";
                DataSet dsRoleType; //= default(DataSet);
                dsRoleType = new DataSet();
                dsRoleType = ExecuteSelectDsCommand(SqlRoleType, CommandType.Text);
                return dsRoleType;
            }


            //================If change one by one role authorized to page, according to sysmatic........for testing purpose. ok

            public static DataSet GetRoleTypeFORALL(int _RoleTypeALL)
            {
                string SqlRoleTypeALL = "select * from MenuItems where parentid =0 and status='Published' and Role1='" + _RoleTypeALL + "' order by DisplaySequence";
                DataSet dsRoleTypeALL; //= default(DataSet);
                dsRoleTypeALL = new DataSet();
                dsRoleTypeALL = ExecuteSelectDsCommand(SqlRoleTypeALL, CommandType.Text);
                return dsRoleTypeALL;
            }

            public static DataSet GetRoleTypeFORRD(int _RoleType, int _roledesign)
            {
                string SqlRoleTypeALL = string.Empty;
                if (_roledesign == 10)
                {
                    SqlRoleTypeALL = "select * from MenuItems where parentid =0 and status='Published' and Role1='" + _RoleType + "' and RoleDesignation='" + _roledesign + "' order by DisplaySequence";
                }
                else
                {
                    SqlRoleTypeALL = "select * from MenuItems where parentid =0 and status='Published' and Role1='" + _RoleType + "' and RoleDesignation!=10  order by DisplaySequence";
                }
                DataSet dsRoleTypeALL; //= default(DataSet);
                dsRoleTypeALL = new DataSet();
                dsRoleTypeALL = ExecuteSelectDsCommand(SqlRoleTypeALL, CommandType.Text);
                return dsRoleTypeALL;
            }
        }
    
}
