using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Common;
using Common.Menus;

namespace DAL.Menus
{
    public class RoleDb : DALBase
    {

        public static DataSet GetRoleALL()
        {
            string QueryAll = "select * from UserRole where IsActive=1";
            DataSet ds = new DataSet();
            ds = ExecuteSelectDsCommand(QueryAll, CommandType.Text);
            return ds;
        }

        // NOTE:   IF YOU WILL USE OF GetDTOList<RoleDTO>  AND GetSingleDTO<RoleDTO>, You will have to use DATA READER, must

        //or other method UP/Down are same output
        //public static List<RoleDTO> GetAllRoleReader()
        //{
        //    string QueryAll = "select * from UserRole where IsActive=1";
        //    SqlCommand command = GetDbSQLCommand(QueryAll);
        //    return GetDTOList<RoleDTO>(ref command);
        //}

        //public static RoleDTO GetRoleByIDReader(int id)
        //{
        //    string QueryAll = "select * from UserRole where RoleId=@RoleId";
        //    SqlCommand command = GetDbSQLCommand(QueryAll);
        //    command.Parameters.Add(CreateParameter("@RoleId", id));
        //    return GetSingleDTO<RoleDTO>(ref command);

        //}

        public static DataSet GetRoleByID(int id)
        {
            string queryID = "select * from UserRole where RoleId='" + id + "'";
            DataSet ds = new DataSet();
            ds = ExecuteSelectDsCommand(queryID, CommandType.Text);
            return ds;

        }
    }
}
