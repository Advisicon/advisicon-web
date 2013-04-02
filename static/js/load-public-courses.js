Eventbrite({'app_key': "P47XBRPQTVS7YF64Z5"}, function(eb){
							var options = {
								'organizer'    : "Advisicon"
							};
							
							$('currentPublicCourses').append('<p><strong>Loading events&hellip;</strong><p>');

							eb.event_search( options, function( response ){
								$('#currentPublicCourses').html('<div id="eb_event_header"><span class="head_title">Course</span><span class="head_location">Location</span>' +
									'<span class="head_date">Date</span></div>'+ eb.utils.eventList( response, eb.utils.eventListRow ));
							});
						});

	$(window).on('load', function(){
		$('.eb_event_list_item').click(function(){
			$event_id_number = $(this).attr('id');
			$(this).find('.eb_event_list_details').toggleClass('hidden');
		});
	});

// Add GoToTraining courses
