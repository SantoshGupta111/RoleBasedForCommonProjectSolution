using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.IO;
using System.Net;
using System.Net.Mail;

namespace BAL
{
   public class Validation
    {
        public static bool IsValidEmailID(string _emailID)
        {
            try
            {
                //  NameSpace should  be - using System.Net.Mail;
                MailAddress mail = new MailAddress(_emailID);
                return true;
            }
            catch(Exception ex)
            {
                return false;
            }
        }

        //  Other method for validate Email ID
        public static bool IsValidEmail(string email)
        {
            string emailPattern = @"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";

            if (string.IsNullOrEmpty(email))
                return false;

            // NameSpace should be : using System.Text.RegularExpressions;

            Regex regex = new Regex(emailPattern);
            return regex.IsMatch(email);
        }


        //  For Images Upload check file ( it should be only images not any doc file)
        public static bool IsValidExtension(string filePath)
        {
            bool isValid = false;
            string[] fileExtensions = { ".bmp", ".jpg", ".png", ".gif", ".jpeg", ".BMP", ".JPG", ".PNG", ".GIF", ".JPEG" };

            for (int i = 0; i <= fileExtensions.Length - 1; i++)
            {
                if (filePath.Contains(fileExtensions[i]))
                {
                    isValid = true;
                }
            }
            return isValid;
        }

        // upload file only doc. not any images and others
        public static bool ValidateDocFile(string fileName)
        {            
            string fileExtension = Path.GetExtension(fileName).ToLower();

            // || fileExtension==".txt" || fileExtension=".ppt" || fileExtension = ".pptx" || fileExtension = ".rtf"
            if (fileExtension == ".doc" || fileExtension == ".docx" || fileExtension== ".xls" || fileExtension== ".xlsx" )
            {
                // Valid file extension
                return true;
            }
            else
            {
                // Invalid file extension
                return false;
            }
        }

        public static void SendActivationEmail(string recipientEmail, string activationLinkUrl)
        {
            try { 
            MailMessage msg;
            string ActivationUrl = string.Empty;
            string emailId = string.Empty;
            msg = new MailMessage();
            SmtpClient smtp = new SmtpClient();
            emailId = recipientEmail;
            //sender email address
            msg.From = new MailAddress("sgupta.gupta79@gmail.com");
            //Receiver email address
            msg.To.Add(emailId);
            msg.Subject = "Confirmation email for account activation";
            //For testing replace the local host path with your lost host path and while making online replace with your website domain name
            ActivationUrl = activationLinkUrl;// Server.HtmlEncode("http://localhost:8665/MySampleApplication/ActivateAccount.aspx?UserID=" + FetchUserId(emailId) + "&EmailId=" + emailId);

            msg.Body = "Hi  txtName.Text.Trim() " +
                  "Thanks for showing interest and registring in <a href='http://www.webcodeexpert.com'> webcodeexpert.com<a> " +
                  " Please <a href='" + ActivationUrl + "'>click here to activate</a>  your account and enjoy our services. \nThanks!";
            msg.IsBodyHtml = true;
            smtp.Credentials = new NetworkCredential("sgupta.gupta79@gmail.com", "SPriya!@1234");
                smtp.Port = 587;
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            smtp.Send(msg);
           // clear_controls();
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Confirmation Link to activate your account has been sent to your email address');", true);
        }
        catch (Exception ex)
        {
           // ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Error occured : " + ex.Message.ToString() + "');", true);
            return;
        }
        finally
        {
            //ActivationUrl = string.Empty;
            //emailId = string.Empty;
            //con.Close();
            //cmd.Dispose();
        }
        }

        //Integer Validation:
        public static bool IsNumber(string input)
        {
            return int.TryParse(input, out _);
        }
        //Float Validation:
        public static bool IsDecimal(string input)
        {
            return  Decimal.TryParse(input, out _);
        }





    }
}
