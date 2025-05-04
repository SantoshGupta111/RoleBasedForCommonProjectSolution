using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common.MasterDB;
using DAL.MasterDB;
using System.Data;
using System.Data.SqlClient;


namespace BAL.MasterDB
{
    public class CountryRepository
    {
        public static DataTable GetAllCountry()
        {
            return CountryDb.GetAllCountry();
        }
    }
}
