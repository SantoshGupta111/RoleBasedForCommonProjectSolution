using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Common.MasterDB;

namespace DAL.MasterDB
{
   public class CityDb:DALBase
    {
        public static DataTable GetAllCityName()
        {
            DataTable _dt = ExecuteSelectDtCommand("sp_getAllCity", CommandType.StoredProcedure);
            return _dt;
        }
    }
}
