using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BAL.ENUM
{
  public enum ValidationLoginedAction
    {
        InvalidCredential,
        ValidCredential,
        EmailNotAvailiable,
        DefaultPasswordNotChanged,
        LockedOut
    }
}
