Eventbrite({'app_key': "P47XBRPQTVS7YF64Z5"}, 
  function(eb){
    var event_title = $('h1').text().toLowerCase();
    var options = {
      'user'           : 'jeff.jacobson@advisicon.com',
      'only_display'   : 'title,start_date,url',
      'event_statuses' : 'live',
      'asc_or_desc'    : 'asc'
    };
    eb.user_list_events( options, function( response ){
      var advisicon_events = eb.utils.eventDates( response, eb.utils.eventDate);
      var event_array = [];
      for( i = 0; i < advisicon_events.length; i++){
        var adv_event = advisicon_events[i];
        var title = adv_event.title;
        if( title.toLowerCase() == event_title){
          event_array.push(adv_event);
        }
      } 
      if( event_array.length > 0 ){
        $('section#main').append('<h2>Upcoming Public Dates</h2>');
        for( j = 0; j < event_array.length; j++ ){
          var adv_event = event_array[j];
          $('section#main').append(
            '<ul>' +
            '<li>' +
            '<a href="' + adv_event.url + '" title="' + adv_event.title + '" ' + 
            'onclick="ga(\'send\', \'event\', \'eventbrite\', ' + 
            '\'view date: ' + adv_event.date.toDateString() + '\', ' + 
            '\'' + adv_event.title + '\');">' +
            adv_event.date.toDateString() + '</a></li></ul>');
        }
        var $footnotes = $('section#main .footnotes');
        $('section#main').append( $footnotes );
      }
    });
  });
