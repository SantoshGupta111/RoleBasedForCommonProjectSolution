using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Common.Users
{
   public class UserReportingDTO:DTOBase
    {
       public int Id { get; set; }
       public string EMPNO { get; set; }
       public string EmpName { get; set; }
       public DateTime DateOfJoining { get; set; }
       public string EmailID { get; set; }
       public string Designation { get; set; }
       public string Department { get; set; }
       public string Location { get; set; }
       public string Role { get; set; }
       public string ReportingToSeniorName { get; set; }
       public string ReportingToSeniorRole { get; set; }
       public string ReportingToSeniorCode { get; set; }
       public int IsActive { get; set; }
       // public string ERROR { get; set; }

        public UserReportingDTO()
       {
           Id = Int_NullValue;
           EMPNO = String_NullValue;
           EmpName = String_NullValue;
           DateOfJoining = DateTime_NullValue;
           EmailID = String_NullValue;
           Designation = String_NullValue;
           Department = String_NullValue;
           Location = String_NullValue;
           Role = String_NullValue;
           ReportingToSeniorName = String_NullValue;
           ReportingToSeniorRole = String_NullValue;
           ReportingToSeniorCode = String_NullValue;
           IsActive = Int_NullValue;
           //ERROR = String_NullValue;
       }


    }
}
