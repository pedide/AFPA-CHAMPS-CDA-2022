<%@page import="java.sql.*"%>
<%@page errorPage="error.jsp" %>
<%@page import="com.pokepok.dao.OrderDao"%>
<%@page import="com.pokepok.model.Order"%>
<%@page import="com.pokepok.model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.pokepok.model.User" %>   
<%@page import="java.text.DecimalFormat"%>

<%
	User auth = (User)request.getSession().getAttribute("auth");
	List<Order> orders = null;

	if(auth != null){
		request.setAttribute("person", auth);
		OrderDao orderDao = new OrderDao(DbCon.getConnection());
		orders = orderDao.userOrders(auth.getId());
	}else{
		//response.sendRedirect("login.jsp");
	}
	
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	//List<Cart> cartProduct = null;

	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
	
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
%>    
    
<!DOCTYPE html>
<html>
<head>
<title>XPROD orders</title>
<link rel="stylesheet" href="css/signup-style.css">
<style type="text/css">
body{
	font:em Helvetiva;
	background-image: url(background/fondEcranPoke.png)!important;
	background-attachment:fixed;
}
.container{
	background-color:#ffffffc4;
	padding-bottom:5px;
}
.btn-sm{
	background-color : #008080;
	color : white;
}
.btn-sm:hover{
	background-color : #004040;
	color : white;
}
</style>
<%@include file = "includes/head.jsp" %>
</head>
<body>
<%@include file="includes/navbar.jsp"%>
<div class = "container">
	<div class = "cart-header my-3">
		<h2>Mes Achats</h2>
		
			<%
			String email = session.getAttribute("email").toString();
			int total = 0;
			int sno = 0;
			try {
				Connection con = DbCon.getConnection();
				Statement st = con.createStatement();
				ResultSet rs1 = st.executeQuery("select sum(total) from orders where email = '" + email + "'");
				while (rs1.next()) {
					total = rs1.getInt(1);
			%>
				<h5 style="background-color: #004040; color:white; padding:3px;">Montant Total:<i class="fa fa-inr" style="color:white;"></i> <%out.println(total);%></h5>
			
				<%
			}

			} catch (Exception e) {
				System.out.println(e);
			}
			%>
		<table class = "table table-light">
			<thead>
				<tr>
					<th scope = "col">Date</th>
					<th scope = "col">Nom</th>
					<th scope = "col">Catégorie</th>
					<th scope = "col">Quantité</th>
					<th scope = "col">Prix</th>
					<th scope = "col">Annulé</th>
				</tr>
				
			</thead>
			<tbody>
			 <%if(orders != null){
						for(Order o : orders){%>
							<tr>
								<td><%=o.getDate()%></td>
								<td><%=o.getName()%></td>
								<td><%=o.getCategorie()%></td>
								<td><%=o.getQuantity()%></td>
								<td><%=dcf.format(o.getPrixU())%></td>
								<td><a class = "btn btn-sm btn-danger" href = "cancel-order?id=<%=o.getOrderId()%>">Annuler la commande</a></td>
								<td><a class = "btn btn-sm btn-dtl" href = "detailOrder.jsp?id=<%=o.getOrderId()%>">Détail de la commande</a></td>
							</tr>
					<%}
						}%>
			
			</tbody>
		</table>
	</div> 
</div>


</body>
<footer>
<%@include file="includes/footer.jsp"%>
</footer>
</html>