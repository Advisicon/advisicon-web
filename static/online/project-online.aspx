﻿<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="project-online.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<!--
                                                `                                                   
                                               +m`                                                  
                                              :MMd`                                                 
                                             -NMMMh                                                 
                                            .NMMMMMs                                                
                                           `mMMMMMMM+                                               
                                           dMMMMMMMMM/                                              
                                          yMMMMMMMMMMM-                                             
                                         oMMMMMMMMMMMMN.                                            
                                        +MMMMMMMMMMMMMMm`                                           
                                       :MMMMMMMm+MMMMMMMd`                                          
                                      -NMMMMMMN. oMMMMMMMh                                          
                                     .NMMMMMMM:   yMMMMMMMs                                         
                                    `mMMMMMMM+     dMMMMMMM+                                        
                                    dMMMMMMMs      `mMMMMMMM/                                       
                                   yMMMMMMMh        -NMMMMMMM-                                      
                                  sMMMMMMMm`         :MMMMMMMN.                                     
                                 +MMMMMMMN.           +MMMMMMMm`                                    
            `..---:::::::::---.....--:/+o-             sMMMMMMMd`                                   
      .:/osssssssoo+++/////////++++oosso+//:-..`        hMMMMMMMh                                   
   `/ssssso/-.`               .soo++/::``..--:/++++/:-.``+shmMMMMs                                  
   ossss:`                   `mMMMMMMMh            `.-:/++/:..:+ym+                                 
   +sss/                     dMMMMMMMm`                   `.:/++:-.          ````                   
    :sso`               -   yMMMMMMMN.        ..`          /ds+-.-/+/-           `....              
      -+o:`             ./-oMMMMMMMM:        //-.-.         sMMMMds/.-//-            `-::.          
        `-//-`            sMMMMMMMM+         -++//`          hMMMMMMMd. ./-              -++-       
            `--..`       :MMMMMMMMs            ``            `dMMMMMMMm`  `-               :ss/`    
                 `..``` :MMMMMMMMh/++:-`                      `mMMMMMMMd                    osss.   
                       -NMMMMMMMd`   .-/++/:-.`                -NMMMMMMMy                 `/ssss+   
                      `mMMMMMMMm`          .-:/++++/:--..`      /MMMMMMMMs            `.:+sssss+`   
                     `dMMMMMMMN-                  `.--:/++oooo+++dMMMMMMMMo::::///+oosssssso/-`     
                     hMMMMMMMM:                              ``..-hMMMMMMMMy++++////::--.`          
                    sMMMMMMMM+                                    `mMMMMMMMN-                       
                   oMMMMMMMMs                                      .NMMMMMMMN.                      
                  /MMMMMMMMh                                        :MMMMMMMMm`                     
                 -MMMMMMMMd`                                         +MMMMMMMMd`                    
                .NMMMMMMMN.                                           sMMMMMMMMh                    
                -////////.                                             /////////.                   
                                                                                                    
                                                                                             ---`   
     ``        ..`       ``   .      ``       `-.       .        `..       `-.        .   . .:---   
     sm`       m/+h:     -m  -m      h/      ho:/-      m-      +h//.     +y:+h`      mo  m  `.`    
    `m++       m` :d      d: s+      h/     `m-         m-     `N        `M`  yo      ms- m         
    +o`d       m` .N      /y m`      h/      `os/       m-     .d        -M   sy      N`h`m         
    mo+m:      m` :d       m+o       h/         ss      m-     `N`       `M`  yo      N`-ym         
   :d``:h      m+oh-       +N.       h/      o:/h:      m-      oh//.     +y/+h`      N` +d         
   ``   .      ..`          .        ``      `..        .        `..       `..        .   .         
                                                                                                    
