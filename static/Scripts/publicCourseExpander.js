// Adds some awesome hover functionality to the public classes page

$('document').ready(function() {

	function alertTheTableRows() {
		$('tr').each(function(index) {
			alert(index + ': ' + $(this).text());
		});
	} 

}