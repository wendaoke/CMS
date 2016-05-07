function initializePage(){
	$.get("/card/list.htm", function(data) {
		  $(".result").html(data.length);
		});
	 $.i18n.properties({// 加载资浏览器语言对应的资源文件
		 name:'strings', // 资源文件名称
		 path:'/static/frame/i18/', // 资源文件路径
		 mode:'map', // 用 Map 的方式使用资源文件中的值
		 callback: function() {// 加载成功后设置显示内容
		 // 显示“用户名”
		  $("#introduction_title").html($.i18n.prop('string.card.introduction.title'));
		  $("#introduction_content").html($.i18n.prop('string.card.introduction.content'));		  
		  $("#button_submit_txt").html($.i18n.prop('string.common.submit'));
		  $("#button_reset_txt").html($.i18n.prop('string.common.reset'));
		 } 
		 }); 
}

$('#button_submit').click(function() {
	 $.ajax({ 
         type:"POST", 
         url:"/card/add.htm", 
         contentType:"application/json",  //发送信息至服务器时内容编码类型。             
         dataType:"json",  // 预期服务器返回的数据类型。如果不指定，jQuery 将自动根据 HTTP 包 MIME 信息来智能判断，比如XML MIME类型就被识别为XML。
         data:JSON.stringify($("#myFormId").serializeObject()), 
         success:function(data){ 
         	console.log("data= ",data);
         	if('1' == data){
         		$(".tip-header").html($.i18n.prop("string.card.introduction.add.success"));
         	}
         	$(".tip-header").fadeToggle();
         	$(".tip-header").fadeToggle(2000);
         } 
      }); 
	 
   });
