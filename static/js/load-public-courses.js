Eventbrite({'app_key': "P47XBRPQTVS7YF64Z5"}, function(eb){
							var options = {
								'user'	: 'jeff.jacobson@advisicon.com',
								'display'		: "repeat_schedule",
								'event_statuses'	: 'live'
							};
							
							// $('#classroom-learning').append('<p><strong>Loading events&hellip;</strong><p>');

							eb.user_list_events( options, function( response ){
								$('#classroom-learning').html('<div id="eb_event_header"><span class="head_title">Course</span><span class="head_location">Location</span>' +
									'<span class="head_date">Date</span></div>'+ eb.utils.eventList( response, eb.utils.eventListRow ));
							});

							eb.user_list_abbr_events( options, function( response ){
								$('.rPopBox div ul.courses').html(
									eb.utils.abbrEventList( response, eb.utils.abbrEventListRow )
								);
							});
						});
