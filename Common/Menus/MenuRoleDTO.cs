using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.Menus
{
   public class MenuRoleDTO:DTOBase
    {
        // not used in this project

        #region Property
        public int MenuId { get; set; }
        public string MenuName { get; set; }
        public string description { get; set; }
        public int parentid { get; set; }
        public int DisplaySequence { get; set; }
        public string PageTitle { get; set; }
        public string status { get; set; }
        public string urll { get; set; }
        public int Role1 { get; set; }
        public int Role2 { get; set; }
        public int Role3 { get; set; }
        public int Role4 { get; set; }
        public int RoleAccessbility { get; set; }
        public DateTime ManageMenuItemDate { get; set; }

        #endregion

        #region null values as defined in CommonBase.

        // Constructor
        // No parameters and all types are intialized to their 
        // null values as defined in CommonBase.
        public MenuRoleDTO()
        {
            MenuId = Int_NullValue;
            MenuName = String_NullValue;
            description = String_NullValue;
            parentid = Int_NullValue;
            DisplaySequence = Int_NullValue;
            PageTitle = String_NullValue;
            status = String_NullValue;
            urll = String_NullValue;
            Role1 = Int_NullValue;
            Role2 = Int_NullValue;
            Role3 = Int_NullValue;
            Role4 = Int_NullValue;
            RoleAccessbility = Int_NullValue;
            ManageMenuItemDate = DateTime_NullValue;
        }
        #endregion

    }
}
