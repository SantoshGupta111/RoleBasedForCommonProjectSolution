using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Menus;
using System.Data;
using System.Data.SqlClient;
using Common.Menus;

namespace BAL.Users
{
    public class RolePermissionRepository
    {
        public static void UpdateRolePermissionByRoleID_ForSingRow(ref RolePermissionDTO _updateRP)
        {
            RolePermissionDb.UpdateRolePermissionByRoleID_ForSingRow(ref _updateRP);
        }

        public static void UpdateRolePermissionByRoleID(List<RolePermissionDTO> rolePermissions)
        {
            RolePermissionDb.UpdateRolePermissionByRoleID(rolePermissions);
        }
    }
}
