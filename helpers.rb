module FrankHelpers
  # helpers go here
  require 'httparty'
  require 'json'
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
    CGI::escapeHTML(title).gsub("'", %q(&#39;))
  end
end
