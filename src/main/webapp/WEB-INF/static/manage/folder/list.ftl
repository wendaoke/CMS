<#assign menu="folder">
<#assign submenu="folder_list">
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
		<div class="row">
			<div class="col-lg-12">
				<!--breadcrumbs start -->
				<ul class="breadcrumb">
					<li><a href="${BASE_PATH}/manage/folder/list.htm?folderId=0"><i
							class="icon-home"></i> 根目录</a></li> 
					<#list pathList as pathFolder>
					<li><a
						href="${BASE_PATH}/manage/folder/list.htm?folderId=${pathFolder.folderId}">${pathFolder.name}</a>
					</li>
					</#list>
				</ul>
				<!--breadcrumbs end -->
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<header class="panel-heading"> ${folder.name} 的子目录 </header>
					<div class="panel-body">
						<div class="adv-table">
							<div role="grid" class="dataTables_wrapper"
								id="hidden-table-info_wrapper">
								<table class="table table-striped table-advance table-hover">
									<thead>
										<tr>
											<th>顺序</th>
											<th>名称</th>
											<th>英文名称</th>
											<th>状态</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody role="alert" aria-live="polite" aria-relevant="all">
										<#list folderList as folder>
										<tr class="gradeA_firstFolder">
											<td class="folderSort"><input type="text"
												folderId="${folder.folderId}" value="${folder.sort}" name="sort"
												class="js_folder_sort" style="width: 40px;"></td>
											<td><a
												href="${BASE_PATH}/manage/folder/list.htm?folderId=${folder.folderId}">${folder.name}</a></td>
											<td>${folder.ename}</td>
											<td>
												<#if folder.status=="display">
													显示
												<#else>
													隐藏
												</#if>
											</td>
											<td>
												<!-- Icons -->
												<a href="${BASE_PATH}/manage/folder/list.htm?folderId=${folder.folderId}" title="修改">
													子目录
												</a>
												 | 
												<a href="${BASE_PATH}/manage/folder/update.htm?folderId=${folder.folderId}" title="修改">
													修改
												</a>
												|
												<a class="js_folder_delete" folderId="${folder.folderId}" href="javascript:void(0);" title="删除${folder.name}">
													删除
												</a>
												 | 
												<a href="${BASE_PATH}/manage/article/list.htm?folderId=${folder.folderId}"  folderId="${folder.folderId}" href="javascript:void(0);">
													文章列表
												</a>
											</td>
										</tr>
										</#list>
									</tbody>
								</table>
							</div>
							<div>
								<button class="btn btn-info js_update_sort" type="button">
									<i class="icon-refresh"></i> 更新排序
								</button>
							</div>
						</div>
					</div>
				</section>
			</div>
			<!-- page end-->
	</section>
</section>
<!--main content end-->
<script type="text/javascript">
var pageFolderId = ${folder.folderId};
$(function() {
    $('.js_update_sort').click(function() {
        var folderSort = new Array();
        $('.js_folder_sort').each(function(i, element) {
            var folder = {};
            folder.folderId = $(element).attr('folderId');
            folder.sort = $(element).val();
            folderSort.push(folder);
        });
        $.post("${BASE_PATH}/manage/folder/sort.json", {
            "sortJson": $.toJSON(folderSort)
        },
        function(data) {
            if (data.result) {
                bootbox.alert("更新成功",
                function() {
                    window.location.href = "${BASE_PATH}/manage/folder/list.htm?folderId=" + pageFolderId;
                });
            } else {
                bootbox.alert(data.msg,
                function() {
          		});
            }
        },
        "json");
    });
    $('.js_folder_delete').click(function() {
        var folderId = $(this).attr('folderId');
        bootbox.dialog({
            message: "是否" + $(this).attr('title') + "文件夹",
            title: "提示",
            buttons: {
                "delete": {
                    label: "删除",
                    className: "btn-success",
                    callback: function() {
                        $.post("${BASE_PATH}/manage/folder/delete.json", {
                            "folderId": folderId
                        },
                        function(data) {
                            if (data.result) {
                                bootbox.alert("删除成功",
                                function() {
                                    window.location.href = "${BASE_PATH}/manage/folder/list.htm?folderId=" + pageFolderId;
                                });
                            } else {
                                bootbox.alert(data.msg,
                                function() {});
                            }
                        },
                        "json");
                    }
                },
                "cancel": {
                    label: "取消",
                    className: "btn-primary",
                    callback: function() {}
                }
            }
        });
    });
    $('#addFolder_form').ajaxForm({
        dataType: 'json',
        success: function(data) {
            if (data.result) {
                bootbox.dialog({
                    message: "保存成功",
                    title: "提示",
                    buttons: {
                        ok: {
                            label: "确定",
                            className: "btn-success",
                            callback: function() {
                                window.location.reload();
                            }
                        }
                    }
                });
            } else {
                showErrors($('#addFolder_form'), data.errors);
            }
        }
    });
    $(".js_folder_type").change(function(){
		$.post("${BASE_PATH}/manage/folder/type.json", {"folderId": $(this).attr("folderId"),type:$(this).val()},function(){
			window.location.reload();
        },"json");  	
    });
    $(".js_folder_status").change(function(){
		$.post("${BASE_PATH}/manage/folder/status.json", {"folderId": $(this).attr("folderId"),status:$(this).val()},function(){
			window.location.reload();
        },"json");  	
    });
});
</script>
<#include "/manage/foot.ftl">
