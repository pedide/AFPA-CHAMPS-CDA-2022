<%@page import="com.ab_motors.model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/homestyle.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudfare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/boostrap/4.0.0/css/boostrap.min.css" />
<title>Admin header</title>


</head>
<body>
	<div class="lineaire-simple">
		<div class="topnav sticky">

			<h2>AB SHOPPING</h2>

			<%String email = session.getAttribute("email").toString(); %>
			<a href=""><%=email%><i class="fas fa-user-alt"></i></a> <a
				href="adminHome.jsp">Produits<i class="fas fa-solid fa-tags"></i></a> <a
				href="addNewProduct.jsp">Ajouter produits<i
				class="fas fa-plus-square"></i></a> <a href="AllProductEditProduct.jsp">Gérer produits et véhicules<i class="fas fa-solid fa-pen-fancy"></i>
			</a> <a href="../logout.jsp">Logout<i class="fas fa-share-square"></i></a>


			<div class="search-container">
				<form action="searchHome.jsp" method=post>
					<input type="text" placeholder="search" name="search">
					<button type="submit">
						<i class="fa fa-search"></i>
					</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>