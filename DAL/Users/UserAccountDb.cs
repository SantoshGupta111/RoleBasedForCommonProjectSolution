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
using System.Configuration;


namespace DAL.Users
{
   public class UserAccountDb:DALBase
    {
        #region EmployeeRegistrationAccount Insert / Update / Delete / GetAll / GetAllBy
        //Employee Insert
        public static void NewInsertEmployeeRegAccount(ref UserDTO _newinsertemployee)
        {
            SqlCommand command = GetDbSprocCommand("InsertEmployeeRegAccount");
            command.Parameters.Add(CreateParameter("@Password", _newinsertemployee.Password, 50));
            command.Parameters.Add(CreateParameter("@Title", _newinsertemployee.Title, 10));
            command.Parameters.Add(CreateParameter("@FirstName", _newinsertemployee.FirstName, 30));
            command.Parameters.Add(CreateParameter("@MiddleName", _newinsertemployee.MiddleName, 30));
            command.Parameters.Add(CreateParameter("@LastName", _newinsertemployee.LastName, 30));
            command.Parameters.Add(CreateParameter("@DOB", _newinsertemployee.DOB));
            command.Parameters.Add(CreateParameter("@Age", _newinsertemployee.Age));
            command.Parameters.Add(CreateParameter("@Gender", _newinsertemployee.Gender, 10));
            command.Parameters.Add(CreateParameter("@City", _newinsertemployee.City, 50));
            command.Parameters.Add(CreateParameter("@State", _newinsertemployee.State, 50));
            command.Parameters.Add(CreateParameter("@Country", _newinsertemployee.Country, 50));
            command.Parameters.Add(CreateParameter("@OfficeEmailID", _newinsertemployee.OfficeEmailID, 50));
            command.Parameters.Add(CreateParameter("@NonOfficeEmailID", _newinsertemployee.NonOfficeEmailID, 50));
            command.Parameters.Add(CreateParameter("@UserType", _newinsertemployee.UserType));
            command.Parameters.Add(CreateParameter("@Department", _newinsertemployee.Department, 50));
            command.Parameters.Add(CreateParameter("@Designation", _newinsertemployee.Designation, 50));
            command.Parameters.Add(CreateParameter("@WorkLocation", _newinsertemployee.WorkLocation, 50));
            command.Parameters.Add(CreateParameter("@PermanentLocation", _newinsertemployee.PermanentLocation, 500));
            command.Parameters.Add(CreateParameter("@ContactNumber", _newinsertemployee.ContactNumber, 15));
            command.Parameters.Add(CreateParameter("@MobileNumber", _newinsertemployee.MobileNumber, 15));
            command.Parameters.Add(CreateParameter("@CurrentLocation", _newinsertemployee.CurrentLocation, 500));
            command.Parameters.Add(CreateParameter("@CurrentContactNumber", _newinsertemployee.CurrentContactNumber, 15));
            command.Parameters.Add(CreateParameter("@PhotoUpload", _newinsertemployee.PhotoUpload, 200));
            command.Parameters.Add(CreateParameter("@EmployeeCategory", _newinsertemployee.EmployeeCategory, 50));
            command.Parameters.Add(CreateParameter("@UnitLocation", _newinsertemployee.UnitLocation, 50));
            command.Parameters.Add(CreateParameter("@DateOfJoining", _newinsertemployee.DateOfJoining));

            command.Connection.Open();
            command.ExecuteNonQuery();
            command.Connection.Close();

        }

