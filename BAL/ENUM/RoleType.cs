using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BAL.ENUM
{
  public enum RoleType
    {
        SupAdmin = 1,
        Admin = 2,
        HR = 3,
        User = 4
    }

  public enum AccessFlag
  {
      ReadAndWrite = 1,
      Read = 2,
      Write = 3
  }
}
