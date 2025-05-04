using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.MasterDB;
using System.Data;
using System.Data.SqlClient;

namespace BAL.MasterDB
{
    public class LocationCodeRepository
    {
        public static DataTable GetAllLocationZone()
        {
            return LocationCodeDb.GetAllLocationZone();
        }
    }
}
