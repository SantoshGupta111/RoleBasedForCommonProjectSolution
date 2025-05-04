using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL.Users;
using Common;
using Common.Users;

namespace BAL.Users
{
   public class UserAccountRepository
    {
        #region EmployeeRegistrationAccount Insert / Update / Delete / GetAll / GetAllBy

        public static void NewInsertEmployeeRegAccount(ref UserDTO _newinsertemployee)
        {
            UserAccountDb.NewInsertEmployeeRegAccount(ref _newinsertemployee);
        }

        public static void NewUpdateEmployeeRegAccount(ref UserDTO _newupdateemployee)
        {
            UserAccountDb.NewUpdateEmployeeRegAccount(ref _newupdateemployee);
        }
        public static void NewDeleteEmployeeRegAccount(ref UserDTO _newdeleteemployee)
        {
            UserAccountDb.NewDeleteEmployeeRegAccount(ref _newdeleteemployee);
        }
        public static void NewUpdateEmployeePhoto(ref UserDTO _newupdateemployeePhoto)
        {
            UserAccountDb.NewUpdateEmployeePhoto(ref _newupdateemployeePhoto);
        }
        public static DataSet GetLatestEMPCODE()
        {
            return UserAccountDb.GetLatestEMPCODE();
        }

        public static bool IsExistsEmployeeOfficeEmailID(string _OfficeemailID)
        {
            return UserAccountDb.IsExistsEmployeeOfficeEmailID(_OfficeemailID);
        }
        public static bool IsExistsEmployeeNonOfficeEmailID(string _NonOfficeemailID)
        {
            return UserAccountDb.IsExistsEmployeeNonOfficeEmailID(_NonOfficeemailID);
        }



        public static DataSet GetAllEmployeeInfoDetails(string _from, string _to)
        {
            return UserAccountDb.GetAllEmployeeInfoDetails(_from, _to);
        }

        public static DataSet GetAllEmployeeInfoDetailsBySelectedConditions(string ConditionsQuery)
        {
            return UserAccountDb.GetAllEmployeeInfoDetailsBySelectedConditions(ConditionsQuery);
        }

        public static DataSet GetAllEmployeeInfoManageDefaultPassword()
        {
            return UserAccountDb.GetAllEmployeeInfoManageDefaultPassword();
        }


        public static DataSet GetAllEmployeeInfoManage()
        {
            return UserAccountDb.GetAllEmployeeInfoManage();
        }
        public static DataSet TotalEmployeeCount()
        {
            return UserAccountDb.TotalEmployeeCount();
        }

        public static void IsDefaultPasswordUpdate(string _EmpCode, string _Pass)
        {
            UserAccountDb.IsDefaultPasswordUpdate(_EmpCode, _Pass);
        }
        public static void IsDefaultPasswordUpdatemaster(string _EmpCode, string _Pass)
        {
            UserAccountDb.IsDefaultPasswordUpdatemaster(_EmpCode, _Pass);
        }
        public static void PasswordChange(string _EmpCode, string _Pass)
        {
            UserAccountDb.PasswordChange(_EmpCode, _Pass);
        }
        public static void PasswordChangemaster(string _EmpCode, string _Pass)
        {
            UserAccountDb.PasswordChangemaster(_EmpCode, _Pass);
        }
        public static void UpdateLoginAttemped(string _EmpCode)
        {
            UserAccountDb.UpdateLoginAttemped(_EmpCode);
        }

        public static DataSet GetLoginDetailsByOfficeEmailID(string _officeEmailID)
        {
            return UserAccountDb.GetLoginDetailsByOfficeEmailID(_officeEmailID);
        }

        #endregion
        public static DataSet GetValidLoginByID(string empno, string pass)
        {
            return UserAccountDb.GetValidLoginByID(empno, pass);
        }

        //public static UserDTO GetValidLoginByIDNew(string empno, string pass)
        //{
        //    return UserAccountDb.GetValidLoginByIDNew(empno, pass);
        //}

        public static void IsLoginAttempedUpdated(ref UserDTO _isloginattemped)
        {
            UserAccountDb.IsLoginAttempedUpdated(ref _isloginattemped);
        }
        public static void IsLockedAccount(ref UserDTO _islockedaccount)
        {
            UserAccountDb.IsLockedAccountUpdated(ref _islockedaccount);
        }
        public static DataSet GetLoginDetailsByEMPCODE(string empno)
        {
            return UserAccountDb.GetLoginDetailsByEMPCODE(empno);
        }
        public static DataSet GetLoginDetailsByEMPCODEandPass(string empno, string pass)
        {
            return UserAccountDb.GetLoginDetailsByEMPCODEandPass(empno, pass);
        }
        //public static UserDTO GetLoginValidate(string empno, string password)
        //{
        //    return UserAccountDb.GetLoginValidate(empno, password);
        //}
        public static void ChangeManagePassword(string _EmpCode, string _OldPass, string _NewPass)
        {
            UserAccountDb.ChangeManagePassword(_EmpCode, _OldPass, _NewPass);
        }



        //==========================================only for others

        public static DataSet PageRedirectFromTopMenu(int _menuId)
        {
            return UserAccountDb.PageRedirectFromTopMenu(_menuId);
        }

        public static DataSet ChangeRoleAccessBility(int _RoleID)
        {
            return UserAccountDb.ChangeRoleAccessBility(_RoleID);
        }

        public static DataSet GetSurveyValidLoginByID(string empno, string pass)
        {
            return UserAccountDb.GetSurveyValidLoginByID(empno, pass);
        }
    }
}
