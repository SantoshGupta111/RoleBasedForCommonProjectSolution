using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Common;
using System.IO;

namespace DAL
{
    public abstract class DALBase
    {
        // Main global ConnectionString for midasPCTouch ERP.

        #region OLD code use of web config file connection string before 28th June 2023

        // If you want call connection server name and userID/Password  from config file then use of below code

        //protected static string ConnectionString
        //{

        //    get { return ConfigurationManager.ConnectionStrings["conNewprojectdemoDB"].ConnectionString.ToString(); }

        //}

        #endregion

        #region  For security Purpose - 28th June 2023

        // If you want call connection server name and userID/Password not from config file then use of below code
        // in system path folder (for security purpose)

        protected static string ProtectedConnectionString
        {
            get
            {
               
                string filePath = @"F:\RoleBasedApplicationForCommon_July24\SecureFolder\connectionInfo.txt";
                string[] connectionInfo = File.ReadAllLines(filePath);

                string serverName = connectionInfo.FirstOrDefault(line => line.StartsWith("ServerName="))?.Substring(11);
                string userName = connectionInfo.FirstOrDefault(line => line.StartsWith("UserName="))?.Substring(9);
                string password = connectionInfo.FirstOrDefault(line => line.StartsWith("Password="))?.Substring(9);

                // Build the connection string
                string connectionString = $"Data Source={serverName};Initial Catalog=RoleBasedApplicationCommonDB_072024;User ID={userName};Password={password};Trusted_Connection=False;";

                return connectionString;
            }
        }


        // For Another Single page where we want direct call connection. above method is not calling due to protected class.
        // now we have to make for some time or some page manual it Public class. as below:

        public static string PublicConnectionString
        {
            get
            {
                string filePath = @"D:\SecureFolder\connectionInfo.txt";
                string[] connectionInfo = File.ReadAllLines(filePath);

                string serverName = connectionInfo.FirstOrDefault(line => line.StartsWith("ServerName="))?.Substring(11);
                string userName = connectionInfo.FirstOrDefault(line => line.StartsWith("UserName="))?.Substring(9);
                string password = connectionInfo.FirstOrDefault(line => line.StartsWith("Password="))?.Substring(9);

                // Build the connection string
                string connectionString = $"Data Source={serverName};Initial Catalog=NewprojectdemoDB;User ID={userName};Password={password};Trusted_Connection=False;";

                return connectionString;
            }
        }

        #endregion


        // GetDbSqlComman
        protected static SqlCommand GetDbSQLCommand(string sqlQuery)
        {
           
            SqlCommand command = new SqlCommand();
            command.Connection = GetDbConnection();
            command.CommandType = CommandType.Text;
            command.CommandText = sqlQuery;
            return command;
        }


        // GetDbConnection
        protected static SqlConnection GetDbConnection()
        {
            return new SqlConnection(ProtectedConnectionString);
        }


        // GetDbSprocCommand
        protected static SqlCommand GetDbSprocCommand(string sprocName)
        {
            SqlCommand command = new SqlCommand(sprocName);
            command.Connection = GetDbConnection();
            command.CommandType = CommandType.StoredProcedure;
            return command;
        }

        // CreateNullParameter
        protected static SqlParameter CreateNullParameter(string name, SqlDbType paramType)
        {
            SqlParameter parameter = new SqlParameter();
            parameter.SqlDbType = paramType;
            parameter.ParameterName = name;
            parameter.Value = null;
            parameter.Direction = ParameterDirection.Input;
            return parameter;
        }


        // CreateNullParameter - with size for nvarchars
        protected static SqlParameter CreateNullParameter(string name, SqlDbType paramType, int size)
        {
            SqlParameter parameter = new SqlParameter();
            parameter.SqlDbType = paramType;
            parameter.ParameterName = name;
            parameter.Size = size;
            parameter.Value = null;
            parameter.Direction = ParameterDirection.Input;
            return parameter;
        }


        // CreateOutputParameter
        protected static SqlParameter CreateOutputParameter(string name, SqlDbType paramType)
        {
            SqlParameter parameter = new SqlParameter();
            parameter.SqlDbType = paramType;
            parameter.ParameterName = name;
            parameter.Direction = ParameterDirection.Output;
            return parameter;
        }


