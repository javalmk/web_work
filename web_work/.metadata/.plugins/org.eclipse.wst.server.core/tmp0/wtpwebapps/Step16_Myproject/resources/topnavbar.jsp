	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<!-- Fixed navbar -->
	<div class="navbar navbar-inverse navbar-fixed-top headroom" >
		<div class="container">
			<div class="navbar-header">
				<!-- Button for smallest screens -->
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
				<a class="navbar-brand" href="${pageContext.request.contextPath}/home.do"><img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="Progressus HTML5 template"></a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-right">
					<li class="active"><a href="${pageContext.request.contextPath}/home.do">Home</a></li>
					<li><a href="${pageContext.request.contextPath}/cafe/list.do">Board</a></li>
					<li><a href="${pageContext.request.contextPath}/file/list.do">File</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">More Pages <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="${pageContext.request.contextPath}/sidebar_left.do">Left Sidebar</a></li>
							<li class="active"><a href="${pageContext.request.contextPath}/sidebar_right.do">Right Sidebar</a></li>
						</ul>
					</li>
					<c:if test="${not empty id}">
					<li><a href="${pageContext.request.contextPath}/users/private/info.do"><span class="glyphicon glyphicon-user"></span> ${id}</a></li>
					<li><a href="${pageContext.request.contextPath}/users/logout.do">LOGOUT</a></li>

					</c:if>
					<c:if test="${empty id}">
					<li><a class="btn" href="${pageContext.request.contextPath}/users/signup_form.do">SIGN UP</a></li>					
					<li><a class="btn" href="${pageContext.request.contextPath}/users/login_form.do">LOGIN</a></li>
					</c:if>
					
				</ul>
			</div><!--/.nav-collapse -->
		</div>
	</div> 
	<!-- /.navbar -->
