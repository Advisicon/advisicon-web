#!/bin/env ruby
#encoding: utf-8

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
def track_job_application(text, options={})
  options[:job] ||= nil

  @class = 'email'
  @href  = "mailto:careers@advisicon.com?subject=Application:%20#{URI.encode(options[:job])}"
  @title = "Apply to be our next #{options[:job]}"
  @onclick = track_event('Emails', 
                         "Apply to #{options[:job]} position", 
                          label: 'via careers@advisicon.com')

  "<a class='#{@class}' href='#{@href}' title='#{@title}' onclick='#{@onclick}'>#{text}</a>"
end
