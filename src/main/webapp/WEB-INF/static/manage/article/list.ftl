<#assign menu="article">
<#assign submenu="article_list">
<#include "/manage/head.ftl">
<style type="text/css">
.pagination {
    border-radius: 4px;
    display: inline-block;
    margin: 0;
    padding-left: 0;
}

.howto, .nonessential, #edit-slug-box, .form-input-tip, .subsubsub {
    color: #666666;
}

.subsubsub {
    float: left;
    font-size: 12px;
    list-style: none outside none;
    margin: 8px 0 5px;
    padding: 0;
}

.form-group{
	width:100%;
}

.count{
	position:absolute ;
	right:0px;
}

.arrticle_status{
	float:left;
}
</style>
	<!--main content start-->
	<section id="main-content">
		
		<section class="wrapper">
        	<!-- page start-->
            <section class="panel">
                <header class="panel-heading">
	                <div class="row">
	                  <div class="col-lg-8">
						<ul class="breadcrumb" style="margin-bottom:0px;">
							<li>
								<a href="${BASE_PATH}/manage/article/list.htm">根目录</a>
							</li>
							<#list pathList as pathFolder>
							<li>
								<a href="${BASE_PATH}/manage/article/list.htm?folderId=${pathFolder.folderId}">${pathFolder.name}</a>
							</li>
							</#list>
						</ul>
					   </div>
					   <div class="col-lg-4">
							<a class="btn btn-primary" style="float:right;" href="${BASE_PATH}/manage/article/add.htm?folderId=${folderId}">增加文章</a>
					   </div>
				</header>
                <div class="panel-body">
                	<div class="adv-table">
                    	<div role="grid" class="dataTables_wrapper" id="hidden-table-info_wrapper">
                            <table class="table table-striped table-advance table-hover">
                            	<thead>
                                	<tr>
										<th>文章名称</th>
										<th>状态</th>
                						<th>所属目录</th>
                						<th>最后更新时间</th>
                						<th>操作</th>
              						</tr>
                                </thead>
                            	<tbody role="alert" aria-live="polite" aria-relevant="all">
                            		<#list pageVo.list as e>
                            		<tr class="gradeA odd">
               							<td>
               								<a href="${BASE_PATH}/manage/article/update.htm?articleId=${e.articleId}">${e.title}</a>
               							</td>
               							<td>
               								<#if e.status=="display">
               									显示
                                    		<#else>
                                    			<span style="color:red;">隐藏</span>
                                    		</#if>
               							</td>
                            			<td>
                            				<a href="${BASE_PATH}/manage/article/list.htm?folderId=${e.folder.folderId}&status=${e.status}">
                            					${e.folder.name}
                            				<a>
                            			</td>
                                    	<td>${e.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                    	<td>
                  							<!-- Icons -->
                  							<a href="${BASE_PATH}/manage/article/update.htm?articleId=${e.articleId}" title="修改">
                  								编辑
                  							</a>
                  							 | 
                  							<a href="javascript:void(0);" class="js_article_delete" articleId="${e.articleId}" title="是否删除文章【${e.title}】">
                  								删除
                  							</a>
                						</td>
                                	</tr>
                                	</#list>
                               	</tbody>
                              </table>
                              <div style="height: 30px;">
                             	<div class="pagination">${pageVo.pageNumHtml} </div>
                              </div>
                           </div>
                        </div>
                  </div>
              </section>
              <!-- page end-->
          </section>
		</section>
		<!--main content end-->
<script>
$(function(){
	$('.js_article_delete').click(function(){
		var articleId = $(this).attr('articleId');
		var status= "trash";
		bootbox.dialog({
			message : $(this).attr('title'),
			title : "提示",
			buttons : {
				"delete" : {
					label : "确定",
					className : "btn-success",
					callback : function() {
						$.post("${BASE_PATH}/manage/article/delete.json", { "articleId": articleId},function(data){
								window.location.reload();
						}, "json");
					}
				},
				"cancel" : {
					label : "取消",
					className : "btn-primary",
					callback : function() {
						
					}
				}
			}
		});					
	});			
});
</script>
<#include "/manage/foot.ftl">
