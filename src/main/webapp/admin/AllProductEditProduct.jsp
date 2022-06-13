<%@page import="com.xprodmvc.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.xprodmvc.dao.ProductsDao"%>
<%@page import="java.util.List"%>
<%@page import="com.xprodmvc.model.Product"%>
<%@page import="com.xprodmvc.model.Users"%>
<%@page import="java.sql.*"%>
<%@page import="com.xprodmvc.connection.DbCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% 
Users auth = (Users) request.getSession().getAttribute("auth");

if (auth != null) {
	request.setAttribute("auth", auth);
}

ProductsDao pd = new ProductsDao(DbCon.getConnection());
List<Product> produits = pd.getAllProducts();

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;

if (cart_list != null) { 
	request.setAttribute("cart_list", cart_list);

}

%>
<!DOCTYPE html>
<html>
<head>
 <%@include file="adminHeader.jsp"%> 

<meta charset="UTF-8">
<title>Tous les produits</title>

</head>
<body>
	<div style="color: white; text-align: center; font-size: 30px">
		Tous les produits + Modifier les produits<i class="fab fa-elementer"></i>
	</div>
	<% String msg = request.getParameter("msg");
	if ("done".equals(msg)) {
	%>
	<h3 class="alert">Le produit a bien été modifié</h3>
	<%
	}
	if ("wrong".equals(msg)) {
	%>
	<h3 class="alert">Quelque chose s'est mal passé! Reessayer</h3>
	<%
	}
	%>
	<table>
		<thead>
			<tr>
				<th scope="col">ID</th>
				<th scope="col">nom</th>
				<th scope="col">categorie</th>
				<th scope="col">Prix<i class="fas fa-euro-sign"></i></th>
				<th scope="col">active</th>
				<th scope="col">Edit<i class="fas fa-pen-fancy"></i></th>
			</tr>
		</thead>
		<tbody>
		<%
		try{
			Connection con = DbCon.getConnection();
			Statement st = con.createStatement();
			ResultSet rs =st.executeQuery("select * from produits ");
				while(rs.next()){
		%>
		<% Product p = new Product(); %>
		<tr>
		<td><%=rs.getString(1)%></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString(3)%></td>
		<td><%= rs.getString(4) %><i class="fas fa-euro-sign"></i></td>
		<td><%=rs.getString(6)%></td>
		<td><a href="editproduct.jsp?id=<%=rs.getString(1)%>">Edit<i class="fas fa-pen-fancy"></i></a></td>
		</tr>
			<% }
}catch(Exception E){
		System.out.println(E);
	
}%>
		</tbody>
	

	</table>
	
</body>
</html>