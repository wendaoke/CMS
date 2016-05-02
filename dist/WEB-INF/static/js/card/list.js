function initializePage(){
	$.post("/card/list.htm", function(data) {
			alert(data.length);
		  $(".result").html(data.length);
		});
}
