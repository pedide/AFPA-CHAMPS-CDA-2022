<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<%@page import="com.gaiaconsulting.model.User"%>

<%-- <%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
	System.out.println(auth.getId());
}
%> --%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.25.3/css/all.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.boostrapcdn.com/boostrap/4.0.0/css/boostrap.min.css">
<title>Admin header</title>
</head>
<!-- Header -->
<br>
<div class="topnav sticky">
	<%String name=session.getAttribute("email").toString(); %> 

	<center>
		<h2>XPROD SHOPPING ADMIN DASHBOARD</h2>
	</center>
	<h2>
		<a href=""><%System.out.print("email");%><i class="fas fa-user-alt"></i></a>  
	</h2>
	<a href="../Home.jsp">Home<i class="fa fa-university"></i></a> <a
		href="addNewProduct.jsp">Add New Product <i
		class="fas fa-plus-square"></i></a> <a href="AllProductEditProduct.jsp">All
		Product & Edit Product <i class="fas fa-plus-square"></i>
	</a> <a href="../log-out">Logout <i class="fas fa-share-square"> </i>
	</a>
</div>
<div class="search-container">
	<!-- j'appel ma div search-container -->
	<form action="../searchHome.jsp" method="post">
		<input type="text" placeholder="search" name="search">
		<button type="submit">
			<i class="fa fa-search"></i>
		</button>
	</form>
</div>


<body>
</body>
</html>