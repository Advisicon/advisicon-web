Eventbrite({'app_key': "P47XBRPQTVS7YF64Z5"}, 
  function(eb){
    var options = {
      'user'  : 'jeff.jacobson@advisicon.com',
      'display'   : "repeat_schedule",
      'event_statuses'  : 'live'
    };
    
    // $('#classroom-learning').append('<p><strong>Loading events&hellip;</strong><p>');

    eb.user_list_events( options, function( response ){
      var event_list = eb.utils.eventList( response, eb.utils.eventListRow );
      if (event_list.length > 34) { // 34 == <div class="eb_event_list">\n</div>
        $('#classroom-learning').html('<div id="eb_event_header"><span class="head_title">Course</span><span class="head_location">Location</span>' +
          '<span class="head_date">Date</span></div>'+ event_list);
      }
      else
      {
        $('#classroom-learning').html('<p>No public trainings are available at this time.</p>');
      }
    });

    eb.user_list_events( options, function( response ){
      $('.rPopBox div ul.courses').html(
        eb.utils.abbrEventList( response, eb.utils.abbrEventListRow )
      );
    });
  });