        public static void NewUpdateEmployeeRegAccount(ref UserDTO _newupdateemployee)
        {
           
            SqlCommand command = GetDbSprocCommand("UpdateEmployeeRegAccount");
            command.Parameters.Add(CreateParameter("@EMPNO", _newupdateemployee.EMPNO, 10));
            command.Parameters.Add(CreateParameter("@Title", _newupdateemployee.Title, 10));
            command.Parameters.Add(CreateParameter("@FirstName", _newupdateemployee.FirstName, 30));
            command.Parameters.Add(CreateParameter("@MiddleName", _newupdateemployee.MiddleName, 30));
            command.Parameters.Add(CreateParameter("@LastName", _newupdateemployee.LastName, 30));
            command.Parameters.Add(CreateParameter("@DOB", _newupdateemployee.DOB));
            command.Parameters.Add(CreateParameter("@Age", _newupdateemployee.Age));
            command.Parameters.Add(CreateParameter("@Gender", _newupdateemployee.Gender, 10));
            command.Parameters.Add(CreateParameter("@City", _newupdateemployee.City, 50));
            command.Parameters.Add(CreateParameter("@State", _newupdateemployee.State, 50));
            command.Parameters.Add(CreateParameter("@Country", _newupdateemployee.Country, 50));
            command.Parameters.Add(CreateParameter("@OfficeEmailID", _newupdateemployee.OfficeEmailID, 50));
            command.Parameters.Add(CreateParameter("@NonOfficeEmailID", _newupdateemployee.NonOfficeEmailID, 50));
            command.Parameters.Add(CreateParameter("@UserType", _newupdateemployee.UserType));
            command.Parameters.Add(CreateParameter("@Department", _newupdateemployee.Department, 50));
            command.Parameters.Add(CreateParameter("@Designation", _newupdateemployee.Designation, 50));
            command.Parameters.Add(CreateParameter("@WorkLocation", _newupdateemployee.WorkLocation, 50));
            command.Parameters.Add(CreateParameter("@PermanentLocation", _newupdateemployee.PermanentLocation, 500));
            command.Parameters.Add(CreateParameter("@ContactNumber", _newupdateemployee.ContactNumber, 15));
            command.Parameters.Add(CreateParameter("@MobileNumber", _newupdateemployee.MobileNumber, 15));
            command.Parameters.Add(CreateParameter("@CurrentLocation", _newupdateemployee.CurrentLocation, 500));
            command.Parameters.Add(CreateParameter("@CurrentContactNumber", _newupdateemployee.CurrentContactNumber, 15));
            command.Parameters.Add(CreateParameter("@ManageUserAccountDate", _newupdateemployee.ManageUserAccountDate));
            command.Parameters.Add(CreateParameter("@EmployeeCategory", _newupdateemployee.EmployeeCategory, 50));
            command.Parameters.Add(CreateParameter("@UnitLocation", _newupdateemployee.UnitLocation, 50));
            command.Connection.Open();
            command.ExecuteNonQuery();
            command.Connection.Close();
        }

        public static void NewUpdateEmployeePhoto(ref UserDTO _newupdateemployeePhoto)
        {
            SqlCommand command = GetDbSprocCommand("UpdateEmployeePhoto");
            command.Parameters.Add(CreateParameter("@EMPNO", _newupdateemployeePhoto.EMPNO, 10));
            command.Parameters.Add(CreateParameter("@PhotoUpload", _newupdateemployeePhoto.PhotoUpload, 200));
            command.Connection.Open();
            command.ExecuteNonQuery();
            command.Connection.Close();
        }

        public static void NewDeleteEmployeeRegAccount(ref UserDTO _newdeleteemployee)
        {
            SqlCommand command = GetDbSprocCommand("DeleteEmployeeRegAccount");
            command.Parameters.Add(CreateParameter("@EMPNO", _newdeleteemployee.EMPNO, 10));
            command.Connection.Open();
            command.ExecuteNonQuery();
            command.Connection.Close();
        }

        #endregion

