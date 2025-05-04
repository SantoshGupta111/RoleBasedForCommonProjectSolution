using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UIExecute.Account
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {

            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            {
                try
                {
                    string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    MailMessage Msg = new MailMessage();
                    // Sender e-mail address.
                    Msg.From = new MailAddress(txtemailid.Text);
                    // Recipient e-mail address.
                    Msg.To.Add("sgupta.gupta79@gmail.com");
                    Msg.Subject = txtsubject.Text;
                    Msg.Body = txtquery.Text;
                    // your remote SMTP server IP.
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    //smtp.Credentials = new System.Net.NetworkCredential("sgupta.gupta79@gmail.com", "ttybjeaejinhogfw");// create 28June
                    smtp.Credentials = new System.Net.NetworkCredential("sgupta.gupta79@gmail.com", "ugphulikhzvvexyt"); // create 16 July
                    // passkey from APP Password in Gmail-account settings
                    //https://www.youtube.com/watch?v=Ev_JePVxMyw
                    // generate code - after use then we will remove from gmail

                    smtp.EnableSsl = true;
                    smtp.Send(Msg);
                    //Msg = null;
                    lblmsg.Text = "Thanks for Contact us";
                    // Clear the textbox valuess
                    txtname.Text = "";
                    txtsubject.Text = "";
                    txtquery.Text = "";
                    txtemailid.Text = "";
                }
                catch (Exception ex)
                {
                    Console.WriteLine("{0} Exception caught.", ex);
                }
            }
      }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (MailMessage mm = new MailMessage(txtemailid.Text, txtemailid.Text))
            {
                string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                mm.Subject = txtsubject.Text;
                mm.Body = txtquery.Text;
                //if (fuAttachment.HasFile)
                //{
                //    string FileName = Path.GetFileName(fuAttachment.PostedFile.FileName);
                //    mm.Attachments.Add(new Attachment(fuAttachment.PostedFile.InputStream, FileName));
                //}
                mm.IsBodyHtml = false;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential(txtemailid.Text, "SPriya!@1234");
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(mm);
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email sent.');", true);
                lblmsg.Text = "send email";
            }
        }
    }
}