Eventbrite({'app_key': "P47XBRPQTVS7YF64Z5"}, 
  function(eb){
    var event_title = $('h1').text().replace(/\s+/g, "-");
    var options = {
      'user'           : 'jeff.jacobson@advisicon.com',
      'only_display'   : 'title,start_date,url',
      'event_statuses' : 'live',
      'asc_or_desc'    : 'asc',
      'event_title'    : event_title
    };
/*    eb.event_search( options, function( response ){
      var dates = eb.utils.eventDates( response, eb.utils.eventDate);
      if (dates.length > 10){ // counts characters ( 10 == <ul>\n</ul> )
        $('section#main').append('<h2>Upcoming Public Dates</h2>' + dates);
        var $footnotes = $('section#main .footnotes');
        $('section#main').append( $footnotes );
      } 
    }); */
    eb.user_list_events( options, function( response ){
      var advisicon_events = eb.utils.eventDates( response, eb.utils.eventDate);
      for( i = 0; i < advisicon_events.length; i++){
        console.log( 'TITLE: ' + advisicon_events[i].title );
        console.log( 'URL:   ' + advisicon_events[i].url );
        console.log( 'DATE:  ' + advisicon_events[i].date );
        console.log( "\n---\n");
      } 
    });
  });
