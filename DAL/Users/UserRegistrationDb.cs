using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common.Users;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace DAL.Users
{
  public class UserRegistrationDb:DALBase
    {
        // New User registration

        public static void NewInsertUserRegistration(ref UserRegistrationDTO _NewInsertUser)
        {
            
            SqlCommand cmd = GetDbSprocCommand("sp_newinsertuser");
            cmd.Parameters.Add(CreateParameter("@FirstName", _NewInsertUser.FirstName, 50));
            cmd.Parameters.Add(CreateParameter("@LastName", _NewInsertUser.LastName, 50));
           // cmd.Parameters.Add(CreateParameter("@UserName", _NewInsertUser.EMPNO, 50));
            cmd.Parameters.Add(CreateParameter("@password", _NewInsertUser.Password, 50));
            cmd.Parameters.Add(CreateParameter("@Detail", _NewInsertUser.Detail, 200));
            cmd.Parameters.Add(CreateParameter("@DOB", _NewInsertUser.DOB));
            cmd.Parameters.Add(CreateParameter("@Gender", _NewInsertUser.Gender, 15));
            cmd.Parameters.Add(CreateParameter("@EmailID", _NewInsertUser.EmailID, 50));
            cmd.Parameters.Add(CreateParameter("@MobileNo", _NewInsertUser.MobileNo, 15));
            cmd.Parameters.Add(CreateParameter("@UserImage", _NewInsertUser.UserImage, 50));
            cmd.Parameters.Add(CreateParameter("@UserImagePath", _NewInsertUser.UserImagePath, 500));
            cmd.Parameters.Add(CreateParameter("@CountryID", _NewInsertUser.CountryID));
            cmd.Parameters.Add(CreateParameter("@StateID", _NewInsertUser.StateID));
            cmd.Parameters.Add(CreateParameter("@CityID", _NewInsertUser.CityID));
            cmd.Parameters.Add(CreateParameter("@DepartmentID", _NewInsertUser.DepartmentID));
            cmd.Parameters.Add(CreateParameter("@DesignationID", _NewInsertUser.DesignationID));
            cmd.Parameters.Add(CreateParameter("@CurrentAddress", _NewInsertUser.CurrentAddress, 200));
            cmd.Parameters.Add(CreateParameter("@PermanentAddress", _NewInsertUser.PermanentAddress, 200));
            cmd.Parameters.Add(CreateParameter("@LocationZoneID", _NewInsertUser.LocationZoneID));
            cmd.Parameters.Add(CreateParameter("@DocFileUpload", _NewInsertUser.DocFileUpload, 500));
            cmd.Parameters.Add(CreateParameter("@docfileName", _NewInsertUser.docfileName, 100));
            cmd.Connection.Open();
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();

            //  below in Table structure column name for below purpose
            //@IsAuthenticated bit,  -- if create registration first time by default authentication value will be 0 after first login 1 will update
            //@IsAuthorized bit,  ---- if create registration first time by default authentication value will be 0 after first login & roleid assigned then value will be 1  update
            //@DocFileUpload nvarchar(500),   --any document uploading
            //@LoginAttempted int,  ---- if create registration first time by default authentication value will be 0 after first login 1 will update
            //@IsChangedDefaultPassword bit -- if create registration first time by default password has generated & value will be 0 after changed password by users then it will be value  1  update


        }


        //  Below method for  Update DefaultPassword after created random password during the new registration
        public static void UpdateDefaultPasswordRegistration(ref UserRegistrationDTO _updateDefaultPass)
        {
            SqlCommand cmd = GetDbSprocCommand("sp_updatedefaultpasswordInRegistration");
            cmd.Parameters.Add(CreateParameter("@EMPNO", _updateDefaultPass.EMPNO, 10));
            cmd.Parameters.Add(CreateParameter("@Password", _updateDefaultPass.Password, 50));
           
            cmd.Connection.Open();
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();

        }


        public static void ChangePasswordRegistration(ref UserRegistrationDTO _changepass)
        {
            string message = string.Empty;
            SqlCommand cmd =GetDbSprocCommand("sp_updatepassword");
            cmd.Parameters.Add(CreateParameter("@EMPNO", _changepass.EMPNO, 10));
            cmd.Parameters.Add(CreateParameter("@Password", _changepass.Password, 50));

            // for help https://www.c-sharpcorner.com/UploadFile/rohatash/get-out-parameter-from-a-stored-procedure-in-Asp-Net/
            // Check already exists from store procedure. 
            cmd.Parameters.Add("@ERROR", SqlDbType.Char, 500);
            cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
            cmd.Connection.Open();
            cmd.ExecuteNonQuery();
            message = (string)cmd.Parameters["@ERROR"].Value;
            _changepass.ERROR = message;   // assign for display message in aspx page
            cmd.Connection.Close();

        }


            //  Role assign to users -- it means update into users table to roleID as per selected role 
         public static void RoleAssignToUsers(ref UserRegistrationDTO _roleuser)
          {
            string message = string.Empty;
            SqlCommand cmd = GetDbSprocCommand("sp_assignroletousers");
            cmd.Parameters.Add(CreateParameter("@EMPNO", _roleuser.EMPNO, 10));
            cmd.Parameters.Add(CreateParameter("RoleID", _roleuser.RoleID));

            cmd.Parameters.Add("@ERROR", SqlDbType.Char, 500);
            cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
            cmd.Connection.Open();
            cmd.ExecuteNonQuery();
            message = (string)cmd.Parameters["@ERROR"].Value;

            _roleuser.ERROR = message;   // assign for display message in aspx page
            cmd.Connection.Close();

        }


        public static DataSet GetAllUsersByDataSet()  //  Use of DataSet
        {
            //  here optional parameter has used and result will be same
            //DataSet ds = ExecuteSelectDsCommand("sp_GetAllUsersByEmpno", CommandType.StoredProcedure);  
           
            DataSet ds = ExecuteSelectDsCommand("sp_GetAllUsers",CommandType.StoredProcedure);
            return ds;
        }

        public static DataTable GetAllUsersByDataTable()  //Use of DataTable
        {
            //  here optional parameter has used and result will be same
            //DataSet ds = ExecuteSelectDsCommand("sp_GetAllUsersByEmpno", CommandType.StoredProcedure);  

            DataTable _dT =ExecuteSelectDtCommand("sp_GetAllUsers", CommandType.StoredProcedure);
            return _dT;
        }

        //First Create the Custom Paging Stored Procedure 
        //that will take 2 parameters (pageNo and pageSize), and fetch the records of that page.

        public static DataTable GetAllUsersByDataTableForCustomerPaging(ref UserRegistrationDTO _user)  //Use of DataTable
        {
            SqlParameter[] myparam = new SqlParameter[2];

            myparam[0] = new SqlParameter("@PageNo", SqlDbType.Int);
            myparam[0].Value = _user.PageNo;

            myparam[1] = new SqlParameter("@PageSize", SqlDbType.Int);
            myparam[1].Value = _user.PageSize;

            DataTable _dT =ExecuteParamerizedSelectDtCommand("sp_GetProductByCustomPaging", CommandType.StoredProcedure,myparam);
            return _dT;
        }




        //  This method is very very important for UserRegistration Detail Finding by Empno-  this will be use in multiple case
        public static DataSet GetAllUsersBYEmpNO(ref UserRegistrationDTO _UserEmpno)
        {
            SqlParameter[] myparam = new SqlParameter[1];

            myparam[0] = new SqlParameter("@EMPNO", SqlDbType.VarChar, 10);
            myparam[0].Value = _UserEmpno.EMPNO;

            //  sp_GetAllUsersByEmpno - this SP is used in optional parameter if you mention with parameter or without parameter also

            DataSet ds =ExecuteParamerizedSelectDsCommand("sp_GetAllUsersByEmpno", CommandType.StoredProcedure,myparam);
            return ds;
        }


        // Search by either one or multiple column in UserRegistration Details
        //created on 26th July 5 PM
        //public static DataTable SearchUserRegistrationByOneORMultipleConditions(ref UserRegistrationDTO _uSearch)
        public static DataSet SearchUserRegistrationByOneORMultipleConditions(ref UserRegistrationDTO _uSearch)
        {
            SqlParameter[] myparam = new SqlParameter[13];

            myparam[0] = new SqlParameter("@FirstName", SqlDbType.VarChar, 50);
            myparam[0].Value = _uSearch.FirstName;

            myparam[1] = new SqlParameter("@LastName", SqlDbType.VarChar, 50);
            myparam[1].Value = _uSearch.LastName;

            myparam[2] = new SqlParameter("@FromDate", SqlDbType.DateTime);
            if (_uSearch.FromRegistrationDate != DateTime.MinValue)
            {
                myparam[2].Value = _uSearch.FromRegistrationDate;
            }
            else
            {
                myparam[2].Value = DBNull.Value;
            }

            myparam[3] = new SqlParameter("@ToDate", SqlDbType.DateTime);
            if (_uSearch.ToRegistrationDate != DateTime.MinValue)
            {
                myparam[3].Value = _uSearch.ToRegistrationDate;
            }
            else
            {
                myparam[3].Value = DBNull.Value;
            }

            //myparam[4] = new SqlParameter("@MinAge", SqlDbType.DateTime);
            //myparam[4].Value = _uSearch.DOB;

            //myparam[5] = new SqlParameter("@MaxAge", SqlDbType.DateTime);
            //myparam[5].Value = _uSearch.DOB;

            myparam[4] = new SqlParameter("@EmailID", SqlDbType.VarChar, 100);
            myparam[4].Value = _uSearch.EmailID;

            myparam[5] = new SqlParameter("@MobileNo", SqlDbType.VarChar, 20);
            myparam[5].Value = _uSearch.MobileNo;

            myparam[6] = new SqlParameter("@StateID", SqlDbType.Int);
            //if (_uSearch.StateID == -2147483648)  // Replace -2147483648 with the appropriate default value for StateID
            if (_uSearch.StateID ==int.MinValue)  // Replace -2147483648 with the appropriate default value for StateID
            {
                myparam[6].Value = DBNull.Value;  // Pass DBNull.Value for NULL parameter
            }
            else
            {
                myparam[6].Value = _uSearch.StateID;
            }

            myparam[7] = new SqlParameter("@CityID", SqlDbType.Int);
            if (_uSearch.CityID == int.MinValue)  // Replace -2147483648 with the appropriate default value for StateID
            {
                myparam[7].Value = DBNull.Value;  // Pass DBNull.Value for NULL parameter
            }
            else
            {
                myparam[7].Value = _uSearch.CityID;
            }
            
            //myparam[10] = new SqlParameter("@DOB", SqlDbType.DateTime);
            //myparam[10].Value = _uSearch.DOB;

            myparam[8] = new SqlParameter("@RoleID", SqlDbType.Int);
            if (_uSearch.RoleID == int.MinValue)  // Replace -2147483648 with the appropriate default value for StateID
            {
                myparam[8].Value = DBNull.Value;  // Pass DBNull.Value for NULL parameter
            }
            else
            {
                myparam[8].Value = _uSearch.RoleID;
            }
            
            myparam[9] = new SqlParameter("@LocationZoneID", SqlDbType.Int);
            if (_uSearch.LocationZoneID == int.MinValue)  // Replace -2147483648 with the appropriate default value for StateID
            {
                myparam[9].Value = DBNull.Value;  // Pass DBNull.Value for NULL parameter
            }
            else
            {
                myparam[9].Value = _uSearch.LocationZoneID;
            }            

            myparam[10] = new SqlParameter("@Gender", SqlDbType.VarChar, 50);
            if (_uSearch.Gender != null && _uSearch.Gender != "0")
            {
                myparam[10].Value = _uSearch.Gender;
            }
            else
            {
                myparam[10].Value = DBNull.Value;
            }

            myparam[11] = new SqlParameter("@MinAge", SqlDbType.Int);
            if(_uSearch.MinAge==0)
            {
               myparam[11].Value = DBNull.Value;
            }
            else
            {
                myparam[11].Value = _uSearch.MinAge;
            }

            myparam[12] = new SqlParameter("@MaxAge", SqlDbType.Int);
            if (_uSearch.MaxAge==0)
            {
                myparam[12].Value = DBNull.Value;
            }
            else
            {
                myparam[12].Value = _uSearch.MaxAge;
            }

            DataSet _dtSearch = ExecuteParamerizedSelectDsCommand("sp_SearchUserRegistrationsWithOneOrMultipleCondition", CommandType.StoredProcedure, myparam);

            return _dtSearch;

        }

        // Below method used for Assign RoleID to users with some conditions. not all users
        public static DataSet GetAllUsersForRolesAssignByDataSet()  //  Use of DataSet
        {
            DataSet ds = ExecuteSelectDsCommand("sp_sp_GetAllUsersForRoleAssign", CommandType.StoredProcedure);
            return ds;
        }

        //  Get User detail by EMPNO in Role Assign to user 
        public static DataSet GetAllUsersForRolesAssignByDataSetWithEMPNO(ref UserRegistrationDTO _getUEMPNO)  //  Use of DataSet
        {
            SqlParameter[] myparam = new SqlParameter[1];

            myparam[0] = new SqlParameter("@EMPNO", SqlDbType.VarChar, 10);
            myparam[0].Value = _getUEMPNO.EMPNO;
            DataSet ds =ExecuteParamerizedSelectDsCommand("sp_sp_GetAllUsersForRoleAssign", CommandType.StoredProcedure,myparam);
            return ds;
        }

        // Below method for the only Assigned users with role
        public static DataSet GetAllAssignedUsersWithRoleID()  //  Use of DataSet
        {
            DataSet ds = ExecuteSelectDsCommand("sp_GeGetAllAssignedUsersWithRoleID", CommandType.StoredProcedure);
            return ds;
        }


    }
}
