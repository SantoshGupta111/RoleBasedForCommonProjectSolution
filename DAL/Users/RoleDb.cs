using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common.Users;
using System.Data;
using System.Data.SqlClient;


namespace DAL.Users
{
   public class RoleDb:DALBase
    {
        // New create role Name and ID

        public static void NewCreateRole(ref RoleDTO _role)
        {
            string message = string.Empty;
            SqlCommand cmd = GetDbSprocCommand("sp_createrole");
            cmd.Parameters.Add(CreateParameter("@RoleName", _role.RoleName,50));
            cmd.Parameters.Add(CreateParameter("@CreatedDate", _role.CreatedDate));
            cmd.Parameters.Add(CreateParameter("@IsActive", _role.IsActive));

            // for help https://www.c-sharpcorner.com/UploadFile/rohatash/get-out-parameter-from-a-stored-procedure-in-Asp-Net/
            // Check already exists from store procedure. 
            cmd.Parameters.Add("@ERROR", SqlDbType.Char, 500);
            cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
            cmd.Connection.Open();
            cmd.ExecuteNonQuery();
            message = (string)cmd.Parameters["@ERROR"].Value;
            _role.ERROR = message;   // assign for display message in aspx page
            cmd.Connection.Close();
        }


       
        


        public static DataSet GetAllRoles()
        {
            DataSet ds = ExecuteSelectDsCommand("sp_GetAllRoles", CommandType.StoredProcedure);
            return ds;
        }
    }
}
