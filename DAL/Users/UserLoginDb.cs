using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Data.Common;
using System.Web;
using System.Web.UI.WebControls;
using Common.Users;

namespace DAL.Users
{
   public class UserLoginDb:DALBase
    {
        // It's using 
        public static DataSet GetValidLoginByID(ref UserRegistrationDTO _user)
        {

            // help this link for implement: https://stackoverflow.com/questions/55063442/sqlcommand-c-sharp-method-with-sql-paramather

            SqlParameter[] myparam = new SqlParameter[2];

            myparam[0] =new SqlParameter("@EMPNO", SqlDbType.NVarChar,50);
            myparam[0].Value = _user.EMPNO;

            myparam[1] = new SqlParameter("@password", SqlDbType.NVarChar,50);
            myparam[1].Value = _user.Password;

            //myparam[2] = new SqlParameter("@RoleID", SqlDbType.Int);
            //myparam[2].Value = _user.RoleID;


            DataSet ds = ExecuteParamerizedSelectDsCommand("sp_GetValidLogin", CommandType.StoredProcedure,myparam);
            return ds;
              
            //-- Good and it is working fine -  created  date 7th JUne 1 PM. mid night
        }
               
        
        public static DataSet GetUserLogin(string email, string password)
        {
            //SqlCommand command=ExecuteSelectDsCommand("up_seclogin",CommandType.StoredProcedure);
            //command.Parameters.Add(CreateParameter("@RoleId", id));
            //return GetSingleDTO<RoleDTO>(ref command);

            DataSet ds = new DataSet();
            ds = ExecuteSelectDsCommand("up_seclogin", CommandType.StoredProcedure);
            
            //ds= ExecuteParamerizedSelectDsCommand("", CommandType.StoredProcedure, ds.Tables[0].Rows["Userid"],ds.Tables)

            return ds;
        }

        public static DataSet GetAdministratorLogin(string _userID, string password)
        {
            string query = "select * from UserLogin where UserID='" + _userID + "' and UserPassword='" + password + "'";
            DataSet ds2 = new DataSet();
            ds2 = ExecuteSelectDsCommand(query, CommandType.Text);
            return ds2;
        }
    }
}
