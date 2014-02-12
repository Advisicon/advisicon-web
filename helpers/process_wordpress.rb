#!/bin/env ruby
#encoding: utf-8

def process_wordpress(url, options = {} )
  @url = url
  @tag = options[:tag] ||= nil

  # build a uri querry from the url and options
  if @tag.is_a? String
    @url += "/api/get_tag_posts/?slug=#{@tag}"
  elsif @tag.kind_of? Array
    puts "WORDPRESS JSON API ERROR: "
    puts "Too many tags in #{@tag}"
    puts "The JSON API can only support single tag queries!"
  end

  # get the JSON response
  posts = HTTParty.get @url

  # build the page content
  p = ''
  posts['posts'].each do |post| 
    @post_title   = post['title']
    @post_url     = post['url'] 
    @post_date    = Date.parse post['date']
    @post_excerpt = post['excerpt']

    @post_excerpt.slice! '\n'
    @post_excerpt.slice! '[&hellip;]</p>'
    @post_excerpt += " <a href='#{@post_url}' title='#{@post_title}'>\[&hellip;\]</a></p>"

    p += "<h2><a href='#{@post_url}' title='read the full article, &ldquo;#{@post_title}&rdquo; on the blog'>#{@post_title}</a></h2>"
    p += "<p><strong>#{@post_date.strftime('%B %e, %Y')}</strong></p>"
    p += @post_excerpt
  end

  p
end
