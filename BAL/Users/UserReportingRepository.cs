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
   public class UserReportingRepository
    {
       public static void NewInsertUserReportingTo(ref UserReportingDTO _newinsertuserreportingto)
       {
           UserReportingDb.NewInsertUserReportingTo(ref _newinsertuserreportingto);
       }
       public static void UpdateUserDetailsReportingTo(ref UserDTO _userdetailsUpdated)
       {
           UserReportingDb.UpdateUserDetailsReportingTo(ref _userdetailsUpdated);
       }

       public static DataSet GetEmpRegistrationReportingToSeniorCode(string _empno)
       {
           return UserReportingDb.GetEmpRegistrationReportingToSeniorCode(_empno);
       }

       //public static void UpdateUserDetailsReportingToUpSeniro(ref UserDTO _userdetailsUpdated)
       //{
       //    UserReportingDb.UpdateUserDetailsReportingToUpSeniro(ref _userdetailsUpdated);
       //}

       public static bool IsExistsUserReportingToUsers(string _empCode, string _reportingCode)
       {
           return UserReportingDb.IsExistsUserReportingToUsers(_empCode, _reportingCode);
       }
    }
}
