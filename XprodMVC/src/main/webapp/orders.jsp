
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
 <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%> 
<%@page import="java.sql.Connection"%>




<!DOCTYPE html>
<html>
<head>
<%@include file="includes/head.jsp" %>

</head>
<body>
<%@include file="includes/navbar.jsp" %>
<div class="container">
<div class="cart-header my-3">Toute les Commandes</div>
<table class="table table-light">
<thead>
<tr>
<th scope="col">N°Commande</th>
<th scope="col">Prix Totale</th>
<th scope="col">Date de Commande</th>
<th scope="col">Détails</th>

</tr>
</thead>
<tbody>
       <%
       DecimalFormat dcf = new DecimalFormat("#.##");
       request.setAttribute("dcf",dcf);
       Connection con = DBCon.getConnection();
   	Statement st = con.createStatement();
       User auth = (User)request.getSession().getAttribute("auth");
   int id= auth.getId();
    if ( auth !=null) {
  
    	  ResultSet rs = st.executeQuery("select * from orders where idClient=+'"+id+"'  ");
          while(rs.next()){
          	
          
          
    
    
    %>

	   <tr>
	   <td><%=rs.getInt(1)%></td>
	   <td><%=dcf.format(rs.getDouble(3))%></td>
	   <td><%=rs.getString(10)%></td>
	   <td><a class="btn btn-sm btn-danger" href="DetailsCommande.jsp?id=<%=rs.getInt(1)%>">Détails</a></td>
	   
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