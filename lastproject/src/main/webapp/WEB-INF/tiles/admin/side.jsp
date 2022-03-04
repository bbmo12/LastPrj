

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


	<ul class="nav">
		<li class="nav-item nav-category">Main</li>
		<li class="nav-item"><a class="nav-link" href="main"> <span
				class="icon-bg"><i class="mdi mdi-cube menu-icon"></i></span> <span
				class="menu-title">Dashboard</span>
		</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
				<span class="icon-bg"><i
					class="mdi mdi-crosshairs-gps menu-icon"></i></span> <span
				class="menu-title">관리</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="ui-basic">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link" href="boardTables">공지사항 관리</a></li>
					<li class="nav-item"><a class="nav-link"
						href="pmemberTables">파트너회원 관리</a></li>
					<li class="nav-item"><a class="nav-link"
						href="reportTables">신고 관리</a></li>
						<li class="nav-item"><a class="nav-link"
						href="reportList">신고 관리2</a></li>
				</ul>
			</div></li>

		<!-- resources/pages/tables/basic-table.html -->
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#auth" aria-expanded="false" aria-controls="auth"> <span
				class="icon-bg"><i class="mdi mdi-lock menu-icon"></i></span> <span
				class="menu-title">User Pages</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="auth">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="resources/pages/samples/blank-page.html"> Blank Page </a></li>
					<li class="nav-item"><a class="nav-link"
						href="resources/pages/samples/login.html"> Login </a></li>
					<li class="nav-item"><a class="nav-link"
						href="resources/pages/samples/register.html"> Register </a></li>
					<li class="nav-item"><a class="nav-link"
						href="resources/pages/samples/error-404.html"> 404 </a></li>
					<li class="nav-item"><a class="nav-link"
						href="resources/pages/samples/error-500.html"> 500 </a></li>
				</ul>
			</div></li>
		<li class="nav-item documentation-link"><a class="nav-link"
			href="http://www.bootstrapdash.com/demo/connect-plus-free/jquery/documentation/documentation.html"
			target="_blank"> <span class="icon-bg"> <i
					class="mdi mdi-file-document-box menu-icon"></i>
			</span> <span class="menu-title">Documentation</span>
		</a></li>
		<!-- <li class="nav-item sidebar-user-actions">
			<div class="user-details">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<div class="d-flex align-items-center">
							<div class="sidebar-profile-img">
								<img src="resources/assets123/images/faces/face28.png" alt="image">
							</div>
							<div class="sidebar-profile-text">
								<p class="mb-1">Henry Klein</p>
							</div>
						</div>
					</div>
					<div class="badge badge-danger">3</div>
				</div>
			</div>
		</li> -->
		<li class="nav-item sidebar-user-actions">
			<div class="sidebar-user-menu">
				<a href="#" class="nav-link"><i
					class="mdi mdi-settings menu-icon"></i> <span class="menu-title">Settings</span>
				</a>
			</div>
		</li>
		<li class="nav-item sidebar-user-actions">
			<div class="sidebar-user-menu">
				<a href="#" class="nav-link"><i
					class="mdi mdi-speedometer menu-icon"></i> <span class="menu-title">Take
						Tour</span></a>
			</div>
		</li>
		<li class="nav-item sidebar-user-actions">
			<div class="sidebar-user-menu">
				<a href="adminLogout.do" class="nav-link"><i
					class="mdi mdi-logout menu-icon"></i> <span class="menu-title">Log
						Out</span></a>
			</div>
		</li>
	</ul>