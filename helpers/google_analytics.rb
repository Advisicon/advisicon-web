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

