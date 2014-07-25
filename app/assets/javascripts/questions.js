$(document).ready(function() { 
	$(".question_checkboxes").change(function() {
		$.ajax({
			url: "/questions/1", 
			dataType: "script",
			type: 'PUT'
		});
	});
});