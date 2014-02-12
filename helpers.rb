#!/bin/env ruby
#encoding: utf-8

module FrankHelpers
  # helpers go here
  require 'httparty'
  require 'json'
  require 'cgi'
  require 'uri'
  require 'nokogiri'
  require 'open-uri'

  def clean_course_title(title)
    CGI::escapeHTML(title).gsub(/['’®]/, 
                                '\'' => '&#39;', 
                                '’'  => '&rsquo;',
                                '®'  => '&reg;')
  end

  def full_title(options ={})
    if defined?(options[:job_title]) && options[:job_title] != nil
      "Advisicon job: #{options[:job_title]}"
    elsif defined?(options[:title]) && options[:title] != nil && options[:title].downcase != "advisicon"
      "#{options[:title]} | Advisicon"
    else
      "Advisicon"
    end
  end
  
  require './helpers/microdata'
  require './helpers/google_analytics'
  require './helpers/process_wordpress'
end