        // CreateOuputParameter - with size for nvarchars
        protected static SqlParameter CreateOutputParameter(string name, SqlDbType paramType, int size)
        {
            SqlParameter parameter = new SqlParameter();
            parameter.SqlDbType = paramType;
            parameter.Size = size;
            parameter.ParameterName = name;
            parameter.Direction = ParameterDirection.Output;
            return parameter;
        }


        // CreateParameter - uniqueidentifier
        protected static SqlParameter CreateParameter(string name, Guid value)
        {
            if (value.Equals(Common.DTOBase.Guid_NullValue))
            {
                // If value is null then create a null parameter
                return CreateNullParameter(name, SqlDbType.UniqueIdentifier);
            }
            else
            {
                SqlParameter parameter = new SqlParameter();
                parameter.SqlDbType = SqlDbType.UniqueIdentifier;
                parameter.ParameterName = name;
                parameter.Value = value;
                parameter.Direction = ParameterDirection.Input;
                return parameter;
            }
        }


        // CreateParameter - int
        protected static SqlParameter CreateParameter(string name, int value)
        {
            if (value == Common.DTOBase.Int_NullValue)
            {
                // If value is null then create a null parameter
                return CreateNullParameter(name, SqlDbType.Int);
            }
            else
            {
                SqlParameter parameter = new SqlParameter();
                parameter.SqlDbType = SqlDbType.Int;
                parameter.ParameterName = name;
                parameter.Value = value;
                parameter.Direction = ParameterDirection.Input;
                return parameter;
            }
        }

        // CreateParameter - float---20 april 2013 on changes according to need
        protected static SqlParameter CreateParameter(string name, float value)
        {
            if (value == Common.DTOBase.Float_NullValue)
            {
                // If value is null then create a null parameter
                return CreateNullParameter(name, SqlDbType.Float);
            }
            else
            {
                SqlParameter parameter = new SqlParameter();
                parameter.SqlDbType = SqlDbType.Float;
                parameter.ParameterName = name;
                parameter.Value = value;
                parameter.Direction = ParameterDirection.Input;
                return parameter;
            }
        }

        // CreateParameter - Decimal---7 Sept 2023 on changes according to need
        protected static SqlParameter CreateParameter(string name, decimal value)
        {
            if (value == Common.DTOBase.Decimal_NullValue)
            {
                // If value is null then create a null parameter
                return CreateNullParameter(name, SqlDbType.Decimal);
            }
            else
            {
                SqlParameter parameter = new SqlParameter();
                parameter.SqlDbType = SqlDbType.Decimal;
                parameter.ParameterName = name;
                parameter.Value = value;
                parameter.Direction = ParameterDirection.Input;
                return parameter;
            }
        }

        // CreateParameter - datetime
        protected static SqlParameter CreateParameter(string name, DateTime value)
        {
            if (value == Common.DTOBase.DateTime_NullValue)
            {
                // If value is null then create a null parameter
                return CreateNullParameter(name, SqlDbType.DateTime);
            }
            else
            {
                SqlParameter parameter = new SqlParameter();
                parameter.SqlDbType = SqlDbType.DateTime;
                parameter.ParameterName = name;
                parameter.Value = value;
                parameter.Direction = ParameterDirection.Input;
                return parameter;
            }
        }


        // CreateParameter - nvarchar/varchar (string datatype)
        protected static SqlParameter CreateParameter(string name, string value, int size)
        {
            if (value == Common.DTOBase.String_NullValue)
            {
                // If value is null then create a null parameter
                return CreateNullParameter(name, SqlDbType.NVarChar);
            }
            else
            {
                SqlParameter parameter = new SqlParameter();
                parameter.SqlDbType = SqlDbType.NVarChar;
                parameter.Size = size;
                parameter.ParameterName = name;
                parameter.Value = value;
                parameter.Direction = ParameterDirection.Input;
                return parameter;
            }
        }

        // Createparameter-Boolean  ---by santosh 19 feb

