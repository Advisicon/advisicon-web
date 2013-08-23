using System;
using System.Data;
using System.Net;
using System.Text;
using System.IO;
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
        Process_Html("http://blog.advisicon.com/tag/event/feed/"); //point the subprocess to the webpage you want to access
    }
    
    void Process_Html (string up_http)
    {
        HttpWebRequest req = (HttpWebRequest)HttpWebRequest.Create(up_http);
        HttpWebResponse resp = (HttpWebResponse)req.GetResponse() ;
         
        StreamReader sr = new StreamReader(resp.GetResponseStream(),Encoding.ASCII );

        //newsevent.InnerHtml = sr.ReadToEnd();
        sr.Close();
    }
    //<%
    //    sub process_html(up_http) 
    //  dim xmlhttp : set xmlhttp = createobject("msxml2.xmlhttp.3.0")
    //  xmlhttp.open "get", up_http, false
    //  xmlhttp.send
      
    //  dim response_array : response_array = split(xmlhttp.responseText, "<item>")
      
    //  dim re : Set re = new regexp 'defines the variable re and makes it a new regular expression
    //    re.Pattern = "<title>.*</title>" 'set up a regular expression to use for searching the items in our array. We're using it to search for the title tags.
    //    re.IgnoreCase = True 'regular expression search is case insensitive. Don't know why we can't just do this in the regexp itself.
    //    re.Global = True 'makes sure match applies to the entire string
      
    //  dim i 'declare a new variable, i. We'll use this to step through the items in the array
    //  for i = 1 to ubound(response_array) 'steps through the items in the array, starting at the position response_array(1) and continuing to the end of response_array. ubound seems to act a bit like .length, len(), etc. We start at position 1 instead of 0 so that we don't pick up matches from the stuff in the <channel> before the first <item>
    //    if re.Test(response_array(i)) then 'if the regular expression pattern defined earlier as re is found within the array item then do the following. re.Test() returns a boolean.
    //      Set Matches = re.Execute(response_array(i)) 'make a new array, this one called Matches. Created from the current item in response_array.
    //      for each Match in Matches 'for each item in this new Matches array ...
    //        title = Replace(Match.Value,"<title>","") 'remove the opening <title>
    //        title = Replace(title,"</title>","") 'remove the closing </title> tag
    //        dim reLink : Set reLink = new regexp 'new regular expression, this one is called reLink. We'll use it to search for the <link> tags
    //          reLink.Pattern = "<link>.*</link>" 'looking for the <link> tags
    //          reLink.IgnoreCase = True 'case insensitive
    //          reLink.Global = True 'search entire string
    //          Set linkMatches = reLink.Execute(response_array(i)) 'make a new array called linkMatches from the current item in response_array()
    //            for each linkMatch in linkMatches
    //              link = Replace(linkMatch.Value,"<link>","") 'remove the opening <link>
    //              link = Replace(link,"</link>", "") 'remove the closing </link>
    //            Next
    //        response.write("<li><a href='" & link & "' title='read the full article, &ldquo;" & title & "&rdquo; on the blog'>" & title & "</a></li>") 'build a header for this news/event item
    //      Next
    //    else
    //      response.write("<p>I couldn't find anything.</p>")
    //    end if
    //  next 'use a for loop to use the regular expression on the array. The output from the loop will be the line(s) containing the search pattern
      
    //  set re = nothing
    //  set xmlhttp = nothing
    //  set responce_array = nothing
    //  set i = nothing
    //  set Matches = nothing
    //  set Match = nothing
    //  set title = nothing
    //  set reLink = nothing
    //  set linkMatches = nothing
    //  set link = nothing
      
    //end sub 'free up any memory used by the process
    
    //process_html("http://blog.advisicon.com/tag/event/feed/") 'point the subprocess to the webpage you want to access

        
    //%>

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
