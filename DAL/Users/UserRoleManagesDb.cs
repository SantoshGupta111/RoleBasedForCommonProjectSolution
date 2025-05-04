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
   public class UserRoleManagesDb:DALBase
    {
       public static DataSet GetUsersDetailsByEMPCODE(string empno)
       {
           #region SQL
           string QuerySql = "select UserType,registrationdate,DateOfJoining,EmployeeDepartmentMaster.EmployeeDepartmentName as DepartmentCV, EMPNO,Title,FirstName,MiddleName,LastName,EmployeeCategory,UnitLocation,DOB,Convert(varchar(11),DOB,106)As DOBCV,OfficeEmailID,NonOfficeEmailID,Password,Age,Gender,City,State,Country,Department,Designation,WorkLocation,PermanentLocation,ContactNumber,MobileNumber,CurrentLocation,CurrentContactNumber,ManageUserAccountDate,UserType,UserRegAccount.IsActive,IsLockedAccount,Uid,FirstName+' '+LastName AS Name,LoginAttempted,IsAttemptedPassword,IsChangedDefaultPassword,PhotoUpload,UserRole.RoleName as EmpRoleType,WorkLocationMaster.WorkLocationName As WorkLocationCV,DesignationMaster.DesignationName as DesignationNameCV from UserRegAccount left outer join UserRole on UserRegAccount.UserType=UserRole.RoleId left outer join WorkLocationMaster on UserRegAccount.WorkLocation=WorkLocationMaster.Id left outer join DesignationMaster on UserRegAccount.Designation=DesignationMaster.Id left outer join EmployeeDepartmentMaster on UserRegAccount.Department=EmployeeDepartmentMaster.Id where EMPNO= '" + empno + "'";
           #endregion
           DataSet dsSql = new DataSet();
           dsSql = ExecuteSelectDsCommand(QuerySql, CommandType.Text);
           return dsSql;

       }

       public static DataSet GetUsersDetailsReportingManagerByDesignation()
       {
           #region SQL
           string QuerySql = "select UserType,registrationdate,DateOfJoining,EmployeeDepartmentMaster.EmployeeDepartmentName as DepartmentCV, EMPNO,Title,FirstName,MiddleName,LastName,EmployeeCategory,UnitLocation,DOB,Convert(varchar(11),DOB,106)As DOBCV,OfficeEmailID,NonOfficeEmailID,Password,Age,Gender,City,State,Country,Department,Designation,WorkLocation,PermanentLocation,ContactNumber,MobileNumber,CurrentLocation,CurrentContactNumber,ManageUserAccountDate,UserType,UserRegAccount.IsActive,IsLockedAccount,Uid,FirstName+' '+LastName AS Name,LoginAttempted,IsAttemptedPassword,IsChangedDefaultPassword,PhotoUpload,UserRole.RoleName as EmpRoleType,WorkLocationMaster.WorkLocationName As WorkLocationCV,DesignationMaster.DesignationName as DesignationNameCV from UserRegAccount left outer join UserRole on UserRegAccount.UserType=UserRole.RoleId left outer join WorkLocationMaster on UserRegAccount.WorkLocation=WorkLocationMaster.Id left outer join DesignationMaster on UserRegAccount.Designation=DesignationMaster.Id left outer join EmployeeDepartmentMaster on UserRegAccount.Department=EmployeeDepartmentMaster.Id where designation!=-1 and UserType!=0";
           #endregion
           DataSet dsSql = new DataSet();
           dsSql = ExecuteSelectDsCommand(QuerySql, CommandType.Text);
           return dsSql;

       }


       public static DataSet GetReportingRole(int _desig)
       {
           #region SQL
           //string QuerySql = "select UserType,registrationdate,EmployeeDepartmentMaster.EmployeeDepartmentName as DepartmentCV, EMPNO,Title,FirstName,MiddleName,LastName,EmployeeCategory,UnitLocation,DOB,Convert(varchar(11),DOB,106)As DOBCV,OfficeEmailID,NonOfficeEmailID,Password,Age,Gender,City,State,Country,Department,Designation,WorkLocation,PermanentLocation,ContactNumber,MobileNumber,CurrentLocation,CurrentContactNumber,ManageUserAccountDate,UserType,UserRegAccount.IsActive,IsLockedAccount,Uid,FirstName+' '+LastName AS Name,LoginAttempted,IsAttemptedPassword,IsChangedDefaultPassword,PhotoUpload,UserRole.RoleName as EmpRoleType,WorkLocationMaster.WorkLocationName As WorkLocationCV,DesignationMaster.DesignationName as DesignationNameCV from UserRegAccount left outer join UserRole on UserRegAccount.UserType=UserRole.RoleId left outer join WorkLocationMaster on UserRegAccount.WorkLocation=WorkLocationMaster.Id left outer join DesignationMaster on UserRegAccount.Designation=DesignationMaster.Id left outer join EmployeeDepartmentMaster on UserRegAccount.Department=EmployeeDepartmentMaster.Id where designation <'" + _desig + "' and UserType!=0";
           string QuerySql = "select * from DesignationMaster where Id < '" + _desig +" ' and isactive=1";
           #endregion
           DataSet dsSql = new DataSet();
           dsSql = ExecuteSelectDsCommand(QuerySql, CommandType.Text);
           return dsSql;

       }

       // update on 15th april. purpose for reporting to senior bind ddl
       public static DataSet GetUsersDetailsReportingToSeniorByDesignation(int _designation, string _UnitLocation)
       {
           #region SQL
           //string QuerySql = "select UserType,registrationdate,EmployeeDepartmentMaster.EmployeeDepartmentName as DepartmentCV, EMPNO,Title,FirstName,MiddleName,LastName,EmployeeCategory,UnitLocation,DOB,Convert(varchar(11),DOB,106)As DOBCV,OfficeEmailID,NonOfficeEmailID,Password,Age,Gender,City,State,Country,Department,Designation,WorkLocation,PermanentLocation,ContactNumber,MobileNumber,CurrentLocation,CurrentContactNumber,ManageUserAccountDate,UserType,UserRegAccount.IsActive,IsLockedAccount,Uid,FirstName+' '+LastName AS Name,LoginAttempted,IsAttemptedPassword,IsChangedDefaultPassword,PhotoUpload,UserRole.RoleName as EmpRoleType,WorkLocationMaster.WorkLocationName As WorkLocationCV,DesignationMaster.DesignationName as DesignationNameCV from UserRegAccount left outer join UserRole on UserRegAccount.UserType=UserRole.RoleId left outer join WorkLocationMaster on UserRegAccount.WorkLocation=WorkLocationMaster.Id left outer join DesignationMaster on UserRegAccount.Designation=DesignationMaster.Id left outer join EmployeeDepartmentMaster on UserRegAccount.Department=EmployeeDepartmentMaster.Id where designation= '" +_designation + "'";

           string QuerySql = "Select UR.firstname, uR.Empno from UserRegAccount UR Left Join DesignationMaster DM ON UR.Designation = DM.Id Where DM.Id = '" + _designation + "' and UR.UnitLocation = '"+ _UnitLocation +"'";
           #endregion
           DataSet dsSql = new DataSet();
           dsSql = ExecuteSelectDsCommand(QuerySql, CommandType.Text);
           return dsSql;

       }


       public static void NewUpdateUserDetailsByUserEmpCode(string _desig,string _unitloc, int _usertype, string _empno)
       {
           string _QueryUpdate=string.Empty;
           _QueryUpdate = "update UserRegAccount set Designation='" + _desig + "', AgentRole=10, UnitLocation='" + _unitloc + "', usertype='" + _usertype + "' where empno='" + _empno + "'";
           //if (_desig != "1" && _usertype != 9 && _unitloc!="C3")
           //_QueryUpdate = "update UserRegAccount set Designation='" + _desig + "', AgentRole=10, UnitLocation='" + _unitloc + "', usertype='" + _usertype + "' where empno='" + _empno + "'";
           //else
           //    _QueryUpdate = "update UserRegAccount set Designation=-1, AgentRole=10, UnitLocation='" + _unitloc + "', usertype=0 where empno='" + _empno + "'";
           SqlCommand command = GetDbSQLCommand(_QueryUpdate);
           command.Connection.Open();
           command.ExecuteNonQuery();
           command.Connection.Close();
       }


       public static DataSet GetForManageReportingToUsersDetailsByALL()
       {
           #region SQL
           //change due to not display new name//string QuerySql = "select UserType,EmployeeDepartmentMaster.EmployeeDepartmentName as DepartmentCV, EMPNO,Title,FirstName,MiddleName,title+' '+firstname+' '+lastname as UserName,LastName,EmployeeCategory,UnitLocation,DOB,Convert(varchar(11),DOB,106)As DOBCV,OfficeEmailID,NonOfficeEmailID,Password,Age,Gender,City,State,Country,Department,Designation,WorkLocation,PermanentLocation,ContactNumber,MobileNumber,CurrentLocation,CurrentContactNumber,ManageUserAccountDate,UserType,UserRegAccount.IsActive,IsLockedAccount,Uid,FirstName+' '+LastName AS Name,LoginAttempted,IsAttemptedPassword,IsChangedDefaultPassword,PhotoUpload,UserRole.RoleName as EmpRoleType,WorkLocationMaster.WorkLocationName As WorkLocationCV,DesignationMaster.DesignationName as DesignationNameCV from UserRegAccount left outer join UserRole on UserRegAccount.UserType=UserRole.RoleId left outer join WorkLocationMaster on UserRegAccount.WorkLocation=WorkLocationMaster.Id left outer join DesignationMaster on UserRegAccount.Designation=DesignationMaster.Id left outer join EmployeeDepartmentMaster on UserRegAccount.Department=EmployeeDepartmentMaster.Id where DesignationMaster.DesignationName!='CEO'and UserType!=0 and UserRegAccount.IsActive=1";
           string QuerySql = "select UserType,EmployeeDepartmentMaster.EmployeeDepartmentName as DepartmentCV, EMPNO,Title,FirstName,MiddleName,title+' '+firstname+' '+lastname as UserName,LastName,EmployeeCategory,UnitLocation,DOB,Convert(varchar(11),DOB,106)As DOBCV,OfficeEmailID,NonOfficeEmailID,Password,Age,Gender,City,State,Country,Department,Designation,WorkLocation,PermanentLocation,ContactNumber,MobileNumber,CurrentLocation,CurrentContactNumber,ManageUserAccountDate,UserType,UserRegAccount.IsActive,IsLockedAccount,Uid,FirstName+' '+LastName AS Name,LoginAttempted,IsAttemptedPassword,IsChangedDefaultPassword,PhotoUpload,UserRole.RoleName as EmpRoleType,WorkLocationMaster.WorkLocationName As WorkLocationCV,DesignationMaster.DesignationName as DesignationNameCV from UserRegAccount left outer join UserRole on UserRegAccount.UserType=UserRole.RoleId left outer join WorkLocationMaster on UserRegAccount.WorkLocation=WorkLocationMaster.Id left outer join DesignationMaster on UserRegAccount.Designation=DesignationMaster.Id left outer join EmployeeDepartmentMaster on UserRegAccount.Department=EmployeeDepartmentMaster.Id where Designation!=1 and UserType!=0 and UserRegAccount.IsActive=1";

           #endregion
           DataSet dsSql = new DataSet();
           dsSql = ExecuteSelectDsCommand(QuerySql, CommandType.Text);
           return dsSql;

       }

       public static DataSet GetForManageReportingToUsersDetailsByALLByEmpCode(string _empno, string _location, string _department)
       {
           #region SQL
           string QuerySql = "select UserType,EmployeeDepartmentMaster.EmployeeDepartmentName as DepartmentCV, EMPNO,Title,FirstName,MiddleName,LastName,Title+' '+FirstName+' '+LastName as UserName,EmployeeCategory,UnitLocation,DOB,Convert(varchar(11),DOB,106)As DOBCV,OfficeEmailID,NonOfficeEmailID,Password,Age,Gender,City,State,Country,Department,Designation,WorkLocation,PermanentLocation,ContactNumber,MobileNumber,CurrentLocation,CurrentContactNumber,ManageUserAccountDate,UserType,UserRegAccount.IsActive,IsLockedAccount,Uid,FirstName+' '+LastName AS Name,LoginAttempted,IsAttemptedPassword,IsChangedDefaultPassword,PhotoUpload,UserRole.RoleName as EmpRoleType,WorkLocationMaster.WorkLocationName As WorkLocationCV,DesignationMaster.DesignationName as DesignationNameCV from UserRegAccount left outer join UserRole on UserRegAccount.UserType=UserRole.RoleId left outer join WorkLocationMaster on UserRegAccount.WorkLocation=WorkLocationMaster.Id left outer join DesignationMaster on UserRegAccount.Designation=DesignationMaster.Id left outer join EmployeeDepartmentMaster on UserRegAccount.Department=EmployeeDepartmentMaster.Id where DesignationMaster.DesignationName!='CEO'and UserType!=0 and UserRegAccount.IsActive=1 and IsChangedDefaultPassword=1 and UserRegAccount.EMPNO!='" + _empno + "' and UserRegAccount.UnitLocation='"+_location+"' and EmployeeDepartmentMaster.EmployeeDepartmentName='" + _department + "'";
           #endregion
           DataSet dsSql = new DataSet();
           dsSql = ExecuteSelectDsCommand(QuerySql, CommandType.Text);
           return dsSql;

       }

       public static DataSet GetOnlineServiceAgentUsers()
       {
           #region SQL
           string QuerySql = "select EMPNO,Title+' '+ FirstName+' '+LastName as UserName from UserRegAccount where Flag=1 and UserType=3 and Designation=10";
           #endregion
           DataSet dsSql = new DataSet();
           dsSql = ExecuteSelectDsCommand(QuerySql, CommandType.Text);
           return dsSql;

       }


    }
}
