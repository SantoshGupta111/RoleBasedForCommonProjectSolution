using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.MasterDB
{
   public class DesignationDTO:DTOBase
    {
        public int DesignationID { get; set; }
        public string DesignationName { get; set; }
        public bool IsActive { get; set; }

        public DesignationDTO() // constructor
        {
            DesignationID = Int_NullValue;
            DesignationName = String_NullValue;
            IsActive = Boolean_NullValue;
        }
    }
}
