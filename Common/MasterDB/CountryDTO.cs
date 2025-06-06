﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.MasterDB
{
   public class CountryDTO:DTOBase
    {
        public int CountryId { get; set; }
        public string CountryName { get; set; }
        public bool IsActive { get; set; }

        public CountryDTO()
        {
            CountryId = Int_NullValue;
            CountryName = String_NullValue;
            IsActive = Boolean_NullValue;
        }

    }
}
