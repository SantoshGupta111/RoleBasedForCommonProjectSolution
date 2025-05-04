using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common.Users;
using DAL.Users;
using System.Data;
using System.Data.SqlClient;

namespace BAL.Users
{
    public class UserRegistrationRepository
    {
        // New Insert User Registration
        public static void NewInsertUserRegistration(ref UserRegistrationDTO _NewInsertUser)
        {
            UserRegistrationDb.NewInsertUserRegistration(ref _NewInsertUser);
        }

        public static void UpdateDefaultPasswordRegistration(ref UserRegistrationDTO _updateDefaultPass)
        {
            UserRegistrationDb.UpdateDefaultPasswordRegistration(ref _updateDefaultPass);
        }

        public static void ChangePasswordRegistration(ref UserRegistrationDTO _changepass)
        {
            UserRegistrationDb.ChangePasswordRegistration(ref _changepass);
        }


        public static void RoleAssignToUsers(ref UserRegistrationDTO _roleuser)
        {
            UserRegistrationDb.RoleAssignToUsers(ref _roleuser);
        }

        public static DataSet GetAllUsersByDataSet()
        {
            return UserRegistrationDb.GetAllUsersByDataSet();
        }

        public static DataTable GetAllUsersByDataTable()  //Use of DataTable
        {
            return UserRegistrationDb.GetAllUsersByDataTable();
        }

        public static DataTable GetAllUsersByDataTableForCustomerPaging(ref UserRegistrationDTO _user)  //Use of DataTable
        {
            return UserRegistrationDb.GetAllUsersByDataTableForCustomerPaging(ref _user);
        }

        public static DataSet GetAllUsersBYEmpNO(ref UserRegistrationDTO _UserEmpno)
        {
            return UserRegistrationDb.GetAllUsersBYEmpNO(ref _UserEmpno);
        }

        public static DataSet SearchUserRegistrationByOneORMultipleConditions(ref UserRegistrationDTO _uSearch)
        {
            return UserRegistrationDb.SearchUserRegistrationByOneORMultipleConditions(ref _uSearch);
        }

        public static DataSet GetAllUsersForRolesAssignByDataSet()
        {
            return UserRegistrationDb.GetAllUsersForRolesAssignByDataSet();
        }
        public static DataSet GetAllUsersForRolesAssignByDataSetWithEMPNO(ref UserRegistrationDTO _getUEMPNO)  //  Use of DataSet
        {
            return UserRegistrationDb.GetAllUsersForRolesAssignByDataSetWithEMPNO(ref _getUEMPNO);
        }

        // Below method for the only Assigned users with role
        public static DataSet GetAllAssignedUsersWithRoleID()  //  Use of DataSet
        {
            return UserRegistrationDb.GetAllAssignedUsersWithRoleID();
        }
        }
}
