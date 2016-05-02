function initializePage(){
	$.get("/card/list.htm", function(data) {
			alert('1111');
		  $(".result").html(data.length);
		});
}
