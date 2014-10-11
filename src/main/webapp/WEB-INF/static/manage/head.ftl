<!DOCTYPE html>
<html lang="en">
<head>
<base href="${BASE_PATH}/"> 
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Mosaddek">
<meta name="keyword"
	content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<link rel="shortcut icon" href="img/favicon.png">
<title>后台</title>
<!-- Bootstrap core CSS -->
<link href="${BASE_PATH}/static/manage/css/bootstrap.min.css" rel="stylesheet">
<link href="${BASE_PATH}/static/manage/css/bootstrap-reset.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${BASE_PATH}/static/manage/css/gallery.css" />	
<!--external css-->
<link
	href="${BASE_PATH}/static/manage/assets/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link href="${BASE_PATH}/static/manage/assets/fancybox/source/jquery.fancybox.css" rel="stylesheet" />	
<!-- Custom styles for this template -->
<link href="${BASE_PATH}/static/manage/css/style.css" rel="stylesheet">
<link href="${BASE_PATH}/static/manage/css/style-responsive.css" rel="stylesheet" />
<link href="${BASE_PATH}/static/manage/assets/uploadify/uploadify.css" rel="stylesheet" />
<link href="${BASE_PATH}/static/manage/assets/bootstrap.datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />

<!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
<!--[if lt IE 9]>
      <script src="${BASE_PATH}/static/manage/js/html5shiv.js"></script>
      <script src="${BASE_PATH}/static/manage/js/respond.min.js"></script>
    <![endif]-->
	<script type="text/javascript">
		window.BasePath = "${BASE_PATH}";
		window.UEDITOR_HOME_URL = "${BASE_PATH}/";
		kindId = 0;
		kind = "article";
	</script>
<script src="${BASE_PATH}/static/manage/js/jquery.js"></script>
</head>
<body class="boxed-page">
	<div class="container">
	<section id="container" class="">
		<!--header start-->
		<header class="white-bg">
			<div class="container" style="background-color: #ffffff; padding: 10px;">
				<!--logo start-->
				<a href="${BASE_PATH}/index.htm" class="logo" title="访问前台页面">
					<img src="${BASE_PATH}/static/manage/images/logo.png" style="height: 38px;" />
				</a>
				<!--logo end-->
				<div class="nav notify-row" id="top_menu">
					<!--  notification goes here -->
				</div>
				<div class="top-nav ">
	
					<ul class="nav pull-right top-menu">
	                  <!-- user login dropdown start-->
	                  <li class="dropdown">
	                      <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	                          <span class="username">${SESSION_ADMIN.email}</span>
	                          <b class="caret"></b>
	                      </a>
	                      <ul class="dropdown-menu extended logout">
	                          <div class="log-arrow-up"></div>
	                          <li><a href="${BASE_PATH}/admin/admin/update.htm"><i class="icon-cog"></i> 设置</a></li>
	                          <li><a href="${BASE_PATH}/auth/admin/logout.htm"><i class="icon-key"></i> 安全退出</a></li>
	                      </ul>
	                  </li>
	                  <!-- user login dropdown end -->
	              </ul>
	          
				</div>
			</div>
		</header>
		<!--header end-->
		<!--sidebar start-->
		<aside>
			<div id="sidebar" class="nav-collapse ">
				<!-- sidebar menu goes here-->
				<ul class="sidebar-menu" id="nav-accordion">
					<li class="">
						<a <#if menu="default">class="active"</#if> href="${BASE_PATH}/manage/index.htm"> <i class="icon-home"></i> <span>首页</span></a>
					</li>
					<li class="sub-menu">
						<a href="${BASE_PATH}/manage/headline/list.htm" <#if menu="headline">class="active"</#if>> <i class="icon-tags"></i> <span>头图</span></a>
					</li>
					<li class="sub-menu">
						<a href="javascript:;" <#if menu="folder">class="active"</#if>> <i class="icon-folder-open"></i> <span>目录</span></a>
						<ul class="sub">
							<li <#if submenu="add_folder">class="active"</#if>><a href="${BASE_PATH}/manage/folder/add.htm">增加目录</a></li>
							<li <#if submenu="folder_list">class="active"</#if>><a href="${BASE_PATH}/manage/folder/list.htm">目录列表</a></li>
						</ul>
					</li>
					<li class="sub-menu">
						<a href="javascript:;" <#if menu="article">class="active"</#if>> <i class="icon-book"></i> <span>文章</span></a>
						<ul class="sub">
							<li <#if submenu="add_article">class="active"</#if>><a href="${BASE_PATH}/manage/article/add.htm">增加文章</a></li>
							<li <#if submenu="article_list">class="active"</#if>><a href="${BASE_PATH}/manage/article/list.htm">文章列表</a></li>
						</ul>
					</li>
					<li class="">
						<a <#if menu="message">class="active"</#if> href="${BASE_PATH}/manage/guestbook/list.htm"> <i class="icon-home"></i> <span>留言列表</span></a>
					</li>																
					<li class="sub-menu ">
						<a href="javascript:;" <#if menu="system">class="active"</#if>> <i class="icon-cogs"></i> <span>设置</span></a>
						<ul class="sub">
							<li <#if submenu="admin_list">class="active"</#if>><a href="${BASE_PATH}/manage/admin/manage.htm">管理员管理</a></li>
							<li <#if submenu="update_admin">class="active"</#if>><a href="${BASE_PATH}/manage/admin/update.htm">修改个人信息</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</aside>
		<!--sidebar end-->		
