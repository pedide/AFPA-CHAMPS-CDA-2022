
<%@page import="java.text.*"%>
<%@page import="com.xprodmvc.dao.OrderDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.xprodmvc.connection.DBCon"%>
<%@page import="com.xprodmvc.model.*"%>
<%@page import="com.xprodmvc.model.User"%>
<%@page import="com.xprodmvc.dao.ProductDao"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@page import="com.xprodmvc.model.User" %>
       <%
       DecimalFormat dcf = new DecimalFormat("#.##");
       request.setAttribute("dcf",dcf);
       
       User auth = (User)request.getSession().getAttribute("auth");
       List<Order> orders = null;
    if ( auth !=null) {
    request.setAttribute("person",auth);
    OrderDao orderDao = new OrderDao(DBCon.getConnection());
    orders = orderDao.userOrders(auth.getId());
    
    }else{
    	response.sendRedirect("login.jsp"); 
    }
    ArrayList<Cart> cart_list =(ArrayList<Cart>) session.getAttribute("cart-list");
    /* List<Cart> cartProduct = null; */
    
    if(cart_list !=null){

    	request.setAttribute("cart_list", cart_list);
    
    
    }
    
    %>
<!DOCTYPE html>
<html>
<head>
<%@include file="includes/head.jsp" %>

</head>
<body>
<%@include file="includes/navbar.jsp" %>
<div class="container">
<div class="cart-header my-3">Tout les Achats</div>
<table class="table table-light">
<thead>
<tr>
<th scope="col">Date</th>
<th scope="col">Nom</th>
<th scope="col">Categorie</th>
<th scope="col">Quantité</th>
<th scope="col">Prix</th>
<th scope="col">Annuler</th>
</tr>
</thead>
<tbody>
<%
if(orders !=null){
	for(Order o:orders){%>
	   <tr>
	   <td><%=o.getDate()%></td>
	   <td><%=o.getNom()%></td>
	   <td><%=o.getCategorie()%></td>
	   <td><%=o.getQuantite()%></td>
	   <td><%=dcf.format(o.getPrix())%></td> 
	   <td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>">Annuler l'Achat</a></td>
	   
	   </tr>
	   <% 
	   }
}
%>
</tbody>
</table>
</div>
<%@include file="includes/footer.jsp" %>
</body>
</html>