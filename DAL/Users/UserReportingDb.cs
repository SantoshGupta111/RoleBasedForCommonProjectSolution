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
  public class UserReportingDb:DALBase
    {
      public static void NewInsertUserReportingTo(ref UserReportingDTO _newinsertuserreportingto)
      {
          SqlCommand command = GetDbSprocCommand("SP_InsertUserReportingTo");
          command.Parameters.Add(CreateParameter("@EMPNO", _newinsertuserreportingto.EMPNO, 10));
          command.Parameters.Add(CreateParameter("@EmpName", _newinsertuserreportingto.EmpName, 50));
          command.Parameters.Add(CreateParameter("@DateOfJoining", _newinsertuserreportingto.DateOfJoining));
          command.Parameters.Add(CreateParameter("@EmailID", _newinsertuserreportingto.EmailID, 30));
          command.Parameters.Add(CreateParameter("@Designation", _newinsertuserreportingto.Designation, 50));
          command.Parameters.Add(CreateParameter("@Department", _newinsertuserreportingto.Department,50));
          command.Parameters.Add(CreateParameter("@Location", _newinsertuserreportingto.Location,50));
          command.Parameters.Add(CreateParameter("@Role", _newinsertuserreportingto.Role, 50));
          command.Parameters.Add(CreateParameter("@ReportingToSeniorName", _newinsertuserreportingto.ReportingToSeniorName, 50));
          command.Parameters.Add(CreateParameter("@ReportingToSeniorCode", _newinsertuserreportingto.ReportingToSeniorCode, 10));
          command.Parameters.Add(CreateParameter("@IsActive", _newinsertuserreportingto.IsActive));
          command.Connection.Open();
          command.ExecuteNonQuery();
          command.Connection.Close();

      }


      public static void UpdateUserDetailsReportingTo(ref UserDTO _userdetailsUpdated)
      {
          string sqlUpdate = "Update UserRegAccount set ReportingToSeniorName=@ReportingToSeniorName,ReportingToSeniorCode=@ReportingToSeniorCode where EMPNO=@EMPNO";
          SqlCommand command = GetDbSQLCommand(sqlUpdate);
          try
          {
              command.Parameters.Add(CreateParameter("@EMPNO", _userdetailsUpdated.EMPNO, 10));
              command.Parameters.Add(CreateParameter("@ReportingToSeniorName", _userdetailsUpdated.ReportingToSeniorName, 50));
              command.Parameters.Add(CreateParameter("@ReportingToSeniorCode", _userdetailsUpdated.ReportingToSeniorCode, 10));
          }
          finally
          {
              command.Connection.Open();
              command.ExecuteNonQuery();
              command.Connection.Close();
          }
      }

      public static DataSet GetEmpRegistrationReportingToSeniorCode(string _empno)
      {
          string QuerySql = "select ReportingToSeniorCode from UserRegAccount where empno='" + _empno + "'";
          DataSet dsSql = new DataSet();
          dsSql = ExecuteSelectDsCommand(QuerySql, CommandType.Text);
          return dsSql;
      }


      //public static void UpdateUserDetailsReportingToUpSeniro(ref UserDTO _userdetailsUpdated)
      //{
      //    string sqlUpdate = "Update UserRegAccount set ReportingToSeniorName=@ReportingToSeniorName,ReportingToSeniorCode=@ReportingToSeniorCode where EMPNO=@EMPNO";
      //    SqlCommand command = GetDbSQLCommand(sqlUpdate);
      //    try
      //    {
      //        command.Parameters.Add(CreateParameter("@EMPNO", _userdetailsUpdated.EMPNO, 10));
      //        command.Parameters.Add(CreateParameter("@ReportingToSeniorName", _userdetailsUpdated.ReportingToSeniorName, 50));
      //        command.Parameters.Add(CreateParameter("@ReportingToSeniorCode", _userdetailsUpdated.ReportingToSeniorCode, 10));
      //    }
      //    finally
      //    {
      //        command.Connection.Open();
      //        command.ExecuteNonQuery();
      //        command.Connection.Close();
      //    }
      //}


      //GetExistingRecords orderid
      // pending
      public static bool IsExistsUserReportingToUsers(string _empCode,string _reportingCode)
      {
          string SqlCustNo = "select * from tbl_employeereportingto where empno='" + _empCode + "' and ReportingToSeniorCode='"+_reportingCode+"'";
          DataSet _dsCustno = new DataSet();
          _dsCustno = ExecuteSelectDsCommand(SqlCustNo, CommandType.Text);
          if (_dsCustno.Tables[0].Rows.Count > 0)
          {
              return true;
          }
          else
          {
              return false;
          }
      }


    }
}