        protected static SqlParameter CreateParameter(string name, bool value)
        {
            if (value == Common.DTOBase.Boolean_NullValue)
            {
                // If value is null then create a null parameter
                return CreateNullParameter(name, SqlDbType.NVarChar);
            }
            else
            {
                SqlParameter parameter = new SqlParameter();
                parameter.SqlDbType = SqlDbType.Bit;
                parameter.ParameterName = name;
                parameter.Value = value;
                parameter.Direction = ParameterDirection.Input;
                return parameter;
            }
        }


        // GetSingleDTO
       


        // GetDTOList
       

        // Data Set
        // This function will be used to execute R(CRUD) operation of parameterless commands by Dataset
        public static DataSet ExecuteSelectDsCommand(string CommandName, CommandType cmdType)
        {
            DataSet ds = null;
            using (SqlConnection con = new SqlConnection(ProtectedConnectionString))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandType = cmdType;
                    cmd.CommandText = CommandName;

                    try
                    {
                        if (con.State != ConnectionState.Open)
                        {
                            con.Open();
                        }

                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            ds = new DataSet();
                            da.Fill(ds);
                        }
                    }
                    catch
                    {
                        throw;
                    }
                }
            }

            return ds;
        }
        //DataSet
        // This function will be used to execute R(CRUD) operation of parameterless commands by Datatable
        public static DataTable ExecuteSelectDtCommand(string CommandName, CommandType cmdType)
        {
            DataTable table = null;
            using (SqlConnection con = new SqlConnection(ProtectedConnectionString))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandType = cmdType;
                    cmd.CommandText = CommandName;

                    try
                    {
                        if (con.State != ConnectionState.Open)
                        {
                            con.Open();
                        }

                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            table = new DataTable();
                            da.Fill(table);
                        }
                    }
                    catch
                    {
                        throw;
                    }
                }
            }

            return table;
        }

        // Data table using parameter
        // This function will be used to execute R(CRUD) operation of parameterized commands
        public static DataTable ExecuteParamerizedSelectDtCommand(string CommandName, CommandType cmdType, SqlParameter[] param)
        {
            DataTable tablep = new DataTable();

            using (SqlConnection con = new SqlConnection(ProtectedConnectionString))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandType = cmdType;
                    cmd.CommandText = CommandName;
                    cmd.Parameters.AddRange(param);

                    try
                    {
                        if (con.State != ConnectionState.Open)
                        {
                            con.Open();
                        }

                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(tablep);
                        }
                    }
                    catch
                    {
                        throw;
                    }
                }
            }

            return tablep;
        }

        // Data set using parameter
        // This function will be used to execute R(CRUD) operation of parameterized commands
        public static DataSet ExecuteParamerizedSelectDsCommand(string CommandName, CommandType cmdType, SqlParameter[] param)
        {
            DataSet dsp = new DataSet();

            using (SqlConnection con = new SqlConnection(ProtectedConnectionString))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandType = cmdType;
                    cmd.CommandText = CommandName;
                    cmd.Parameters.AddRange(param);

                    try
                    {
                        if (con.State != ConnectionState.Open)
                        {
                            con.Open();
                        }

                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(dsp);
                        }
                    }
                    catch
                    {
                        throw;
                    }
                }
            }

            return dsp;
        }

        // This function will be used to execute CUD(CRUD) operation of parameterized commands
        public static bool ExecuteNonQuery(string CommandName, CommandType cmdType, SqlParameter[] pars)
        {
            int result = 0;

            using (SqlConnection con = new SqlConnection(ProtectedConnectionString))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandType = cmdType;
                    cmd.CommandText = CommandName;
                    cmd.Parameters.AddRange(pars);

                    try
                    {
                        if (con.State != ConnectionState.Open)
                        {
                            con.Open();
                        }

                        result = cmd.ExecuteNonQuery();
                    }
                    catch
                    {
                        throw;
                    }
                }
            }

            return (result > 0);
        }


        // Scalar Value
        protected object ExecuteScalar(string spName, CommandType cmdType, SqlParameter[] param)
        {
            using (SqlConnection connection = new SqlConnection(ProtectedConnectionString))
            {
                using (SqlCommand command = new SqlCommand(spName, connection))
                {
                    if (param != null)
                    {
                        command.Parameters.AddRange(param);
                    }
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    connection.Open();
                    return command.ExecuteScalar();
                }
            }
        }


    }
}
