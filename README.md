Github for Advisicon: Put SharePoint to Shame
=============================================

Get ready to make some awesome stuff with github for Advisicon!

Getting Started
---------------

You've already completed the first two steps: you've got a github account and 
you've had it associated with the advisicon-web distro.

Since you're probably using Windows, you should install the appropriate tools 
to push and pull. If you would prefer to work with a GUI, give [GitHub Windows](http://windows.github.com/ "download github for windows") a try.

Github is built off of [git](http://git-scm.com/ "download git"), an amazing 
version control and file sharing system.

What Is This HAML Stuff?
------------------------

Don't worry too much about it. Haml is just a really awesome HTML abstraction 
written in Ruby.

You'll find the haml in `dynamic/`.

The top bit is YAML. Here's a snippit from the **sharepoint.haml** file:

```yaml
title: SharePoint
keywords: Microsoft, SharePoint, Training, Deployment, Customization
description: About Advisicon&rsquo;s Microsoft SharePoint training, deployment, 
and customization
employee_name:
layout: base-alt/default.haml
--------------------------------------------------------META

...
```

Each of those lines is a little bit of meta info about the page.
- **title** is the page title. This is the bit of text that will appear in the 
  tab on your browser window.
- **keywords** is a comma seperated list of keywords that will be shoved into
  a keyword meta tag on the page (for SEO!)
- **description** is a very short description of the content on the page (also 
  for SEO). This should be 70 characters or less.
- **employee_name** should be left blank unless working on a staff bio page. 
  This is the name of the employee the page is for.
- **layout** should be left alone. This is the layout file that will determine 
  how all the stuff on this page is used.

The line on the bottom marks the end of the YAML section. Hooray!