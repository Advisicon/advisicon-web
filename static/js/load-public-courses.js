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
$.get('https://api.citrixonline.com/G2T/rest/organizers/2221055618378781957/trainings', 
	{
		'Content-type': 'application/json',
		'Accept': 'application/json',
		'Authorization': 'OAuth oauth_token=b149f7276941cdad5fadbdc55911c111'
	},
	function(data){
		$('#onlineCourses').html('<p style="color:red;">Success!</p>');
		$('#onlineCourses').append(data);
	}, 'json');