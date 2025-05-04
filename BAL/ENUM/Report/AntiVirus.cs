using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BAL.ENUM.Report
{
  public enum AntiVirus
    {
      YES=1,
      NO=0
    }

  public enum AntiVirusInstall
  {
      YES=1,
      NO=0
  }

  public enum CallVerification
  {
      Pending=0,
      Done=1
  }
  public enum CallVerificationStatus
  {
      Accept=1,
      Reject=0
  }

  public enum PaymentStatus
  {
      //ALL=3,
      Verified=1,
      UnVerified=0,
      //Free=2 -- update on 12th feb 16, due to new implement by santosh
      IssueBasedConsultationService=2
  }
  public enum Center
  {
      Barasat=2,
      PhoolBagan=1,
      Gurgaon=3
  }
}
