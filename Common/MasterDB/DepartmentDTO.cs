using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.MasterDB
{
   public class DepartmentDTO:DTOBase
    {
        public int DepartmentID { get; set; }
        public string DepartmentName { get; set; }
        public bool IsActive { get; set; }

        public DepartmentDTO()
        {
            DepartmentID = Int_NullValue;
            DepartmentName = String_NullValue;
            IsActive = Boolean_NullValue;
        }
    }
}
