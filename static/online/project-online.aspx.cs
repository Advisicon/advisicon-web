using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        lblConfirmation.Text = "";
        try
        {
            string html = "";

            html += "Full Name: " + txtFullName.Text + "\n";
            html += "Company Name: " + txtCompanyName.Text + "\n";
            html += "Email Address: " + txtEmailAddress.Text + "\n";
            html += "Phone Number: " + txtPhoneNumber.Text;

            System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage();
            //message.To.Add("Kristin.Raglione@Advisicon.com;Jeff.Jacobson@Advisicon.com;Stacey.Garner@Advisicon.com");
            message.To.Add("info@advisicon.com");
            message.Subject = "New Project Online Inquiry: " + txtFullName.Text;
            message.From = new System.Net.Mail.MailAddress("info@advisicon.com");
            message.Body = html;
            System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient("mail.advisicon.com");
            smtp.Send(message);

            txtFullName.Text = "";
            txtCompanyName.Text = "";
            txtEmailAddress.Text = "";
            txtPhoneNumber.Text = "";

            lblConfirmation.ForeColor = System.Drawing.Color.Blue;
            lblConfirmation.Text = "Your request has been successfully submitted. We will contact you within 48 hours. Thank you for your inquiry.  Should you need to contact us, please call 866.36.ADVIS";
        }
        catch (Exception exc)
        {
            Response.Write(exc.ToString());
            lblConfirmation.ForeColor = System.Drawing.Color.Red;
            lblConfirmation.Text = "Error in submitting your request. please call 866.36.ADVIS"; 
        }                
    }
}
