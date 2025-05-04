using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common
{
    public class PersonDTO : DTOBase
    {
        public Guid PersonGuid { get; set; }
        public int PersonId { get; set; }
        public DateTime UtcCreated { get; set; }
        public DateTime UtcModified { get; set; }
        public string Password { get; set; }
        public string Name { get; set; }
        public string Nickname { get; set; }
        public string PhoneMobile { get; set; }
        public string PhoneHome { get; set; }
        public string Email { get; set; }
        public string ImAddress { get; set; }
        public int ImType { get; set; }
        public int TimeZoneId { get; set; }
        public int LanguageId { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public int ZipCode { get; set; }
        //Extra Add By sno
        public int ID { get; set; }
        public Guid NewPersonGuid { get; set; }
        public bool IsDuplicateEmail { get; set; }


        // Constructor
        // No parameters and all types are intialized to their 
        // null values as defined in CommonBase.
        public PersonDTO()
        {
            PersonGuid = Guid_NullValue;
            PersonId = Int_NullValue;
            UtcCreated = DateTime_NullValue;
            UtcModified = DateTime_NullValue;
            Password = String_NullValue;
            Name = String_NullValue;
            Nickname = String_NullValue;
            PhoneMobile = String_NullValue;
            PhoneHome = String_NullValue;
            Email = String_NullValue;
            ImAddress = String_NullValue;
            ImType = Int_NullValue;
            TimeZoneId = Int_NullValue;
            LanguageId = Int_NullValue;
            City = String_NullValue;
            State = String_NullValue;
            ZipCode = Int_NullValue;
            IsNew = true;
            NewPersonGuid = Guid_NullValue;
            IsDuplicateEmail = false;
            ID = Int_NullValue;
        }
    }
}
