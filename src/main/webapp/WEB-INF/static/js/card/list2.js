function initializePage(){
	$.get("/card/list.htm", function(data) {
			alert("2222");
		  $(".result").html(data.length);
		});
}
