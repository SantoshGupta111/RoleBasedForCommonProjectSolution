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
   public class UserRoleManagesRepository
    {
       public static DataSet GetUsersDetailsByEMPCODE(string empno)
       {
           return UserRoleManagesDb.GetUsersDetailsByEMPCODE(empno);
       }

       public static DataSet GetReportingRole(int _desig)
       {
           return UserRoleManagesDb.GetReportingRole(_desig);
       }

       public static DataSet GetUsersDetailsReportingManagerByDesignation()
       {
           return UserRoleManagesDb.GetUsersDetailsReportingManagerByDesignation();
       }

       public static DataSet GetUsersDetailsReportingToSeniorByDesignation(int _designation, string _UnitLocation)
       {
           return UserRoleManagesDb.GetUsersDetailsReportingToSeniorByDesignation(_designation, _UnitLocation);
       }

       public static void NewUpdateUserDetailsByUserEmpCode(string _desig, string _unitloc, int _usertype, string _empno)
       {

           UserRoleManagesDb.NewUpdateUserDetailsByUserEmpCode(_desig, _unitloc, _usertype, _empno);
       }

       public static DataSet GetForManageReportingToUsersDetailsByALL()
       {
           return UserRoleManagesDb.GetForManageReportingToUsersDetailsByALL();
       }

       public static DataSet GetForManageReportingToUsersDetailsByALLByEmpCode(string _empno, string _location, string _department)
       {
           return UserRoleManagesDb.GetForManageReportingToUsersDetailsByALLByEmpCode(_empno, _location, _department);
       }

       public static DataSet GetOnlineServiceAgentUsers()
       {
           return UserRoleManagesDb.GetOnlineServiceAgentUsers();
       }
    }
}
