<#assign menu="message">
<#assign submenu="message_list">
<#include "/manage/head.ftl">
<style type="text/css">
.pagination {
    border-radius: 4px;
    display: inline-block;
    margin: 0;
    padding-left: 0;
}
</style>
	<!--main content start-->
	<section id="main-content">
		<section class="wrapper">
        	<!-- page start-->
            <section class="panel">
            	<header class="panel-heading" style="font-size: 18px;">
               		 留言列表	 
                </header>
                <div class="panel-body">
                	<div class="adv-table">
                    	<div role="grid" class="dataTables_wrapper" id="hidden-table-info_wrapper">
                            <table class="table table-striped table-advance table-hover">
                            	<thead>
                                	<tr>
                						<th>留言内容</th>
                						<th>状态</th>
                						<th>时间</th>
                						<th>操作</th>
              						</tr>
                                </thead>
                            	<tbody role="alert" aria-live="polite" aria-relevant="all">
                            		<#list pageVo.list as guestbook>
                            		<tr class="gradeA odd">
                                    	<td>${guestbook.content}</td>
                                    	<td>
                                    		<#if guestbook.status=="init">未回复
                                    		<#else>
                                    			<select class="js_message_status" messageId="${guestbook.messageId}">
													<option value="display" <#if guestbook.status=="display">selected</#if>>显示</option>
													<option value="hidden" <#if guestbook.status=="hidden">selected</#if>>隐藏</option>
												</select>
                                    		</#if>
                                    	</td>
                                    	<td>${guestbook.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                    	<td>
                  							<!-- Icons -->
                  							<#if guestbook.status="init">
                  								<a href="${BASE_PATH}/manage/guestbook/details.htm?messageId=${guestbook.messageId}" title="回复">
	                								回复
	                  							</a>
                  							<#else>
	                							<a href="${BASE_PATH}/manage/guestbook/details.htm?messageId=${guestbook.messageId}" title="查看">
	                								查看
	                  							</a>
                  							</#if>
                						</td>
                                	</tr>
                                	</#list>
                               	</tbody>
                              </table>
                              <div style="height: 30px;">
                             	<div class="pagination">${pageVo.pageNumHtml}</div>
                              </div>
                           </div>
                        </div>
                  </div>
              </section>
              <!-- page end-->
          </section>
		</section>
		<!--main content end-->
<script type="text/javascript">
$(function(){
	$(".js_message_status").change(function(){
		$.post("${BASE_PATH}/manage/guestbook/status.json", {"messageId": $(this).attr("messageId"),status:$(this).val()},function(){
			window.location.reload();
        },"json");  	
    });
});
</script>
<#include "/manage/foot.ftl">