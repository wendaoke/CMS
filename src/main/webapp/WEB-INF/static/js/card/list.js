function initializePage(){
	$.get("/card/list.htm", function(data) {
		  $(".result").html(data.length);
		});
}
