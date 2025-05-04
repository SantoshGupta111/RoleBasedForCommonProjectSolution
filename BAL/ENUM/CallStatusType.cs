using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BAL.ENUM
{
    public enum CallStatusType
    {
        // code here
    }

    #region
    public enum CallBack
    {
         Callback=4
        ,CanBeavailableinthenextcall=5
    }
    public enum CallPreAssign
    {
         Alreadyhasanotherplan = 1
        ,Answeringmachine = 2
        ,Busy = 3
        ,Paymentnotprocessed = 15
        ,Rejectedbybank = 16
    }
    public enum CallRemove
    {   
         Customerdoesnothavevisamastercard = 6
        ,Disconnected = 7
        ,DNC = 8
        ,Doesnothaveapc = 9
        ,Fax = 10
        ,Hungup = 11
        ,Notavailable = 12
        ,NotInterested = 13
        ,Numberdoesnotexists = 14
        ,Salesdone = 17
        ,Sendemail = 18
       ,Transferred = 19
    }
    #endregion
}
