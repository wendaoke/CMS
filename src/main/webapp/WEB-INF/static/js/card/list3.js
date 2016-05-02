function initializePage(){
	$.get("/card/list.htm", function(data) {
			alert('22222');
		  $(".result").html(data.length);
		});
}
