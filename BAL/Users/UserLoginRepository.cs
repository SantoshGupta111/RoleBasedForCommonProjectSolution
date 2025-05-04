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
   public class UserLoginRepository
    {

        public static DataSet GetValidLoginByID(ref UserRegistrationDTO _user)
        {
            return UserLoginDb.GetValidLoginByID(ref _user);
        }


       public static DataSet GetAdministratorLogin(string _userID, string password)
       {
           return UserLoginDb.GetAdministratorLogin(_userID, password);
       }
    }
}
