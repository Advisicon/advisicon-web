#!/bin/env ruby
#encoding: utf-8

def wordpress_json(url, options = {} )
  @url = url
  @tag = options[:tag] ||= nil

  if @tag != nil
    @url += "/api/get_tag_posts/?slug=#{@tag}"
  end

  # get the JSON response
  HTTParty.get @url

end

def posts_with_tag( url, tag )
  @url = url
  @tag = tag

  json = wordpress_json( @url, tag: @tag )
  json['posts']
end

