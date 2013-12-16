#!/bin/env ruby
#encoding: utf-8

module FrankHelpers
  # helpers go here
  require 'httparty'
  require 'json'
  require 'cgi'
  def grab_events
=begin
    response = HTTParty.get('http://blog.advisicon.com/tag/event/?json=1')
    response_array = JSON.parse(response.body)

    response_array.each do |post|
      "<li>" + post.title + "</li>"
    end

=end
    #puts "<li>hello world</li>"
  end

  def clean_course_title(title)
    CGI::escapeHTML(title).gsub(/['’®]/, '\'' => '&#39;', '’' => '&rsquo;',
                               '®' => '&reg;')
  end

  def hiringOrganization(org_name)
     "<span itemprop='hiringOrganization' " +
           "itemscope itemtype='http://schema.org/Organization' >" +
           "<span itemprop='name'>#{org_name}</span></span>"
  end
  def industry(industry_name)
     "<span itemprop='industry'>#{industry_name}</span>"
  end
  def location(locality, region)
     "<span itemprop='jobLocation' itemscope " +
           "itemtype='http://schema.org/Place'>" +
              "<span itemprop='address' itemscope " +
              "itemtype='http://schema.org/PostalAddress'>" +
                "<span itemprop='addressLocality'>#{locality}</span>, " +
                "<span itemprop='addressRegion'>#{region}</span>" +
              "</span>" +
            "</span>"
  end
end
