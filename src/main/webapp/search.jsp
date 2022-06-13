<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.projetafpa.connection.DbCon"%>
<%@page import="com.projetafpa.model.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.projetafpa.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<%
DecimalFormat dcf = new DecimalFormat("#.##");// pour les deux chiffres apres la virgules
request.setAttribute("dcf", dcf); 
User auth = (User) request.getSession().getAttribute("auth");

if (auth != null) {
	response.sendRedirect("index.jsp");
	request.setAttribute("auth", auth);
}

ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getAllProducts();


ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;

if (cart_list != null) {
request.setAttribute("cart_list", cart_list);
}
%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
<%@ include file="admin/adminHeader.jsp"%>
<title>Home</title>
</head>
<body>
<div style="color:black; text-align:center; font-size:30px;">Home<i class="fa fa-university"></i></div>

      <div class="container">
		<div class="card-header my-3">List of products</div>
		<div class="row">

<%-- <%
if (!products.isEmpty()){
	
	for (Product p : products){
	
%>
		 --%>

<%
int z=0;
try{
	
	String search =request.getParameter("search");
	String query= "select * from produit where designationProd like '%"+search+"%' or descriptifProd like '%"+search+"%' and active='Yes'";
	
	Connection con = DbCon.getConnection(); // recuperation connection
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery(query);
	
	while(rs.next()){
		z=1;
		
		%>
			<div class="col-md-3">
				<div class="card w-100" style="width: 18rem;">
					<img class="card-img-top" src="product-image/<%=rs.getString(6)%>"
						alt="Card image cap">
						</div>	
					<div class="card-body">
					
						<h5 class="card-title"><%=rs.getString(2)%>"</h5>
						<h6 class="prix"><%=rs.getString(5)%>€</h6>
						<h6 class="category"><%=rs.getString(3)%></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a href="../editProduct.jsp?id=<%=rs.getString(1)%>" class="btn btn-dark">Edit<i class="fas fa-plus-square"></i></a>
							<a href="../delete-product?id=<%=rs.getString(1)%>" class="btn btn-danger">Delete<i class="fas fa-plus-square"></i></a>
						</div>
					</div>
				</div>
			</div>
		<%}

}catch(Exception e){
	System.out.println(e);
	}%>
	
</div>

<%if (z==0){ %>
<h1 style="color:black;text-align:center;"> Nothing to show</h1>
<%} %>
</div>


</body>
<%@include file="../includes/footer.jsp" %>
</html>