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
   public class StateDb:DALBase
    {
        // bind for ddlState
        public static DataTable GetAllStateName()
        {
            DataTable _dt = ExecuteSelectDtCommand("sp_getAllState", CommandType.StoredProcedure);
            return _dt;
        }
    }
}
