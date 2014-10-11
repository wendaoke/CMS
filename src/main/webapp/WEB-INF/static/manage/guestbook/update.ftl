<#assign menu="message">
<#assign submenu="update_message">
<#include "/manage/head.ftl">
<style type="text/css">

</style>
<!--main content start-->
	<section id="main-content">
		<section class="wrapper">
		<!-- page start-->
			<div class="row">
			<div class="col-lg-12">
			<section class="panel">
				<header class="panel-heading">
 					留言详细内容(<#if guestbook.status=="init">未回复
                                 <#else>
                                 	<select class="js_message_status" messageId="${guestbook.messageId}">
													<option value="display" <#if guestbook.status=="display">selected</#if>>显示</option>
													<option value="hidden" <#if guestbook.status=="hidden">selected</#if>>隐藏</option>
												</select>
                              </#if>)
				</header>
				<div class="panel-body">
					<section class="panel">
						<header class="panel-heading"> 内容 </header>
						<div class="panel-body">
							${guestbook.content}
						</div>
					</section>
					<#if guestbook.status=="init">
					<section class="panel">
						<header class="panel-heading"> 回复 </header>
						<div class="panel-body">
							<form id="reply_message_form" method="post"
								class="form-horizontal tasi-form" autocomplete="off"
								action="${BASE_PATH}/manage/guestbook/addReply.json">
								<input type="hidden" name="messageId" value="${guestbook.messageId}">
					        	<div class="form-group">
						        	<textarea class="form-control" rows="8" placeholder="" style="width: 960px;" name="reply"></textarea>
						        	<p class="help-block" style="color:#B94A48;"></p>
						        	<div class="col-xs-9" style="margin-top:15px;">
										<label class="radio-inline"> <input type="radio"
											name="status" value="display" checked /> 显示
										</label> <label class="radio-inline"> <input type="radio"
											name="status" value="hidden" /> 隐藏
										</label>
										<label class="radio-inline"> <button class="btn btn-danger" type="submit">保存</button>	</label>
									</div>
					        	</div>
			            	</form>
						</div>
					</section>
					<#else>
					<section class="panel">
						<header class="panel-heading"> 回复 </header>
						<div class="panel-body">
							${guestbook.reply}
						</div>
					</section>
					</#if>
				</div>
			</section>
		</div>
		</div>
<!-- page end-->
		</section>
	</section>
 <!--main content end-->
<script type="text/javascript">
var messageId=${guestbook.messageId};
	$(function(){
		$('#reply_message_form').ajaxForm(function(data){
			showErrors($('#add_message_form'),data.errors);
			if(data.result){
				bootbox.alert("保存成功",
			   		function() {
                    	window.location.href = "${BASE_PATH}/manage/guestbook/details.htm?messageId=" + messageId;
                    	$('#reply_message_form').clearForm();
                	});
			}else{
				$(".help-block").html(data.msg);
			}
		});	
		
		$(".js_message_status").change(function(){
		$.post("${BASE_PATH}/manage/guestbook/status.json", {"messageId": $(this).attr("messageId"),status:$(this).val()},function(){
			window.location.reload();
        },"json");  	
    });
	});
</script>
<#include "/manage/foot.ftl">