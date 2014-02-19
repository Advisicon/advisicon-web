#!/bin/env ruby
#encoding: utf-8

def track_event(category, action, options = {})
  options[:label] ||= nil
  options[:value] ||= nil
  options[:noninteraction] ||= nil
  options[:hit_type] ||= 'event'

  @tracker = "ga('send', '#{options[:hit_type]}', '#{category}', '#{action}'"
  if options[:label]
    @tracker += ", '#{options[:label]}'"
    if options[:value].is_a? Integer
      @tracker += ", '#{options[:value]}'"
      if options[:noninteraction].is_a? Boolean
        @tracker += ", '#{options[:noninteraction]}'"
      end
    end
  end
  @tracker += ");"
end
def track_job_application(text, options={})
  options[:job] ||= nil
  options[:email] ||= 'careers@advisicon.com'

  @class = 'email'
  @href  = "mailto:#{options[:email]}?subject=Application:%20#{URI.encode(options[:job])}"
  @title = "Apply to be our next #{options[:job]}"
  @onclick = track_event('Emails', 
                         "Apply to #{options[:job]} position", 
                          label: "via #{options[:email]}")

  "<a class='#{@class}' href='#{@href}' title='#{@title}' onclick='#{@onclick}'>#{text}</a>"
end
