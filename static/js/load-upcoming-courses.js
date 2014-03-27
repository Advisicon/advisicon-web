Eventbrite({'app_key': "P47XBRPQTVS7YF64Z5"}, 
  function(eb){
    var event_title = $('h1').text().replace(/\s+/g, ' AND ').toLowerCase();
    var options = {
      'organizer'  : 'Advisicon',
      'keywords'   : event_title
    };
    eb.event_search( options, function( response ){
      var dates = eb.utils.eventDates( response, eb.utils.eventDate);
      if (dates.length > 10){ // counts characters ( 10 == <ul>\n</ul> )
        $('section#main').append('<h2>Upcoming Public Dates</h2>' + dates);
        console.log(dates);
      } 
    });
  });
