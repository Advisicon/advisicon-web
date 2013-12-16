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

Set the `layout` to `base-alt/job-posting.haml`


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
