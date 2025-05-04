using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using DAL.MasterDB;

namespace BAL.MasterDB
{
    public class StateRepository
    {
        public static DataTable GetAllStateName()
        {
            return StateDb.GetAllStateName();
        }
    }
}