-->
<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->
<!--[if lt IE 7]> <html class='no-js lt-ie9 lt-ie8 lt-ie7' lang='en'> <![endif]-->
<!--[if IE 7]> <html class='no-js lt-ie9 lt-ie8' lang='en'> <![endif]-->
<!--[if IE 8]> <html class='no-js lt-ie9' lang='en'> <![endif]-->
<!-- Consider adding a manifest.appcache: h5bp.com/d/Offline -->
<!--[if gt IE 8]><!--> <html class='no-js' lang='en'><!--<![endif]-->
<head>
  <meta charset='utf-8' />
  <meta content='jdLTywbexVH-8P7WmQp_agAuQGsl84-3bwwHwlrAtbs' name='google-site-verification' />
  <meta content='Mn4HP1CuzeMuTt3AIDZiBOhx9QSkzo2pDByQ1HaTMKk=' name='verify-v1' />
  <!--
    Use the .htaccess and remove these lines to avoid edge case issues.
    More info: h5bp.com/i/378
  -->
  <meta content='IE=edge,chrome=1' http-equiv='X-UA-Compatible' />
  <meta content='test' name='keywords' />
  <meta content='Advisicon: Project Online Trial' itemprop='name' />
  <meta content='test' itemprop='description' name='description' />
  <title>Project Online Trial | Advisicon</title>
  <!-- Mobile viewport optimized: h5bp.com/viewport -->
  <meta content='width=device-width' name='viewport' />
  <!-- Place favicon.ico and apple-touch-icon.png in the root directory: mathiasbynens.be/notes/touch-icons -->
  <link href='../styles/css/style.css' rel='stylesheet' />
  <!-- More ideas for your <head> here: h5bp.com/d/head-Tips -->
  <!--
    All JavaScript at the bottom, except this Modernizr build.
    Modernizr enables HTML5 elements & feature detects for optimal performance.
    Create your own custom Modernizr build: www.modernizr.com/download/
  -->
  <script src='../js/libs/modernizr-2.5.3.min.js'></script>
  <script src='../js/libs/css3-mediaqueries.js'></script>
</head>
<body>
  <!--
    Prompt IE 6 users to install Chrome Frame. Remove this if you support IE 6.
    chromium.org/developers/how-tos/chrome-frame-getting-started
  -->
  <!--[if lt IE 8]>
    <p class='chromeframe'>
      <p>Your browser is <em>ancient!</em> <a href='http://browsehappy.com/'>Upgrade to a different browser</a> or <a href='http://www.google.com/chromeframe/?redirect=true'>install Google Chrome Frame</a> to experience this site.</p>
    </p>
  <![endif]-->
  <header></header>
  <div role='main'>
    <div id='content'>
      <img alt='Advisicon, Inc.' border='0' height='110' id='advisiconBanner' src='../pix/advisicon_banner-012709.jpg' usemap='#Map' width='950' />
      <div class='navbar'>
        <nav id='mainNavigation'>
          <a href='../' id='homepage' title='Advisicon main page'>Home</a>
          <a href='../aboutus.html' id='about' title='about Advisicon'>About Us</a>
          <a href='../contactus.htm' id='contactUs' title='contact Adviscion'>Contact Us</a>
          <a href='http://www.advisiconblog.com' id='blog' target='_blank' title='Advisicon blog'>Blog</a>
          <a href='http://store.advisicon.com' id='advisiconStore' target='_blank' title='Advisicon store'>Store</a>
          <a href='../careers.htm' id='advisiconJobs' title='careers at Advisicon'>Careers</a>
          <a class='tel' href='tel:+1-866-362-3847' id='callUs' onclick="_gaq.push(['_trackEvent', 'Phone Calls', 'Headquarters', 'Toll Free']);" title='call us at 1-866-362-3847'>1.866.36.ADVIS</a>
        </nav>
        <nav id='highlightsNavigation'>
          <a href='../project-management.htm' title='view our Project Management services'>Project Management</a>
          <a href='../microsoft-project-office.htm' title='view our Microsoft Project and Microsoft Project Server consulting and training services'>Microsoft Project Server</a>
          <a href='../sharepoint.htm'>Microsoft SharePoint</a>
          <a href='../training.htm'>Training</a>
          <a href='../application-development.htm'>Application Development</a>
        </nav>
      </div>
      <div id='navAndCred'>
  <nav id='secondaryNav'>
    <a class='secondaryNavButton' href='../case-studies.htm' title='see case studies'>Case Studies</a>
    <a class='secondaryNavButton' href='../clients.htm' title='see our clients'>Clients</a>
    <a class='secondaryNavButton' href='../partners.htm' title='see our partners'>Partners</a>
    <a class='secondaryNavButton' href='../training.htm' title='view our training offerings'>Training</a>
    <a class='secondaryNavButton' href='http://store.advisicon.com' title='shop our products in our store'>Store</a>
    <a class='secondaryNavButton longText' href='../professional-associations.htm' title='see our professional associations'>Professional Associations</a>
    <a class='secondaryNavButton' href='../news.htm' title='Advisicon news and events'>News &amp; Events</a>
    <a class='secondaryNavButton highlightedNavButton' href='../public-courses.html' title='view our public course schedule'>Advisicon Public Course Schedule</a>
    <a class='secondaryNavButton highlightedNavButton' href='../contactus.htm' title='view our contact info'>Contact Us!</a>
  </nav>
  <ul id='credentials'>
  <li>
    <a href='../staff_bios/tim-runcie.htm' title='Learn more about Advisicon&amp;rsquo;s President, Tim Runcie, a Microsoft MVP'>
      <img alt='Microsoft MVP' border='0' height='53' src='../pix/MVP_Horizontal_FullColor-small.jpg' width='150' />
    </a>
  </li>
  <li>
    <a href='../our-certifications.htm' title='Learn more about our competencies as a Microsoft Certified Partner'>
      <img alt='Microsoft Certified Gold Partner in Project and Portfolio Management, Silver Partner in Midmarket Solution Provider' border='0' height='52' src='../pix/AdvisiconPartnersLogo.png' width='150' />
    </a>
  </li>
  <li>
    <a href='http://www.pmi.org/' title='The PMI website'>
      <img alt='Project Management Institute / Registered Education Provider' border='0' src='../pix/logos/PMI-REP-logo.png' width='150' />
    </a>
  </li>