        #region Exists Records
        public static bool IsExistsEmployeeOfficeEmailID(string _OfficeemailID)
        {
            
            string SqlCustNo = "select OfficeEmailID from UserRegAccount where OfficeEmailID='" +_OfficeemailID + "'";
            DataSet _dsCustno = new DataSet();
            _dsCustno = ExecuteSelectDsCommand(SqlCustNo, CommandType.Text);
            if (_dsCustno.Tables[0].Rows.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public static bool IsExistsEmployeeNonOfficeEmailID(string _NonOfficeemailID)
        {
            string SqlCustNo = "select NonOfficeEmailID from UserRegAccount where NonOfficeEmailID='" + _NonOfficeemailID + "'";
            DataSet _dsCustno = new DataSet();
            _dsCustno = ExecuteSelectDsCommand(SqlCustNo, CommandType.Text);
            if (_dsCustno.Tables[0].Rows.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        #endregion

        #region Update-IsLoginAttempedUpdated/IsLockedAccountUpdated


        public static void IsLoginAttempedUpdated(ref UserDTO _isloginattemped)
        {
            string sqlUpdate = "Update UserRegAccount set LoginAttempted=@LoginAttempted where EMPNO=@EMPNO";
            SqlCommand command = GetDbSQLCommand(sqlUpdate);
            try
            {
                command.Parameters.Add(CreateParameter("@EMPNO", _isloginattemped.EMPNO, 10));
                command.Parameters.Add(CreateParameter("@LoginAttempted", _isloginattemped.LoginAttempted));
            }
            finally
            {
                command.Connection.Open();
                command.ExecuteNonQuery();
                command.Connection.Close();
            }
        }

        public static void IsLockedAccountUpdated(ref UserDTO _islockedaccount)
        {
            string sqlUpdate = "Update UserRegAccount set IsLockedAccount=@IsLockedAccount where EMPNO=@EMPNO";
            SqlCommand command = GetDbSQLCommand(sqlUpdate);
            try
            {
                command.Parameters.Add(CreateParameter("@EMPNO", _islockedaccount.EMPNO, 10));
                command.Parameters.Add(CreateParameter("@LoginAttempted", _islockedaccount.IsLockedAccount));
            }
            finally
            {
                command.Connection.Open();
                command.ExecuteNonQuery();
                command.Connection.Close();
            }

        }

        public static void PasswordChange(string _EmpCode, string _Pass)
        {            
            string sqlUpdate = "Update UserRegAccount set Password=@Password where EMPNO=@EMPNO";
            SqlCommand command = GetDbSQLCommand(sqlUpdate);
            try
            {
                command.Parameters.Add(CreateParameter("@EMPNO", _EmpCode, 10));
                command.Parameters.Add(CreateParameter("@Password", _Pass, 50));
            }
            finally
            {
                command.Connection.Open();
                command.ExecuteNonQuery();
                command.Connection.Close();
            }

        }
        public static void PasswordChangemaster(string _EmpCode, string _Pass)
        {
            string sqlUpdate = "Update tbl_UserPassword set Password=@Password where EMPNO=@EMPNO";
            SqlCommand command = GetDbSQLCommand(sqlUpdate);
            try
            {
                command.Parameters.Add(CreateParameter("@EMPNO", _EmpCode, 10));
                command.Parameters.Add(CreateParameter("@Password", _Pass, 50));
            }
            finally
            {
                command.Connection.Open();
                command.ExecuteNonQuery();
                command.Connection.Close();
            }

        }


        public static void IsDefaultPasswordUpdate(string _EmpCode, string _Pass)
        {
            string sqlUpdate = "Update UserRegAccount set Password=@Password,IsChangedDefaultPassword=1 where EMPNO=@EMPNO";
            SqlCommand command = GetDbSQLCommand(sqlUpdate);
            try
            {
                command.Parameters.Add(CreateParameter("@EMPNO", _EmpCode, 10));
                command.Parameters.Add(CreateParameter("@Password", _Pass, 50));
            }
            finally
            {
                command.Connection.Open();
                command.ExecuteNonQuery();
                command.Connection.Close();
            }

        }

        public static void IsDefaultPasswordUpdatemaster(string _EmpCode, string _Pass)
        {
            string sqlUpdate = "Update tbl_UserPassword set Password=@Password,IsChangedDefaultPassword=1 where EMPNO=@EMPNO";
            SqlCommand command = GetDbSQLCommand(sqlUpdate);
            try
            {
                command.Parameters.Add(CreateParameter("@EMPNO", _EmpCode, 10));
                command.Parameters.Add(CreateParameter("@Password", _Pass, 50));
            }
            finally
            {
                command.Connection.Open();
                command.ExecuteNonQuery();
                command.Connection.Close();
            }

        }


        public static void ChangeManagePassword(string _EmpCode, string _OldPass, string _NewPass)
        {
            string sqlUpdate = "Update UserRegAccount set Password=@Password where EMPNO='" + _EmpCode + "' and Password='" + _OldPass + "'";
            SqlCommand command = GetDbSQLCommand(sqlUpdate);
            try
            {
                command.Parameters.Add(CreateParameter("@Password", _NewPass, 50));
            }
            finally
            {
                command.Connection.Open();
                command.ExecuteNonQuery();
                command.Connection.Close();
            }

        }


        public static void UpdateLoginAttemped(string _EmpCode)
        {
            string sqlUpdate = "Update UserRegAccount set IsAttemptedPassword=1 where EMPNO=@EMPNO";
            SqlCommand command = GetDbSQLCommand(sqlUpdate);
            try
            {
                command.Parameters.Add(CreateParameter("@EMPNO", _EmpCode, 10));
            }
            finally
            {
                command.Connection.Open();
                command.ExecuteNonQuery();
                command.Connection.Close();
            }
        }

        #endregion

        #region GetByReferenceID  by Datareader used

        //public static UserDTO GetLoginValidate(string empno, string password)
        //{
        //    //string sqlHospital = "select * from HospitalMaster where IsActive=1";
        //    SqlCommand command = GetDbSprocCommand("sp_Userlogined");
        //    command.Parameters.Add(CreateParameter("@EMPNO", empno, 10));
        //    command.Parameters.Add(CreateParameter("@Password", password, 30));
        //    return GetSingleDTO<UserDTO>(ref command);
        //}

        #endregion



        //public static UserDTO GetValidLoginByIDNew(string empno, string pass)
        //{
        //    SqlCommand command = GetDbSprocCommand("SP_LoginCredential");
        //    command.Parameters.Add(CreateParameter("@_Suid", empno, 10));
        //    command.Parameters.Add(CreateParameter("@_Spassword", pass, 50));
        //    return GetSingleDTO<UserDTO>(ref command);
        //}

        public static DataSet GetValidLoginByID(string empno, string pass)
        {
            //SP_LoginCredential
            ////#region SQL
            ////string Query = "select Designation, EMPNO,Title,FirstName,MiddleName,LastName,ReportingToSeniorCode,EmployeeCategory,UnitLocation,OfficeEmailID,NonOfficeEmailID,Password,UserType,UserRegAccount.IsActive,IsLockedAccount,Uid,Title+' '+FirstName+' '+MiddleName+' '+LastName AS Name,LoginAttempted,IsAttemptedPassword,IsChangedDefaultPassword,PhotoUpload,UserRole.RoleName as EmpRoleType,flag,WorkLocationMaster.WorkLocationName As WorkLocationCV from UserRegAccount left outer join UserRole on UserRegAccount.UserType=UserRole.RoleId left outer join WorkLocationMaster on UserRegAccount.WorkLocation=WorkLocationMaster.Id where EMPNO= '" + empno + "'  and Password='" + pass + "'";
            ////#endregion
            ////DataSet ds = new DataSet();
            ////ds =ExecuteSelectDsCommand(Query, CommandType.Text);
            ////return ds;

            //-------------
            SqlConnection _conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MidasPCTouchConnectionString"].ToString());
            DataSet ds = new DataSet();
            SqlCommand sqlComm = new SqlCommand("SP_LoginCredential", _conn);
            sqlComm.Parameters.AddWithValue("@_Suid", empno);
            sqlComm.Parameters.AddWithValue("@_Spassword", pass);
            sqlComm.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = sqlComm;
            da.Fill(ds);
            return ds;

        }

        public static DataSet GetLoginDetailsByEMPCODE(string empno)
        {
            #region SQL
            //string Query = "select EMPNO,Title,FirstName,MiddleName,LastName,OfficeEmailID,NonOfficeEmailID,Password,UserType,IsActive,IsLockedAccount,Uid,Title+' '+FirstName+' '+MiddleName+' '+LastName AS Name,LoginAttempted,IsAttemptedPassword,IsChangedDefaultPassword from UserRegAccount where EMPNO= '" + empno + "'  and Password='" + pass + "' and IsActive=1 and IsLockedAccount=0 and IsAttemptedPassword=0 and IsChangedDefaultPassword=0";
            string QuerySql = "select EMPNO,Password,Title,FirstName,MiddleName,LastName,EmployeeCategory,UnitLocation,DOB,Convert(varchar(11),DOB,106)As DOBCV,OfficeEmailID,NonOfficeEmailID,Password,Age,Gender,City,State,Country,Department,Designation,WorkLocation,PermanentLocation,ContactNumber,MobileNumber,CurrentLocation,CurrentContactNumber,ManageUserAccountDate,UserType,UserRegAccount.IsActive,IsLockedAccount,Uid,FirstName+' '+LastName AS Name,LoginAttempted,IsAttemptedPassword,IsChangedDefaultPassword,PhotoUpload,UserRole.RoleName as EmpRoleType,WorkLocationMaster.WorkLocationName As WorkLocationCV from UserRegAccount left outer join UserRole on UserRegAccount.UserType=UserRole.RoleId left outer join WorkLocationMaster on UserRegAccount.WorkLocation=WorkLocationMaster.Id where EMPNO= '" + empno + "'";
            #endregion
            DataSet dsSql = new DataSet();
            dsSql = ExecuteSelectDsCommand(QuerySql, CommandType.Text);
            return dsSql;

        }

        public static DataSet GetLoginDetailsByEMPCODEandPass(string empno,string pass)
        {
            #region SQL
            string QuerySql = "select EMPNO,Password from UserRegAccount where EMPNO= '" + empno + "' and password='"+pass+"'";
            #endregion
            DataSet dsSql = new DataSet();
            dsSql = ExecuteSelectDsCommand(QuerySql, CommandType.Text);
            return dsSql;

        }

        // forgot password
        public static DataSet GetLoginDetailsByOfficeEmailID(string _officeEmailID)
        {
            #region SQL
            string QuerySqlemail = "select EMPNO,Title,FirstName,MiddleName,LastName,EmployeeCategory,UnitLocation,password,DOB,OfficeEmailID,NonOfficeEmailID,Password,UserType,Uid,FirstName+' '+LastName AS Name,UserRegAccount.IsActive,IsLockedAccount,LoginAttempted,IsAttemptedPassword,IsChangedDefaultPassword,UserRole.RoleName as EmpRoleType from UserRegAccount left outer join UserRole on UserRegAccount.UserType=UserRole.RoleId where OfficeEmailID='" + _officeEmailID + "'and IsActive=1 and IsLockedAccount=0 and LoginAttempted=0 and IsAttemptedPassword=0 and IsChangedDefaultPassword=1";
            #endregion
            DataSet dsSqlemail = new DataSet();
            dsSqlemail = ExecuteSelectDsCommand(QuerySqlemail, CommandType.Text);
            return dsSqlemail;

        }

        public static DataSet GetLatestEMPCODE()
        {
            string SqlEmpInfo = "select top 1* from UserRegAccount order by EMPNO desc";
            DataSet dsemp = new DataSet();
            dsemp = ExecuteSelectDsCommand(SqlEmpInfo, CommandType.Text);
            return dsemp;
        }




        //==================For Manage Insert/Update/Delete Highlited

        public static DataSet GetAllEmployeeInfoManageDefaultPassword()
        {
            string SqlAllM = "select Uid,RegistrationDate,password,UserRegAccount.PhotoUpload,EMPNO,EmployeeCategory,UnitLocation,CONVERT(varchar(11),RegistrationDate,106)as RegistrationDateCV,Title+' '+FirstName+' '+ LastName As EmployeeName,Gender,OfficeEmailID,NonOfficeEmailID,UserType,Department,Designation,WorkLocation,MobileNumber,UserRegAccount.IsActive,IsLockedAccount,LoginAttempted,IsAttemptedPassword,ManageUserAccountDate,IsChangedDefaultPassword,UserRole.RoleName as EmpRoleType,WorkLocationMaster.WorkLocationName As WorkLocationCV from UserRegAccount left outer join UserRole on UserRegAccount.UserType=UserRole.RoleId left outer join WorkLocationMaster on UserRegAccount.WorkLocation=WorkLocationMaster.Id where IsChangedDefaultPassword=0 and IsLockedAccount=0 and Uid>18 order by ManageUserAccountDate desc";
            DataSet dsAllM = new DataSet();
            dsAllM = ExecuteSelectDsCommand(SqlAllM, CommandType.Text);
            return dsAllM;
        }


        public static DataSet GetAllEmployeeInfoManage()
        {            
            string SqlAllM = "select Uid,RegistrationDate,password,UserRegAccount.PhotoUpload,EMPNO,EmployeeCategory,UnitLocation,CONVERT(varchar(11),RegistrationDate,106)as RegistrationDateCV,Title+' '+FirstName+' '+ LastName As EmployeeName,Gender,OfficeEmailID,NonOfficeEmailID,UserType,Department,Designation,WorkLocation,MobileNumber,UserRegAccount.IsActive,IsLockedAccount,LoginAttempted,IsAttemptedPassword,ManageUserAccountDate,IsChangedDefaultPassword,UserRole.RoleName as EmpRoleType,WorkLocationMaster.WorkLocationName As WorkLocationCV from UserRegAccount left outer join UserRole on UserRegAccount.UserType=UserRole.RoleId left outer join WorkLocationMaster on UserRegAccount.WorkLocation=WorkLocationMaster.Id order by ManageUserAccountDate desc";
            DataSet dsAllM = new DataSet();
            dsAllM = ExecuteSelectDsCommand(SqlAllM, CommandType.Text);
            return dsAllM;
        }

        public static DataSet TotalEmployeeCount()
        {
            string SqlTotal = "select count(*) as TotalCountRecords from UserRegAccount";
            DataSet dsTotal = new DataSet();
            dsTotal = ExecuteSelectDsCommand(SqlTotal, CommandType.Text);
            return dsTotal;
        }




        //==========================================only for others

        public static DataSet PageRedirectFromTopMenu(int _menuId)
        {
            #region SQL
            //string Query = "select EMPNO,Title,FirstName,MiddleName,LastName,OfficeEmailID,NonOfficeEmailID,Password,UserType,IsActive,IsLockedAccount,Uid,Title+' '+FirstName+' '+MiddleName+' '+LastName AS Name,LoginAttempted,IsAttemptedPassword,IsChangedDefaultPassword from UserRegAccount where EMPNO= '" + empno + "'  and Password='" + pass + "' and IsActive=1 and IsLockedAccount=0 and IsAttemptedPassword=0 and IsChangedDefaultPassword=0";
            string Queryurll = "select * from MenuItems where MenuId='" + _menuId + "' and ParentId=0";
            #endregion
            DataSet dsSqlurll = new DataSet();
            dsSqlurll = ExecuteSelectDsCommand(Queryurll, CommandType.Text);
            return dsSqlurll;

        }


        //==========Search Details Start=============
        public static DataSet GetAllEmployeeInfoDetails(string _from, string _to)
        {
            string SqlAll = "select Uid,RegistrationDate,EMPNO,FirstName,EmployeeCategory,UnitLocation,CONVERT(varchar(11),RegistrationDate,106)as RegistrationDateCV,Title+' '+FirstName+' '+LastName As EmployeeName,Gender,OfficeEmailID,NonOfficeEmailID,UserType,Department,Designation,WorkLocation,MobileNumber,UserRegAccount.IsActive,IsLockedAccount,LoginAttempted,IsAttemptedPassword,ManageUserAccountDate,IsChangedDefaultPassword,UserRole.RoleName as EmpRoleType,WorkLocationMaster.WorkLocationName As WorkLocationCV from UserRegAccount left outer join UserRole on UserRegAccount.UserType=UserRole.RoleId left outer join WorkLocationMaster on UserRegAccount.WorkLocation=WorkLocationMaster.Id where RegistrationDate between('" + _from + "')and('" + _to + "') order by EMPNO";
            DataSet dsAll = new DataSet();
            dsAll = ExecuteSelectDsCommand(SqlAll, CommandType.Text);
            return dsAll;
        }
        public static DataSet GetAllEmployeeInfoDetailsBySelectedConditions(string ConditionsQuery)
        {
            string SqlSearch = "select Uid,RegistrationDate,EMPNO,FirstName,EmployeeCategory,UnitLocation,CONVERT(varchar(11),RegistrationDate,106)as RegistrationDateCV,Title+' '+FirstName+' '+ LastName As EmployeeName,Gender,OfficeEmailID,NonOfficeEmailID,UserType,Department,Designation,WorkLocation,MobileNumber,UserRegAccount.IsActive,IsLockedAccount,LoginAttempted,IsAttemptedPassword,ManageUserAccountDate,IsChangedDefaultPassword,UserRole.RoleName as EmpRoleType,WorkLocationMaster.WorkLocationName As WorkLocationCV from UserRegAccount left outer join UserRole on UserRegAccount.UserType=UserRole.RoleId left outer join WorkLocationMaster on UserRegAccount.WorkLocation=WorkLocationMaster.Id where " + ConditionsQuery;
            DataSet dsSearch = new DataSet();
            dsSearch = ExecuteSelectDsCommand(SqlSearch, CommandType.Text);
            return dsSearch;
        }

        //==========Search Details End=============


        //=====================For RoleAccessbility 31 may 2013 10 AM ========================
        public static DataSet ChangeRoleAccessBility(int _RoleID)
        {
            string SqlChange = "select * from RoleAccessbility where RoleID='" + _RoleID + "'";
            DataSet dsChange = new DataSet();
            dsChange = ExecuteSelectDsCommand(SqlChange, CommandType.Text);
            return dsChange;
        }

        public static DataSet GetSurveyValidLoginByID(string empno, string pass)
        {            
            SqlConnection _conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MidasPCTouchConnectionString"].ToString());
            DataSet ds = new DataSet();
            SqlCommand sqlComm = new SqlCommand("SP_LoginSurveyCredential", _conn);
            sqlComm.Parameters.AddWithValue("@_Suid", empno);
            sqlComm.Parameters.AddWithValue("@_Spassword", pass);
            sqlComm.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = sqlComm;
            da.Fill(ds);
            return ds;

        }
    }
}
