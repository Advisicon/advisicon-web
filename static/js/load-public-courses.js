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


// Add GoToTraining courses
/*$.ajax({
	'type': 'GET',
	'url': 'https://api.citrixonline.com/G2T/rest/organizers/2221055618378781957', 
	'headers': { Accept: 'application/json', Content-Type: 'application/json', Authorization: '&nbsp;OAuth&nbsp;oauth_token=b149f7276941cdad5fadbdc55911c111' },
	'success': function(data)
		{
			alert('works');
			$('#onlineCourses').html('<p style="color:red;">Success!</p>');
			$('#onlineCourses').append(data);
		}, 
	'error': function(xhr){
		alert('failed');
	},
	'dataType': 'json'});*/