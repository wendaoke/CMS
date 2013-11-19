<#include "head.ftl">
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
 					修改目录
				</header>
				<div class="panel-body">
					<form method="post" class="form-horizontal tasi-form" action="/CMS/admin/folder/updateFolder.do">
					<fieldset>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">目录Id</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="folderId" value="${folder.folderId}">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">目录名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="folderName" value="${folder.name}">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">英文名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control round-input" name="folderEname" value="${folder.ename}">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">父级标签</label>
							<div class="col-sm-10">
								<label class="col-sm-2 col-sm-2 control-label">
									${fatherFolderName}
								</label>
								<select class="form-control input-lg m-bot15" style="font-size:15px;width: 300px;" name="fatherId">
									<option value="0">未分类</option>
									<#list folderAll as folder>
										<option value="${folder.folderId}">${folder.name}</option>
									</#list>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">目录类型</label>
							<div class="col-sm-10">
								<label class="col-sm-2 col-sm-2 control-label">
									<#if folder.type==0>
 										文章
									<#elseif folder.type==1>
 										下载
									<#elseif folder.type==2>
 										商品
									</#if>
								</label>
								<select class="form-control input-lg m-bot15" style="font-size:15px;width: 300px;" name="type">
									<option value= "0">文章</option>
									<option value= "1">下载</option>
									<option value= "2">商品</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">目录状态</label>
							<div class="col-sm-10">
								<#if folder.status == 0>
								<input type="radio" name="status" value="0" checked="checked"/>隐藏
								<input type="radio" name="status" value="1"/>显示
								<#else>
								<input type="radio" name="status" value="0"/>显示
								<input type="radio" name="status" value="1" checked="checked"/>隐藏
								</#if>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">目录序列</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="sort" value="${folder.sort}">
							</div>
						</div>
						<div class="form-group">
							<input class="button" value="修改" type="submit" style="height:35px">
						</div>
					</fieldset>
				</form>
				</div>
			</section>
		</div>
		</div>
<!-- page end-->
		</section>
	</section>
 <!--main content end-->
<#include "foot.ftl">