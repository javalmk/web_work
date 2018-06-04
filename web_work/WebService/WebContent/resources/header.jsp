<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<nav class="navbar navbar-default navbar-static-top">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${pageContext.request.contextPath}"> <i class="fa fa-instagram" aria-hidden="true"></i> Mungstargram
				</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
				<%
				String id =(String)session.getAttribute("id");
				if(id==null){
				%>
					<li><a href="${pageContext.request.contextPath}/users/login_form.jsp"> <span class="glyphicon glyphicon-user"></span>
							Login
					</a></li>
					<%}else{ %>
					<li><a href="${pageContext.request.contextPath}/users/private/info.jsp"><span class="glyphicon glyphicon-user"></span><%=id %></a></li>
					<li><a href="${pageContext.request.contextPath}/users/logout.jsp">Logout</a></li>
					<% } %>
					
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>