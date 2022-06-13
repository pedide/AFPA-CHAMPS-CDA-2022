<%@page errorPage="error.jsp" %>
<%@page import="java.sql.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="com.pokepok.connection.DbCon"%>
<%@ page import="com.pokepok.model.*"%>
<%@ page import="java.util.List"%>
<%@ page import="com.pokepok.dao.ProductDao"%>

<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);

User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;

if (cart_list != null) {
	ProductDao pDao = new ProductDao(DbCon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
	//double total = pDao.getTotalCartPrice(cart_list);
}

ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getAllProducts();

if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recherche</title>
<%@include file="/includes/head.jsp"%>
<%@include file="/admin/admin-header.jsp"%>
</head>
<body>

<div style="color: black; text-align: center; font-size: 30px; margin: 10px;">
		<h1 class="titre">Rechercher <i class="fas fa-search" style="font-size: unset;"></i></h1>
</div>

</body>

<footer>
<%@include file="/includes/footer.jsp" %>
</footer>

</html>