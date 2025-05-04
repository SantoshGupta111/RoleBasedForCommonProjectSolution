using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.MasterDB
{
   public class CityDTO:DTOBase
    {
        public int CityID { get; set; }
        public string CityName { get; set; }
        public bool IsActive { get; set; }

        public CityDTO()
        {
            CityID = Int_NullValue;
            CityName = String_NullValue;
            IsActive = Boolean_NullValue;
        }
    }
}
