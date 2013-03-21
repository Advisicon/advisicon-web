Eventbrite({'app_key': "P47XBRPQTVS7YF64Z5"}, function(eb){
							var options = {
								'organizer'    : "Advisicon"
							};
							
							eb.event_search( options, function( response ){
								$('#currentPublicCourses').html('<div id="eb_event_header"><span class="head_title">Course</span><span class="head_location">Location</span><span class="head_date">Date</span></div>'+ eb.utils.eventList( response, eb.utils.eventListRow ));
							});
						});