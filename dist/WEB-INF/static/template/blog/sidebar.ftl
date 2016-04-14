	<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
				<div class="sidebar-module sidebar-module-inset">
					<h4>本站介绍</h4>
					<p>
						站长，爱钓鱼，写编程
											</p>
				</div>
				<div class="sidebar-module sidebar-module-inset">
					<h4><a href="<@shishuo_folder_url_tag folderId=1/>">博客目录</a></h4>
					<ol class="list-unstyled">
						<@shishuo_folder_list_tag folderId= 1>
		                		<#list tag_folder_list as tag_folder>
						<li><a href="<@shishuo_folder_url_tag folderId=tag_folder.folderId/>">${tag_folder.name}</a><li>
						</#list>
	               				</@shishuo_folder_list_tag>
					</ol>
				</div>
				<!--
				<div class="sidebar-module sidebar-module-inset">
					<h4>功能</h4>
					<ol class="list-unstyled">
						<li><a href="${BASE_PATH}/admin/login.htm">登录</a><li>
					</ol>
				</div>
				<div class="sidebar-module">

				</div>
				-->
			</div>