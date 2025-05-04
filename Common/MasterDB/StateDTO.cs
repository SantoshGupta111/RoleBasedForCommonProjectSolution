using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.MasterDB
{
   public class StateDTO:DTOBase
    {
        public int StateID { get; set; }
        public string StateName { get; set; }
        public bool IsActive { get; set; }

        public StateDTO()
        {
            StateID = Int_NullValue;
            StateName = String_NullValue;
            IsActive = Boolean_NullValue;
        }
    }
}
