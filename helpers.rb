#!/bin/env ruby
#encoding: utf-8

module FrankHelpers
  # helpers go here
  require 'httparty'
  require 'json'
  require 'cgi'
  require 'uri'
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
  def track_event(category, action, options = {})
    options[:label] ||= nil
    options[:value] ||= nil
    options[:noninteraction] ||= nil

    @tracker = "_gaq.push(['_trackEvent', '#{category}', '#{action}'"
    if options[:label]
      @tracker += ", '#{options[:label]}'"
      if options[:value].is_a? Integer
        @tracker += ", '#{options[:value]}'"
        if options[:noninteraction].is_a? Boolean
          @tracker += ", '#{options[:noninteraction]}'"
        end
      end
    end
    @tracker += "]);"
  end
end
