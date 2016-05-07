$(document).ready(function() {
	var pageurl;
	var jsurl;
	$(".menutext").bind("click",function(){
		console.log(jsurl);
			if(!$.isEmptyObject(jsurl)){
				$("script[src='"+jsurl+"']").remove(); 
			}
			pageurl = $($(this)).attr("pageurl");
			jsurl = $($(this)).attr("jsurl");			
			console.log(pageurl);
			console.log(jsurl);
			$(".page-content").load(pageurl,function() {
				$.getScript(jsurl,function(){
					initializePage();
				});

			});
	}); 
})