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
   public class DepartmentDb:DALBase
    {
        public static DataTable GetAllDepartmentName()
        {
            DataTable _dt = ExecuteSelectDtCommand("sp_getAllDepartment", CommandType.StoredProcedure);
            return _dt;
        }
    }
}
