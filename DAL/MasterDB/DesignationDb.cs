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
  public class DesignationDb:DALBase
    {
        public static DataTable GetAllDesignationName()
        {
            DataTable _dt = ExecuteSelectDtCommand("sp_getAllDesignation", CommandType.StoredProcedure);
            return _dt;
        }
    }
}
