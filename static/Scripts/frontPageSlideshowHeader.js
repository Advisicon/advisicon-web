// This script controls the display of that silly banner at the top of the index page

	$(function(){
		
		enterFunction = function(){
			$(this).html('ACTIVE');
		}
		leaveFunction = function(){
			$(this).html('inactive');
		}
		$('.accordion1').hSlides({
			totalWidth: 950, 
			totalHeight: 261, 
			minPanelWidth: 40, 
			maxPanelWidth: 782
		});			
	}
	);

// Jeff Jacobson-Swartfager moved this script out of the HTML 11/16/2011 as part of his push for a semantic site