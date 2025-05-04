using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Common.Users
{
    #region UserRegAccountProperty
    public class UserDTO:DTOBase
    {
        public int uid { get; set; }
        public string EMPNO { get; set; }
        public DateTime RegistrationDate { get; set; }
        public DateTime DateOfJoining { get; set; }
        public string Password { get; set; }
        public string Title { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public DateTime DOB { get; set; }
        public int Age { get; set; }
        public string Gender { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Country { get; set; }
        public string OfficeEmailID { get; set; }
        public string NonOfficeEmailID { get; set; }
        public int UserType { get; set; }
        public string Department { get; set; }
        public string Designation { get; set; }
        public string WorkLocation { get; set; }
        public string PermanentLocation { get; set; }
        public string ContactNumber { get; set; }
        public string MobileNumber { get; set; }
        public string CurrentLocation { get; set; }
        public string CurrentContactNumber { get; set; }
        public bool IsActive { get; set; }
        public bool IsLockedAccount { get; set; }
        public int LoginAttempted { get; set; }
        public bool IsAttemptedPassword { get; set; }
        public DateTime ManageUserAccountDate { get; set; }
        public bool IsChangedDefaultPassword { get; set; }
        public string PhotoUpload { get; set; }
        public string EmployeeCategory { get; set; }
        public string UnitLocation { get; set; }
        public string ReportingToSeniorName { get; set; }
        public string ReportingToSeniorRole { get; set; }
        public string ReportingToSeniorCode { get; set; }
        public bool flag { get; set; }
        public string Users
        {
            get { return this.Title+' '+ this.FirstName +' '+ this.LastName; }
        }



        public UserDTO()
        {
            uid = Int_NullValue;
            EMPNO = String_NullValue;
            RegistrationDate = DateTime_NullValue;
            DateOfJoining = DateTime_NullValue;
            Password = String_NullValue;
            Title = String_NullValue;
            FirstName = String_NullValue;
            MiddleName = String_NullValue;
            LastName = String_NullValue;
            DOB = DateTime_NullValue;
            Age = Int_NullValue;
            Gender = String_NullValue;
            City = String_NullValue;
            State = String_NullValue;
            Country = String_NullValue;
            OfficeEmailID = String_NullValue;
            NonOfficeEmailID = String_NullValue;
            UserType = Int_NullValue;
            Department = String_NullValue;
            Designation = String_NullValue;
            WorkLocation = String_NullValue;
            PermanentLocation = String_NullValue;
            ContactNumber = String_NullValue;
            MobileNumber = String_NullValue;
            CurrentLocation = String_NullValue;
            CurrentContactNumber = String_NullValue;
            IsActive = Boolean_NullValue;
            IsLockedAccount = Boolean_NullValue;
            LoginAttempted = Int_NullValue;
            IsAttemptedPassword = Boolean_NullValue;
            ManageUserAccountDate = DateTime_NullValue;
            IsChangedDefaultPassword = Boolean_NullValue;
            PhotoUpload = String_NullValue;
            EmployeeCategory = String_NullValue;
            UnitLocation = String_NullValue;
            ReportingToSeniorName = String_NullValue;
            ReportingToSeniorRole = String_NullValue;
            ReportingToSeniorCode = String_NullValue;
            flag = Boolean_NullValue;
           // Users = String_NullValue;

        }
    }
    #endregion
}
