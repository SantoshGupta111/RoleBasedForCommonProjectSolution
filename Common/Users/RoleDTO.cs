using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.Users
{
   public class RoleDTO:DTOBase
    {
        public int RoleID { get; set; }

        public string RoleName { get; set; }

        public DateTime CreatedDate { get; set; }

        public string ERROR { get; set; }

        public RoleDTO()
        {
            RoleID = Int_NullValue;
            RoleName = String_NullValue;
            CreatedDate = DateTime_NullValue;
            ERROR = String_NullValue;
        }
    }
}
