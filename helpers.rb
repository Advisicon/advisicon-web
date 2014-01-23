#!/bin/env ruby
#encoding: utf-8

module FrankHelpers
  # helpers go here
  require 'httparty'
  require 'json'
  require 'cgi'
  require 'uri'
  def clean_course_title(title)
    CGI::escapeHTML(title).gsub(/['’®]/, 
                                '\'' => '&#39;', 
                                '’'  => '&rsquo;',
                                '®'  => '&reg;')
  end
  def full_title(title)
    if defined?(title) && title != nil && title.downcase != "advisicon"
      "#{title} | Advisicon"
    else
      "Advisicon"
    end
  end
  require './helpers/microdata'
  require './helpers/google_analytics'
end
