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

# Creating new Job Postings #

Create your own job postings with ease! Yay!


## Metadata ##

To create a new job posting you need to set the following metadata:

- job\_title
- keywords
- description
- layout

The `job_title` is the job title of the position you are creating. Simple 
enough, right?

`keywords` are a comma seperated list of keywords/phrases that apply to this 
job listing.

The `description` is a brief (try to keep it under 72 characters) description 
of the job. This may be used by cross posting sites like facebook, linkedin, &
google plus to pre-populate a description of the page.

Set the `layout` to `default.haml`


## schema.org Awesomeness  ##

You have a few [JobPosting][1] schema variables from [schema.org][2] available 
to you:

- [hiringOrganization][3]
- [industry][4]
- [jobLocation][5] (shortened to `location` here)

`hiringOrganization` takes a string representing the name of the organizations.
For example:

```ruby
hiringOrganization('Cyberdyne Systems')
```

`industry` takes a string representing the name of the industry the job posting
falls within. For example:

```ruby
industry('Global Digital Defense')
```

`location` takes a two strings. The first represents the locality (usually a city) 
that the job will be in. The second string represents the region (usually a state 
or providence) that the job will be in. For example:

```ruby
location('Sunnyvale', 'California')
```

[1]: http://schema.org/JobPosting
[2]: http://schema.org
[3]: http://schema.org/hiringOrganization
[4]: http://schema.org/industry
[5]: http://schema.org/jobLocation

