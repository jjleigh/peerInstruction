$(document).ready(function() { 
	$(".switch input").change(function() {
		var form = $(this).closest("form");
		form.submit();
	});
});