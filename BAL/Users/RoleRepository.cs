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
    public class RoleRepository
    {
        public static void NewCreateRole(ref RoleDTO _role)
        {
            RoleDb.NewCreateRole(ref _role);
        }
        public static DataSet GetAllRoles()
        {
            return RoleDb.GetAllRoles();
        }
    }
}
