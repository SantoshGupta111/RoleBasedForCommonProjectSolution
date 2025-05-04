using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.Menus
{
   public class MenuDTO:DTOBase
    {
        public int MenuID { get; set; }

        public string MenuName { get; set; }

        public string MenuUrl { get; set; }

        public string MenuDescription { get; set; }

        public int DisplaySequence { get; set; }

        public bool IsActive { get; set; }

        public int RoleID { get; set; }

        public DateTime CreateDate { get; set; }

        public string ERROR { get; set; }

        public MenuDTO()
        {
            MenuID = Int_NullValue;
            MenuName = String_NullValue;
            MenuUrl = String_NullValue;
            MenuDescription = String_NullValue;
            DisplaySequence = Int_NullValue;
            IsActive = Boolean_NullValue;
            RoleID = Int_NullValue;
            CreateDate = DateTime_NullValue;
            ERROR = String_NullValue;
        }
    }
}
