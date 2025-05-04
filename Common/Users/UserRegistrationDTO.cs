using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.Users
{
    public class UserRegistrationDTO : DTOBase
    {
        //public DateTime? FromRegistrationDate { get; set; }
        //public DateTime? ToRegistrationDate { get; set; }

        public DateTime FromRegistrationDate { get; set; } = DateTime.MinValue;
        public DateTime ToRegistrationDate { get; set; } = DateTime.MinValue;
        public int MinAge { get; set; }
        public int MaxAge { get; set; }

        public int UID { get; set; }
        public string EMPNO { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Password { get; set; }
        public string Detail { get; set; }
        public DateTime RegistrationDate { get; set; }
        public int RoleID { get; set; }
        public string Gender { get; set; }
        public DateTime DOB { get; set; }
        public string EmailID { get; set; }
        public string MobileNo { get; set; }
        public string CurrentAddress { get; set; }
        public string PermanentAddress { get; set; }
        public string UserImage { get; set; }
        public string UserImagePath { get; set; }
        public int CountryID { get; set; }
        public int StateID { get; set; }
        public int CityID { get; set; }
        public int DepartmentID { get; set; }
        public int DesignationID { get; set; }
        public bool IsActive { get; set; }
        public bool IsLockedAccount { get; set; }
        public int LoginAttempted { get; set; }
        public bool IsChangedDefaultPassword { get; set; }
        public bool IsAttemptedPassword { get; set; }
        public int UserType { get; set; }
        public int LocationZoneID { get; set; }
        public bool IsAuthenticated { get; set; }
        public bool IsAuthorized { get; set; }
        public string DocFileUpload { get; set; }
        public bool IsApprovedThroughEmailID { get; set; }
        public string docfileName { get; set; }
        public int PageNo { get; set; }
        public int PageSize { get; set; }

        public string ERROR { get; set; }

        public UserRegistrationDTO()
        {
            FromRegistrationDate = DateTime.MinValue;
            ToRegistrationDate = DateTime.MinValue;
            MinAge = int.MinValue;
            MaxAge = int.MinValue;

            UID = Int_NullValue;
            EMPNO = String_NullValue;
            FirstName = String_NullValue;
            LastName = String_NullValue;
            Password = String_NullValue;
            Detail = String_NullValue;
            RegistrationDate = DateTime_NullValue;
            RoleID = Int_NullValue;
            Gender = String_NullValue;
            DOB = DateTime_NullValue;
            EmailID = String_NullValue;
            MobileNo = String_NullValue;
            CurrentAddress = String_NullValue;
            PermanentAddress = String_NullValue;
            UserImage = String_NullValue;
            UserImagePath = String_NullValue;
            CountryID = Int_NullValue;
            StateID = Int_NullValue;
            CityID = Int_NullValue;
            DepartmentID = Int_NullValue;
            DesignationID = Int_NullValue;
            IsActive = Boolean_NullValue;
            IsLockedAccount = Boolean_NullValue;
            LoginAttempted = Int_NullValue;
            IsChangedDefaultPassword = Boolean_NullValue;
            IsAttemptedPassword = Boolean_NullValue;
            UserType = Int_NullValue;
            LocationZoneID = Int_NullValue;
            IsAuthenticated = Boolean_NullValue;
            IsAuthorized = Boolean_NullValue;
            DocFileUpload = String_NullValue;
            IsApprovedThroughEmailID = Boolean_NullValue;
            docfileName = String_NullValue;
            PageNo = Int_NullValue;
            PageSize = Int_NullValue;

            ERROR = String_NullValue;
        }

    }
}
