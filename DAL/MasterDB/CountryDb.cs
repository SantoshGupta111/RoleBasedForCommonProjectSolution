using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common.MasterDB;
using System.Data;
using System.Data.SqlClient;

namespace DAL.MasterDB
{
   public class CountryDb:DALBase
    {
        //  Get data into DropDownlist for the CountryName
        public static DataTable GetAllCountry()
        {
            DataTable dt = ExecuteSelectDtCommand("sp_getAllCountry", CommandType.StoredProcedure);
            return dt;
        }
    }
}
