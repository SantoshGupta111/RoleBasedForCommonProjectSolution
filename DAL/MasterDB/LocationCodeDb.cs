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
   public class LocationCodeDb:DALBase
    {
        public static DataTable GetAllLocationZone()
        {
            DataTable dt = ExecuteSelectDtCommand("sp_getAllLocationZoen", CommandType.StoredProcedure);
            return dt;
        }
    }
}
