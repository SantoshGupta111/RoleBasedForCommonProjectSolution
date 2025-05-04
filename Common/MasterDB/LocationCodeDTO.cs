using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.MasterDB
{
   public class LocationCodeDTO:DTOBase
    {
        public int LocationCodeID { get; set; }
        public string LocationCodeName { get; set; }
        public bool IsActive { get; set; }

        public LocationCodeDTO()
        {
            LocationCodeID = Int_NullValue;
            LocationCodeName = String_NullValue;
            IsActive = Boolean_NullValue;
        }
    }
}
