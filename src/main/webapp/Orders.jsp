<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import ="com.projetafpa.model.User" %>
<%@page import="com.projetafpa.model.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import ="com.projetafpa.model.Cart" %>
<%@page import="com.projetafpa.dao.*"%>
<%@page import ="com.projetafpa.connection.DbCon" %>	

    
<%
DecimalFormat dcf = new DecimalFormat("#.##");// pour les deux chiffres apres la virgules
request.setAttribute("dcf", dcf); 

User auth = (User)request.getSession().getAttribute("auth");
List <Order> orders = null;
if (auth !=null){
	
request.setAttribute("auth", auth);
orders = new OrderDao (DbCon.getConnection()).userOrders(auth.getId());


}else{
	//response.sendRedirect("Login.jsp");
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;

if (cart_list != null) {
	
	ProductDao pDao = new ProductDao(DbCon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	
	//int product_id = cartProduct.getId();
	//cart toto =pDao.addProduct(product_id, "email");
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
}%>
	    
<!DOCTYPE html>
<html>
<head>
<title>RATP orders</title>
<%@include file="includes/head.jsp"%>
</head>
<body>
<%@include file="includes/navbar.jsp"%>
<div class="container">
<div class="cart-header my-3"> All Orders</div>

<table class="table table-light">
<thead>
<tr>
<th scope="col">Date</th>
<th scope="col">Name</th>
<th scope="col">Category</th>
<th scope="col">Quantity</th>
<th scope="col">Price</th>
<th scope="col">Cancel</th>

</tr>
</thead>
<tbody>
<%
if (orders !=null){
	for(Order o:orders){%>
	<tr>
	<td><%=o.getDate() %></td>
	<td><%=o.getName() %></td>
	<td><%=o.getCategory() %></td>
	<td><%=o.getQuantity() %></td>
	<td><%=dcf.format(o.getPrice())%></td>
	<td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId() %>">Cancel order</a></td>
	
<%}

}
%>


</tbody>
</table>
</div>


<%@include file="includes/footer.jsp"%>
</body>
</html>