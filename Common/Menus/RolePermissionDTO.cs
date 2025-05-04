using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.Menus
{
  public  class RolePermissionDTO:DTOBase
    {
        public int ID { get; set; }
        public int RoleID { get; set; }
        public int SubMenuID { get; set; }
        public bool CanEdit { get; set; }
        public bool CanView { get; set; }
        public bool CanDelete { get; set; }
        public bool CanInsert { get; set; }
        //public bool CanNone { get; set; }
        //public bool IsActive { get; set; }

        public RolePermissionDTO()
        {
            ID = Int_NullValue;
            RoleID = Int_NullValue;
            SubMenuID = Int_NullValue;
            CanEdit = Boolean_NullValue;
            CanView = Boolean_NullValue;
            CanDelete = Boolean_NullValue;
            CanInsert = Boolean_NullValue;
            //CanNone = Boolean_NullValue;
            //IsActive = Boolean_NullValue;
        }

    }
}
