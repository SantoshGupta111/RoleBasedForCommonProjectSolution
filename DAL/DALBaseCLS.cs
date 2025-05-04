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
    public class DALBaseCLS : IDisposable
    {
        private SqlConnection _SQLCon;
        private SqlCommand _SQLCom;

        public DALBaseCLS()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public SqlConnection ActiveConnection
        {
            get { return _SQLCon; }
        }

        public bool CreateConnection()
        {
            //string strCon = ConfigurationManager.ConnectionStrings["MidasPCTouchConnectionString"].ConnectionString.ToString();
            string strCon = ConfigurationManager.ConnectionStrings["conNewprojectdemoDB"].ConnectionString.ToString();

            

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

        public Int64 ExecuteProcedure(string procname, SqlParameter[] sParameters)
        {
            InitializeConnection();
            try
            {
                _SQLCom = new SqlCommand();
                _SQLCom.Connection = ActiveConnection;
                _SQLCom.CommandType = CommandType.StoredProcedure;
                _SQLCom.CommandText = procname;
                _SQLCom.CommandTimeout = 1000;
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
                _SQLCom.CommandTimeout = 1000;

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
                _SQLCom.CommandTimeout = 1000;

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
                return GetErrorDataSet(e.ToString());
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
                _SQLCom.CommandTimeout = 1000;

                _SQLCom.Parameters.Add(sParameters);
                SqlDataAdapter l_da = new SqlDataAdapter(_SQLCom);
                DataSet l_ds = new DataSet();
                l_da.Fill(l_ds);
                return l_ds;
            }
            catch (Exception e)
            {
                return GetErrorDataSet(e.ToString());
            }
        }
        public DataSet GetErrorDataSet(string Error)
        {
            DataSet ds_err = new DataSet();

            DataTable Table1;
            Table1 = new DataTable("Customers");
            //creating a table named Customers
            DataRow Row1;
            //declaring three rows for the table

            DataColumn Name = new DataColumn("Error");
            //declaring a column named Name
            Name.DataType = System.Type.GetType("System.String");
            // setting the datatype for the column
            Table1.Columns.Add(Name);
            //adding the column to table
            Row1 = Table1.NewRow();
            //declaring a new row
            Row1.ItemArray[0] = Error;
            // filling the row with values. Item property is used to set the field value.
            Table1.Rows.Add(Row1);
            //ds_err.Tables
            DataSet dsErr = new DataSet();
            dsErr.Tables.Add(Table1);
            return ds_err;
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
                _SQLCom.CommandTimeout = 1000;

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
            _SQLCom.CommandTimeout = 1000;
            _SQLCom.ExecuteNonQuery();

        }
        public DataTable selec(string query)
        {
            InitializeConnection();
            _SQLCom = null;

            _SQLCom = new SqlCommand(query, ActiveConnection);
            _SQLCom.CommandTimeout = 1000;

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
            _SQLCom.CommandTimeout = 1000;

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
