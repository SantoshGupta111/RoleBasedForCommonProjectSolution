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
    public class DesignationRepository
    {
        public static DataTable GetAllDesignationName()
        {
            return DesignationDb.GetAllDesignationName();
        }
    }

}
