require 'icalendar'
require 'Date'

include Icalendar

cal = Calendar.new
cal.event do
  dtstart      Date.new(2014, 01, 01)
  dtend        Date.new(2014, 01, 02)
  summary     "New Years day"
  description "Recover!"
end
cal.event do
  dtstart      Date.new(2014, 02, 17)
  dtend        Date.new(2014, 02, 18)
  summary     "Presidents' Day"
  description ""
end
cal.event do
  dtstart      Date.new(2014, 05, 26)
  dtend        Date.new(2014, 05, 27)
  summary     "Memorial Day"
  description ""
end
cal.event do
  dtstart      Date.new(2014, 07, 04)
  dtend        Date.new(2014, 07, 05)
  summary     "Independance Day"
  description ""
end
cal.event do
  dtstart      Date.new(2014, 9, 01)
  dtend        Date.new(2014, 9, 02)
  summary     "Labor Day"
  description "Celebrate the American Labor movement"
end
cal.event do
  dtstart      Date.new(2014, 11, 27)
  dtend        Date.new(2014, 11, 29)
  summary     "Thanksgiving"
  description "Carve a turkey, you turkey!"
end
cal.event do
  dtstart      Date.new(2014, 12, 25)
  dtend        Date.new(2014, 12, 26)
  summary     "Festivus"
  description "You know, for the rest of us."
end

File.open('holiday-schedule-2014.ics', 'w') { |f| f.write (cal.to_ical) }
