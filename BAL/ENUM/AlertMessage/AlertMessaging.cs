using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;

namespace BAL.ENUM.AlertMessage
{
  public enum AlertMessaging
    {

    //  http://blog.spontaneouspublicity.com/associating-strings-with-enums-in-c
        //http://blogs.msdn.com/b/paulwhit/archive/2008/03/31/use-the-descriptionattribute-with-an-enum-to-display-status-messages.aspx

        California,
        [Description("Incorrect user id/password<BR>Please use right credentials to login")]
        NewMexico,
        [Description("Please use correct credentials or else your login will be blocked")]
        NewYork,
        [Description("South Carolina")]
        SouthCarolina,
        Tennessee,
        Washington

    }
}
