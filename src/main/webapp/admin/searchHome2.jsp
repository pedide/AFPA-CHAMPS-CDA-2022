<%@page import="java.text.DecimalFormat"%>
<%@ page import="com.xprodmvc.connection.DbCon"%>
<%@ page import="java.util.*"%>
<%@ page import="com.xprodmvc.model.*"%>
<%@ page import="com.xprodmvc.dao.*"%>
<%@page import="java.sql.*"%>
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
<%@ include file="adminHeader.jsp"%>
 <link rel="stylesheet" href="../css/AjouterNvProduit-style.css">  
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<meta charset="UTF-8">
<title>Recherche-admin</title>
<%@include file="/includes/head.jsp"%>
</head>
<body>
<div style="color: black; text-align: center; font-size: 30px;">
		Home<i class="fas fa-home"></i>
	</div>
	        		<div class="container">
        		<div class="card-header my-3">Liste des produits</div>
        		
        		<div class=row>
	<% int z = 0;
	
           try{
        	   String search=request.getParameter("search");
        	   String query ="select * from produits where nom like '%"+search+"%' or categorie like '%"+search+"%' and active='yes'";      	
        	   Connection con = DbCon.getConnection();    
        	   Statement st = con.createStatement();      	  
        	   ResultSet rs = st.executeQuery(query);      	
        	    while(rs.next()){
           		z=1;
        		%>
        		<!-- <tr> -->

        			<div class="col-md-3" style="width: 18rem;">
        				<div class="card">
        					<div class="containerIMG mt-3">
        					<img src="../product-image/<%=rs.getString(5) %>" class="card-img-top">
        					<div class="card-body">
        						<h5 class="card-title"><%=rs.getString(2) %></h5>
        						<h6 class="Prix">
        							Prix:<%=rs.getString(3)  %>€.
        						</h6>
        						<h6 class="Categorie"><%=rs.getString(2)  %>.
        						</h6>
        						<div class="mt-3 d-flex justify content-between"></div>
        						<a href="../delete-product?id=<%=rs.getString(1)%>"
							class="btn btn-danger">Supprimer le produit<i
							class="fas fa-trash"></i></a>
						<a href="../edit-product?id=<%=rs.getString(1)%>"
							class="btn btn-primary">Modifier le produit<i
							class="fas fa-pen-fancy"></i></a>
        							
        					</div>
        				</div>
        			</div>
    
        			</div>
        		
        	  <%  }
           }catch (Exception e) {
				System.out.println("le research home ne marche pas sur le search home jsp admin");
           }
		%>
		</div>
	</div>
	
</body>
</html>