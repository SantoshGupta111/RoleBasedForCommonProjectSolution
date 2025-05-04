using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common
{
    public abstract class DTOBase:CommonBase
    {
        public bool IsNew { get; set; }
        public string Description { get; set; }
        public int IsActive { get; set; }
        public DateTime EntryDate { get; set; }
        public DateTime ManageEntryDate { get; set; }
        public DateTime InputDate { get; set; }
        public int CreatedLoggedBy { get; set; }
        public int UpdatedLoggedBy { get; set; }
        public string CreatedLoggedByName { get; set; }
        public string UpdatedLoggedByName { get; set; }
    }
}
