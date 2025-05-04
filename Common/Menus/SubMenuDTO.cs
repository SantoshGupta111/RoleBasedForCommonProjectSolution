using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.Menus
{
   public class SubMenuDTO:DTOBase
    {
        public int submenuid { get; set; }
        public string submenuname { get; set; }
        public string submenuurl { get; set; }
        public string submenudescription { get; set; }
        public int submenudisplaysequence { get; set; }
        public bool IsActive { get; set; }
        public int MainMenuID { get; set; }
        public int RoleId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ERROR { get; set; }

        public SubMenuDTO() // constructor
        {
            submenuid = Int_NullValue;
            submenuname = String_NullValue;
            submenuurl = String_NullValue;
            submenudescription = String_NullValue;
            submenudisplaysequence = Int_NullValue;
            IsActive = Boolean_NullValue;
            MainMenuID = Int_NullValue;
            RoleId = Int_NullValue;
            CreatedDate = DateTime_NullValue;
            ERROR = String_NullValue;

        }

    }
}
