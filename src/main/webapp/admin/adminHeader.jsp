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
%>  --%>
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
	<%-- 	<%String name=session.getAttribute("email").toString(); %>  --%>

	<center>
		<h2>Gaia consulting admin dashbord</h2>
	</center>
	<h2>
		<a href=""> <%
 System.out.print("email");
 %><i class="fas fa-user-alt"></i>
		</a>
	</h2>
	<a href="../Home2.jsp">Accueil <i class="fa fa-university"></i></a> 
	<a href="addNewProduct.jsp">Ajouter une nouvelle formation <i class="fa fa-plus" aria-hidden="true"></i></a>
	<!--  <i class="fas fa-plus-square"></i></a> -->
	<a href="AllProductEditProduct.jsp"> Editer les formations <i class="fa fa-suitcase fa-1x"></i> </a>
		<a href="../log-out">Se déconnecter
		<i class="fa fa-sign-out" aria-hidden="true"></i></a>
	
</div>



<body>
</body>
</html>