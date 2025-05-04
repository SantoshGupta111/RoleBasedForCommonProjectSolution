using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Configuration;

namespace DAL
{
    public class clsDBFunctions : IDisposable
    {
        private SqlConnection _SQLCon;
        private SqlCommand _SQLCom;

        public SqlConnection ActiveConnection
        {
            get { return _SQLCon; }
        }

        public bool CreateConnection()
        {

            string strCon = ConfigurationManager.ConnectionStrings["MidasPCTouchConnectionString"].ConnectionString.ToString();

            //  string strCon=strConn.Replace("5+gyEtBYa+xsqIjQHL2Xyw==",clsGenFunctions.Decrypt("5+gyEtBYa+xsqIjQHL2Xyw=="));
            if (strCon == String.Empty)
            {
                return false;
            }
            if (_SQLCon == null || _SQLCon.State == ConnectionState.Closed)
            {
                try
                {
                    _SQLCon = new SqlConnection();
                    _SQLCon.ConnectionString = strCon;
                    _SQLCon.Open();
                    return true;
                }
                catch (Exception e)
                {
                    return false;
                }
            }
            return true;
        }

        private void InitializeConnection()
        {
            if (ActiveConnection == null)
                CreateConnection();
        }
        public string convarun()
        {


            string strCon = ConfigurationManager.ConnectionStrings["MidasPCTouchConnectionString"].ConnectionString.ToString();

            // string strCon=strConn.Replace("5+gyEtBYa+xsqIjQHL2Xyw==",clsGenFunctions.Decrypt("5+gyEtBYa+xsqIjQHL2Xyw=="));

            return strCon;

        }
        public Int64 ExecuteProcedure(string procname, SqlParameter[] sParameters)
        {
            InitializeConnection();
            try
            {
                _SQLCom = new SqlCommand();
                _SQLCom.Connection = ActiveConnection;
                _SQLCom.CommandType = CommandType.StoredProcedure;
                _SQLCom.CommandText = procname;
                for (int i = 0; i < sParameters.Length; i++)
                {
                    _SQLCom.Parameters.Add(sParameters[i]);
                }
                SqlDataAdapter l_da = new SqlDataAdapter(_SQLCom);
                int numRows = _SQLCom.ExecuteNonQuery();
                Int64 ocid = Convert.ToInt64(_SQLCom.Parameters["@ocid"].Value);
                //int numRows = Convert.ToInt32(_SQLCom.ExecuteScalar());
                return ocid;
            }
            catch (Exception e)
            {
                throw e;
            }
        }
        public Int64 ExecuteProceduredb2(string procname, SqlParameter[] sParameters)
        {
            InitializeConnection();
            try
            {
                _SQLCom = new SqlCommand();
                _SQLCom.Connection = ActiveConnection;
                _SQLCom.CommandType = CommandType.StoredProcedure;
                _SQLCom.CommandText = procname;
                for (int i = 0; i < sParameters.Length; i++)
                {
                    _SQLCom.Parameters.Add(sParameters[i]);
                }
                SqlDataAdapter l_da = new SqlDataAdapter(_SQLCom);
                //int numRows = _SQLCom.ExecuteNonQuery();
                Int64 numRows = Convert.ToInt64(_SQLCom.ExecuteScalar());
                return numRows;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public int GetRowID(string query)
        {
            InitializeConnection();
            _SQLCom = null;
            _SQLCom = new SqlCommand(query, ActiveConnection);

            int retVal = Convert.ToInt32(_SQLCom.ExecuteScalar());
            return retVal;
        }
        public DataSet GetDatasetFromProcparameter(string procname, SqlParameter[] sParameters)
        {
            InitializeConnection();
            try
            {
                _SQLCom = null;
                _SQLCom = new SqlCommand();
                _SQLCom.Connection = ActiveConnection;
                _SQLCom.CommandType = CommandType.StoredProcedure;
                _SQLCom.CommandText = procname;
                for (int i = 0; i < sParameters.Length; i++)
                {
                    _SQLCom.Parameters.Add(sParameters[i]);
                }
                SqlDataAdapter l_da = new SqlDataAdapter(_SQLCom);
                DataSet l_ds = new DataSet();
                l_da.Fill(l_ds);
                return l_ds;
            }
            catch (Exception e)
            {
                return null;
            }
        }
        public void ExecuteProcedure3(string procname, SqlParameter sParameters)
        {
            InitializeConnection();
            try
            {
                _SQLCom = new SqlCommand();
                _SQLCom.Connection = ActiveConnection;
                _SQLCom.CommandType = CommandType.StoredProcedure;
                _SQLCom.CommandText = procname;

                _SQLCom.Parameters.Add(sParameters);

                SqlDataAdapter l_da = new SqlDataAdapter(_SQLCom);
                int numRows = _SQLCom.ExecuteNonQuery();

            }
            catch (Exception e)
            {
                throw e;
            }
        }
        public DataSet GetDatasetFromProcedure(string procname, SqlParameter sParameters)
        {
            InitializeConnection();
            try
            {
                _SQLCom = null;
                _SQLCom = new SqlCommand();
                _SQLCom.Connection = ActiveConnection;
                _SQLCom.CommandType = CommandType.StoredProcedure;
                _SQLCom.CommandText = procname;
                _SQLCom.Parameters.Add(sParameters);
                SqlDataAdapter l_da = new SqlDataAdapter(_SQLCom);
                DataSet l_ds = new DataSet();
                l_da.Fill(l_ds);
                return l_ds;
            }
            catch (Exception e)
            {
                return null;
            }
        }
        public int ExecuteProctest(string procname)
        {
            InitializeConnection();
            try
            {
                _SQLCom = new SqlCommand();
                _SQLCom.Connection = ActiveConnection;
                _SQLCom.CommandType = CommandType.Text;
                _SQLCom.CommandText = procname;
                ////for (int i = 0; i < sParameters.Length; i++)
                ////{
                ////    _SQLCom.Parameters.Add(sParameters[i]);
                ////}
                SqlDataAdapter l_da = new SqlDataAdapter(_SQLCom);
                int numRows = _SQLCom.ExecuteNonQuery();
                //int numRows = Convert.ToInt32(_SQLCom.ExecuteScalar());
                return numRows;
            }
            catch (Exception e)
            {
                throw e;
            }
        }
        public void insupd(string query)
        {
            InitializeConnection();
            _SQLCom = null;
            _SQLCom = new SqlCommand(query, ActiveConnection);

            _SQLCom.ExecuteNonQuery();

        }
        public int retinsupd(string query)
        {
            InitializeConnection();
            _SQLCom = null;
            _SQLCom = new SqlCommand(query, ActiveConnection);

            Int32 ii = Convert.ToInt32(_SQLCom.ExecuteScalar());
            return ii;

        }
        public DataTable selec(string query)
        {
            InitializeConnection();
            _SQLCom = null;

            _SQLCom = new SqlCommand(query, ActiveConnection);
            SqlDataAdapter l_da = new SqlDataAdapter(_SQLCom);
            DataTable dt = new DataTable();
            l_da.Fill(dt);
            return dt;

        }
        public DataSet selecds(string query)
        {
            InitializeConnection();
            _SQLCom = null;

            _SQLCom = new SqlCommand(query, ActiveConnection);
            SqlDataAdapter l_da = new SqlDataAdapter(_SQLCom);
            DataSet dt = new DataSet();
            l_da.Fill(dt);
            return dt;

        }


        public void Dispose()
        {
            //throw new Exception("Disposing Failed");        
        }
    }
}
