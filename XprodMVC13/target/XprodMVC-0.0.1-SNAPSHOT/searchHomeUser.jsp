<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@ page import="com.xprodmvc.connection.DbCon"%>
<%@ page import="com.xprodmvc.model.User" %>
<%@ page import ="com.xprodmvc.model.*"%>
<%@ page import ="com.xprodmvc.dao.ProductsDao"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

User auth = (User)request.getSession().getAttribute("auth"); 
	if(auth != null){
		request.setAttribute("auth", auth);
	}
	ProductsDao pd = new ProductsDao(DbCon.getConnection());
	List<Produits> products = pd.getAllProducts();
	
	//je rajoute ma liste de produits
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	List<Cart> cartProduct = null;//je cree un panier de produits

	if (cart_list != null) {
		//le nb produits s'affiche à coté btn de panier
		request.setAttribute("cart_list", cart_list);//on recuper notre liste de produits
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Home User</title>
<%@include file="includes/head.jsp"%>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	
<!-- 	<div style="color:black; text-align:center; font-size:30px;">Bienvenue à l'Accueil <i class="fas fa-home"></i></div> -->
<div class="container">
	<div class="card-header my-3">Les produits trouvés sont :</div>
	<div class="row">
	
		<%
		int z = 0;
		try{
			String search = request.getParameter("search");
			String query = "select * from produits where designation like'%"+search+"%' or descriptif like'%"+search+"%' and active='Yes'";
			
			Connection con = DbCon.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			
			while(rs.next()){
				z=1;
		%>
		<div class="col md-3">
			<div class="card w-80" style="width: 18rem;">
				<div class="container-img" style="width: 250px; heigh: 250px;">
					<img class="card-img-top"
						src="product-image/<%=rs.getString(8) %>" alt="Card image cap">
				</div>
				<div class="card-body">
					<h5 class="card-title"><%=rs.getString(3)%></h5>
					<h6 class="price">Prix : <%=rs.getString(5)%>€</h6>
					<h6 class="category">Catégorie : <%=rs.getString(4) %></h6>
					<div class="mt-3 d-flex justify-content-between"></div>
					<a href="add-to-cart?id=<%=rs.getString(1)%>" class="btn btn-dark">Ajouter au panier</a> 
					<a href="order-now?quantity=1&id=<%=rs.getString(1)%>" class="btn btn-primary">Acheter maintenant</a> 
				
				</div>
			</div>	
		</div>
		
		<%
			}	
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		%>						
	</div>
	<%if(z==0){%>
		<h1 style="color:black; text-align:center;">Nous n'avons rien trouvé !</h1>
	<%}%>
</div>
	
	
</body>
<footer>
	<%@ include file="/includes/footer.jsp"%>
</footer>
</html>