</ul>
<div class='footnotes'>
  <p>
    The PMI Registered Education Provider logo is a registered mark of the Project Management Institute, Inc.
  </p>
</div>
</div>
      <aside id='secondaryContent'>
        <div class='rPopBox' id='socialProfiles'>
          <h3>Follow Us At</h3>
          <ul class='otherCommsList'>
            <li>
              <a href='http://twitter.com/Advisicon' target='_blank'>
                <img alt='Advisicon on Twitter' border='0' height='40' onclick="_gaq.push(['_trackEvent', 'Twitter', 'User: Advisicon', 'User stream']);" src='../pix/twitter.png' title='Twitter' width='40' />
              </a>
            </li>
            <li>
              <a href='http://www.linkedin.com/companies/advisicon' target='_blank'>
                <img alt='Advisicon on LinkedIn' border='0' height='40' onclick="_gaq.push(['_trackEvent', 'LinkedIn', 'User: Advisicon', 'Company Profile']);" src='../pix/linkedinicon.png' title='LinkedIn' width='40' />
              </a>
            </li>
            <li>
              <a href='http://www.facebook.com/Advisicon/' target='_blank'>
                <img alt='Advisicon on facebook' border='0' height='40' onclick="_gaq.push(['_trackEvent', 'Facebook', 'User: Advisicon', 'Fan Page']);" src='../pix/facebook.png' title='Facebook' width='40' />
              </a>
            </li>
            <li>
              <div class='g-plusone'></div>
            </li>
          </ul>
        </div>
        <div class='rPopBox'>
          <h3>Recent Blog Posts</h3>
          <ul id='feedContent'>
          </ul>
        </div>
        <div class='rPopBox'>
          <h3>Featured Tool(s)</h3>
          <ul>
            <li itemscope='itemscope' itemtype='http://schema.org/Product'>
              <a href="../tools/MSP-Rex.htm" itemprop="name url">MSP-Rex</a> (<span itemprop="description">Report Extractor</span>)
            </li>
            <li itemscope='itemscope' itemtype='http://schema.org/Product'>
              <a href="../tools/skill-tracker.htm" itemprop="name url">Skill Tracker</a>
            </li>
          </ul>
        </div>
        <div class='rPopBox'>
          <h3>News &amp; Events</h3>
          <ul>
            
          </ul>
        </div>
        <div class='rPopBox'>
          <h3>Current Course Listings</h3>
          <div>
            <ul class='courses'>
            </ul>
            <p>For course information and schedules contact us by phone at <a href="tel:+1-360-314-6702" class="tel" title="call our Vancouver, WA office" onclick="_gaq.push(['_trackEvent', 'Phone Calls', 'Headquarters', 'Local']);">360.314.6702</a> or email us at <a href="mailto:info@advisicon.com?subject=Question%20about%20Courses" title="email us" onclick="_gaq.push(['_trackEvent', 'Emails', 'Corporate', 'Inquiry']);">info@advisicon.com</a></p>
          </div>
        </div>
        <div class='rPopBox' id='featuredBooks'>
          <h3>Featured Books</h3>
          <ul id='portfolio'>
            <li>
              <a href='http://store.advisicon.com/products/microsoft-access-in-a-sharepoint-world'>
                <img alt='Microsoft Access in a SharePoint World' border='0' height='195' src='../pix/Cover-MASW.jpg' width='150' />
              </a>
            </li>
            <li>
              <a href='http://store.advisicon.com/products/microsoft-business-intelligence-building-executive-dashboards-with-sharepoint-2010'>
                <img alt='Microsoft Business Intelligence' border='0' height='195' src='../pix/Cover-BI-thumb.png' width='150' />
              </a>
            </li>
            <li>
              <a href='http://store.advisicon.com/products/microsoft-project-server-2010-administrators-guide'>
                <img alt='Microsoft Project Server 2010&amp;nbsp;&amp;ndash; Administrator&amp;rsquo;s Guide' border='0' height='195' src='../pix/Cover-MSPS2010-Admin.jpg' width='150' />
              </a>
            </li>
            <li>
              <a href='http://store.advisicon.com/products/microsoft-project-server-2010-project-managers-guide'>
                <img alt='Microsoft Project Server 2010&amp;nbsp;&amp;ndash; Project Manager&amp;rsquo;s Guide' border='0' height='195' src='../pix/Cover-MSPS2010-PM.jpg' width='150' />
              </a>
            </li>
            <li>
              <a href='http://store.advisicon.com/products/microsoft-project-server-2010-team-members-guide'>
                <img alt='Microsoft Project Server 2010&amp;nbsp;&amp;ndash; Team Member&amp;rsquo;s Guide' border='0' height='195' src='../pix/Cover-MSPS2010-TM.jpg' width='150' />
              </a>
            </li>
            <li>
              <a href='http://store.advisicon.com/products/managing-projects-with-microsoft-project-2010-best-practices-in-managing-projects-with-microsoft-project'>
                <img alt='Managing Projects with Microsoft Project 2010' border='0' height='195' src='../pix/Cover-MPWMSP2010.jpg' width='150' />
              </a>
            </li>
            <li>
              <a href='http://store.advisicon.com/products/sharepoint-for-effective-team-collaboration-2010'>
                <img alt='SharePoint for Effective Team Collaboration' border='0' height='195' src='../pix/Cover-SPfETC-thumb.jpg' width='150' />
              </a>
            </li>
          </ul>
          <p>Click a book for more information</p>
        </div>
      </aside>
      <section id='main'>
        <h1 id='microsoft_project_online_partnerled_trial'>Microsoft Project Online Partner-Led Trial</h1>
        
        <p><strong>FREE demo and 30-day Trial of Project Online</strong></p>
        
        <p><img alt='Project 2013' src='../pix/logos/Project-13-logo.png' /></p>
        
        <p><strong><em>Need to Work Virtually? Using Multiple Devices?</em></strong></p>
        
        <p>Microsoft Project Online is a flexible online solution for project portfolio management (PPM) and everyday work. Delivered through Office 365, Project Online enables organizations to get started, prioritize project portfolio investments and deliver the intended business value&#8211;from virtually anywhere on nearly any device.</p>
        
        <p>Now available for a <strong>FREE 30-day trial</strong>. Advisicon can be your &#8220;partner of record&#8221; and provide you with a a free 30-day trial and assist in your subscription request. To get started visit our Project Online 30-day Trial Request.</p>
        <form id="frmCapture" runat="server" action="project-online.aspx">
          <table>
            <tr>
                <td>Full Name
                </td>
                <td><asp:TextBox ID="txtFullName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvtxtFullName" ValidationGroup="FormCheck" runat="server" ErrorMessage="*" ControlToValidate="txtFullName"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Company
                </td>
                <td><asp:TextBox ID="txtCompanyName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvtxtCompanyName" ValidationGroup="FormCheck" runat="server" ErrorMessage="*" ControlToValidate="txtCompanyName"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Email Address
                </td>
                <td><asp:TextBox ID="txtEmailAddress" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvtxtEmailAddress" ValidationGroup="FormCheck" runat="server" ErrorMessage="*" ControlToValidate="txtEmailAddress"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Phone Number
                </td>
                <td><asp:TextBox ID="txtPhoneNumber" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvtxtPhoneNumber" ValidationGroup="FormCheck" runat="server" ErrorMessage="*" ControlToValidate="txtPhoneNumber"></asp:RequiredFieldValidator>
                </td>
            </tr>
          </table>
          <asp:Label ID="lblConfirmation" ForeColor="Blue" runat="server"></asp:Label><br />
          <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" runat="server" ValidationGroup="FormCheck" Text="Request Free Trial" />                    
          <br />
        </form>
        <p>Get started today either online or onsite with a Microsoft Certified expert. This demo will consist of an interactive session discovering all aspects of assessing and executing this new cloud based solution.</p>
        
        <p>For more details regarding the Partner-Led Project Trial, please email <a href='mailto:info@advisicon.com?project%20online%20free%20trial'>info</a>, call <a href='tel:+1-866-362-847'>866 36 ADVIS</a> or <a href='#trial-request'>online contact form</a></p>
      </section>
    </div>
    <footer>
      <div id='footer'>
        <table class='navbartemp'>
          <tr>
            <td></td>
          </tr>
        </table>
        <img alt='footer background' border='0' height='14' src='../pix/footer_bar.jpg' width='950' />
      </div>
      <div id='nav'>
        <ul class='navbarmini'>
          <li>
            <a href='../site_map.htm' title='view the site map'>Site Map</a>
          </li>
          <li>
            <a href='../privacy-policy.htm' title='view our privacy policy'>Privacy Policy</a>
          </li>
          <li>
            <a class='tel' href='tel:+1-866-362-3847' onclick="_gaq.push(['_trackEvent', 'Phone Calls', 'Headquarters', 'Toll Free']);" title='call us at 1-866-362-3847'>1.866.36.ADVIS</a>
          </li>
        </ul>
      </div>
    </footer>
    <map id='Map' name='Map'>
      <area alt='Advisicon Home' coords='858,21,936,99' href='../' shape='rect' />
      <area alt='Advisicon' coords='860,22,861,24' href='#' shape='rect' />
    </map>
    <script src='http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js'></script>
    <script>
      window.jQuery || document.write('<script src="../js/libs/jquery-1.6.0.min.js"><\/script>')
    </script>
    <script src='../js/plugins.js'></script>
    <script src='../js/script.js'></script>
    <script src='https://www.google.com/jsapi' type='text/javascript'></script>
    <script src='../Scripts/loadGoogleFeed.js' type='text/javascript'></script>
    <script src='../Scripts/twitter.js' type='text/javascript'></script>
    <script src='../jscript/jquery.easing.1.3.js' type='text/javascript'></script>
    <script src='../jscript/2/jquery.hslides.js' type='text/javascript'></script>
    <script src='../jscript/2/jquery.innerfade.js' type='text/javascript'></script>
    <script src='../Scripts/frontPageSlideshowHeader.js' type='text/javascript'></script>
    <script src='../Scripts/featuredProducts.js' type='text/javascript'></script>
    <script src='../Scripts/googlePlusOneButton.js' type='text/javascript'></script>
    <script src='../Scripts/rootGoogleAnalytics.js' type='text/javascript'></script>
    <!-- add a couple of extra scripts -->
    <script src='../js/Eventbrite.jquery.js' type='text/javascript'></script>
    <script src='../js/load-public-courses.js' type='text/javascript'></script>
    <script src='../js/load-short-course-listing.js' type='text/javascript'></script>
  </div>
</body>
