<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!doctype html>
<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>SRTDASH Corporation</title>
<base href="${pageContext.servletContext.contextPath}/">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/png"
	href="${pageContext.request.contextPath}/assets/images/icon/favicon.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/metisMenu.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/slicknav.min.css">
<link rel="shortcut icon" href="favicon.ico">
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" type="text/css" href="css/component.css" />
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<!-- Start datatable css -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css">
<!-- amchart css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/https://www.amcharts.com/lib/3/plugins/export/export.css"
	type="text/css" media="all" />
<!-- others css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/typography.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/default-css.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/styles.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/responsive.css">
<!-- modernizr css -->
<script
	src="${pageContext.request.contextPath}/assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<!-- preloader area start -->
	<div id="preloader">
		<div class="loader"></div>
	</div>
	<!-- preloader area end -->
	<!-- page container area start -->
	<div class="page-container">
		<!-- sidebar menu area start -->
		<div class="sidebar-menu">
			<div class="sidebar-header">
				<div class="logo">
					<a href="http://localhost:8080/AssignmentJava5/staffs/top10.htm"><img
						src="${pageContext.request.contextPath}/assets/images/icon/logo.png"
						alt="logo"></a>
				</div>
			</div>
			<div class="main-menu">
				<div class="menu-inner">
					<nav>
						<ul class="metismenu" id="menu">
							<li><a
								href="http://localhost:8080/AssignmentJava5/depart/list.htm"><i
									class="ti-map-alt"></i><span><s:message
											code="global.menu.depart" /> </span></a></li>
							<li><a
								href="http://localhost:8080/AssignmentJava5/staffs/list.htm"><i
									class="ti-map-alt"></i><span><s:message
											code="global.menu.staff" /> </span></a></li>
							<li><a
								href="http://localhost:8080/AssignmentJava5/record/list.htm"><i
									class="ti-map-alt"></i><span><s:message
											code="global.menu.record" /> </span></a></li>
							<li><a href="javascript:void(0)" aria-expanded="true"><i
									class="fa fa-align-left"></i> <span><s:message
											code="global.menu.statistic" /></span></a>
								<ul class="collapse">
									<li><a
										href="http://localhost:8080/AssignmentJava5/staffs/StaffStatistic.htm"><s:message
												code="global.menu.statistic.staff" /></a></li>
									<li><a
										href="http://localhost:8080/AssignmentJava5/depart/DepartStatistic.htm"><s:message
												code="global.menu.statistic.depart" /></a></li>
								</ul>
						</ul>
					</nav>
				</div>
			</div>
		</div>
		<!-- sidebar menu area end -->
		<!-- main content area start -->
		<div class="main-content">
			<!-- header area start -->
			<div class="header-area">
				<div class="row align-items-center">
					<!-- nav and search button -->
					<div class="col-md-6 col-sm-8 clearfix">
						<div class="nav-btn pull-left">
							<span></span> <span></span> <span></span>
						</div>
						<div class="search-box pull-left">
							<form action="#">
								<input type="text" name="search" placeholder="Search..."
									required> <i class="ti-search"></i>
							</form>
						</div>
					</div>
					<!-- profile info & task notification -->
					<div class="col-md-6 col-sm-4 clearfix">
						<ul class="notification-area pull-right">
							<li id="full-view"><i class="ti-fullscreen"></i></li>
							<li id="full-view-exit"><i class="ti-zoom-out"></i></li>
							<li class="dropdown"><i class="ti-bell dropdown-toggle"
								data-toggle="dropdown"> <span>2</span>
							</i>
								<div class="dropdown-menu bell-notify-box notify-box">
									<span class="notify-title">You have 3 new notifications
										<a href="#">view all</a>
									</span>
									<div class="nofity-list">
										<a href="#" class="notify-item">
											<div class="notify-thumb">
												<i class="ti-key btn-danger"></i>
											</div>
											<div class="notify-text">
												<p>You have Changed Your Password</p>
												<span>Just Now</span>
											</div>
										</a> <a href="#" class="notify-item">
											<div class="notify-thumb">
												<i class="ti-comments-smiley btn-info"></i>
											</div>
											<div class="notify-text">
												<p>New Commetns On Post</p>
												<span>30 Seconds ago</span>
											</div>
										</a> <a href="#" class="notify-item">
											<div class="notify-thumb">
												<i class="ti-key btn-primary"></i>
											</div>
											<div class="notify-text">
												<p>Some special like you</p>
												<span>Just Now</span>
											</div>
										</a>
									</div>
								</div></li>

							<li class="dropdown"><i
								class="fa fa-envelope-o dropdown-toggle" data-toggle="dropdown"><span>3</span></i>
								<div class="dropdown-menu notify-box nt-enveloper-box">
									<span class="notify-title">You have 3 new notifications
										<a href="#">view all</a>
									</span>
									<div class="nofity-list">
										<a href="#" class="notify-item">
											<div class="notify-thumb">
												<img
													src="${pageContext.request.contextPath}/assets/images/author/author-img1.jpg"
													alt="image">
											</div>

											<div class="notify-text">
												<p>Aglae Mayer</p>
												<span class="msg">Hey I am waiting for you...</span> <span>3:15
													PM</span>
											</div>

										</a>
									</div>
								</div></li>
							<li class="settings-btn"><i class="ti-settings"></i></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- header area end -->
			<!-- page title area start -->
			<div class="page-title-area">
				<div class="row align-items-center">
					<div class="col-sm-6">
						<div class="breadcrumbs-area clearfix">
							<h4 class="page-title pull-left">Dashboard</h4>
							<ul class="breadcrumbs pull-left">
								<li><a
									href="http://localhost:8080/AssignmentJava5/staffs/top10.htm"><s:message
											code="global.home" /></a></li>
								<li><span>Dashboard</span></li>
								<span style="color: white;">lmao</span>
								<b><span><s:message code="global.language" /> :</span> </b>
								<span style="color: white;">lao</span>
								<a href="#" data-lang="en">English</a> ||
								<a href="#" data-lang="vi">Tiếng Việt</a>

							</ul>
						</div>
					</div>
					<div class="col-sm-6 clearfix">
						<div class="user-profile pull-right">
							<img class="avatar user-thumb"
								src="${pageContext.request.contextPath}/assets/images/author/avatar.png"
								alt="avatar">
							<h4 class="user-name dropdown-toggle" data-toggle="dropdown">${user.fullname}<i
									class="fa fa-angle-down"></i>
							</h4>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="#">Message</a> <a
									class="dropdown-item" href="#">Settings</a> <a
									class="dropdown-item" href="#">Log Out</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- page title area end -->
			<div class="main-content-inner">
				<!-- MAIN CONTENT GOES HERE -->
				<jsp:include page="${param.view}" />
			</div>

		</div>
		<!-- main content area end -->
		<!-- footer area start-->
		<footer>
			<div class="footer-area">
				<b><p>© Copyright 2018. SRT Corporation All right reserved</p></b> <b>Contact
					us : srtcorp@srt.com</b>
			</div>
		</footer>
		<!-- footer area end-->
	</div>
	<!-- page container area end -->
	<!-- offset area start -->
	<div class="offset-area">
		<div class="offset-close">
			<i class="ti-close"></i>
		</div>
		<ul class="nav offset-menu-tab">
			<li><a class="active" data-toggle="tab" href="#activity">Activity</a></li>
			<li><a data-toggle="tab" href="#settings">Settings</a></li>
		</ul>
		<div class="offset-content tab-content">
			<div id="activity" class="tab-pane fade in show active">
				<div class="recent-activity">
					<div class="timeline-task">
						<div class="icon bg1">
							<i class="fa fa-envelope"></i>
						</div>
						<div class="tm-title">
							<h4>Rashed sent you an email</h4>
							<span class="time"><i class="ti-time"></i>09:35</span>
						</div>
						<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
							Esse distinctio itaque at.</p>
					</div>
					<div class="timeline-task">
						<div class="icon bg2">
							<i class="fa fa-check"></i>
						</div>
						<div class="tm-title">
							<h4>Added</h4>
							<span class="time"><i class="ti-time"></i>7 Minutes Ago</span>
						</div>
						<p>Lorem ipsum dolor sit amet consectetur.</p>
					</div>
					<div class="timeline-task">
						<div class="icon bg2">
							<i class="fa fa-exclamation-triangle"></i>
						</div>
						<div class="tm-title">
							<h4>You missed you Password!</h4>
							<span class="time"><i class="ti-time"></i>09:20 Am</span>
						</div>
					</div>
					<div class="timeline-task">
						<div class="icon bg3">
							<i class="fa fa-bomb"></i>
						</div>
						<div class="tm-title">
							<h4>Member waiting for you Attention</h4>
							<span class="time"><i class="ti-time"></i>09:35</span>
						</div>
						<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
							Esse distinctio itaque at.</p>
					</div>
				</div>
			</div>
			<div id="settings" class="tab-pane fade">
				<div class="offset-settings">
					<h4>General Settings</h4>
					<div class="settings-list">
						<div class="s-settings">
							<div class="s-sw-title">
								<h5>Notifications</h5>
								<div class="s-swtich">
									<input type="checkbox" id="switch1" /> <label for="switch1">Toggle</label>
								</div>
							</div>
							<p>Keep it 'On' When you want to get all the notification.</p>
						</div>
						<div class="s-settings">
							<div class="s-sw-title">
								<h5>Show recent activity</h5>
								<div class="s-swtich">
									<input type="checkbox" id="switch2" /> <label for="switch2">Toggle</label>
								</div>
							</div>
							<p>The for attribute is necessary to bind our custom checkbox
								with the input.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- offset area end -->
	<!-- jquery latest version -->
	<script
		src="${pageContext.request.contextPath}/assets/js/vendor/jquery-2.2.4.min.js"></script>
	<!-- bootstrap 4 js -->
	<script
		src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/metisMenu.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.slicknav.min.js"></script>

	<!-- start chart js -->
	<script
		src="${pageContext.request.contextPath}/https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
	<!-- start highcharts js -->
	<script
		src="${pageContext.request.contextPath}/https://code.highcharts.com/highcharts.js"></script>
	<!-- start zingchart js -->
	<script
		src="${pageContext.request.contextPath}/https://cdn.zingchart.com/zingchart.min.js"></script>
	<script>
		zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
		ZC.LICENSE = [ "569d52cefae586f634c54f86dc99e6a9",
				"ee6b7db5b51705a13dc2339db3edaf6d" ];
	</script>
	<!-- all line chart activation -->
	<script
		src="${pageContext.request.contextPath}/assets/js/line-chart.js"></script>
	<!-- all pie chart -->
	<script src="${pageContext.request.contextPath}/assets/js/pie-chart.js"></script>
	<!-- others plugins -->
	<script src="${pageContext.request.contextPath}/assets/js/plugins.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/scripts.js"></script>
	<script src="js/custom-file-input.js"></script>
	<script>
		$(function() {
			$("a[data-lang]").click(function() {
				var lang = $(this).attr("data-lang");
				$.get("staffs/top10.htm?language=" + lang, function() {
					location.reload();
				});
				return false;
			});
		});
	</script>
	<script>
		$('#zero_config').DataTable();
	</script>
	<!-- bootstrap 4 js -->
	<script src="assets/js/popper.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/owl.carousel.min.js"></script>
	<script src="assets/js/metisMenu.min.js"></script>
	<script src="assets/js/jquery.slimscroll.min.js"></script>
	<script src="assets/js/jquery.slicknav.min.js"></script>

	<!-- Start datatable js -->
	<script
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
	<script
		src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
	<!-- others plugins -->
	<script src="assets/js/plugins.js"></script>
	<script src="assets/js/scripts.js"></script>


</body>

</html>