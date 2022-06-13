<%@ page import ="com.xprodmvc.connection.DbCon"%>
<%@ page import ="com.xprodmvc.model.User" %>
<%@ page import ="com.xprodmvc.model.*"%>
<%@ page import ="com.xprodmvc.dao.ProductsDao"%>
<%@ page import ="java.nio.charset.StandardCharsets"%>
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
<%@include file="includes/head.jsp"%>

<body>
<%@include file="includes/navbar.jsp"%>
<%-- 	<%out.print(DbCon.getConnection()); %> --%>

	<div class="container">
		<div class="card-header my-3" style="background-color:#FFFAF0">Nos réalisations</div>
		<div class="row">
		<%
		if(!products.isEmpty()){
			for(Produits p : products){
		%>
				<div class="col md-3">
				<div class="card w-80" style="width: 18rem;">
					<div class="container-img" style="width:250px; heigh:250px;">
						<img class="card-img-top" src="product-image/<%=p.getImage() %>" alt="Card image cap">
					
						<div class="card-body">
					    	<h5 class="card-title"><%=p.getName()%></h5>
					    	<h6 class="price">Prix : <%=p.getPrice()%>€</h6>
					    	<h6 class="category"><%=p.getCategory() %></h6>
					    		<div class="mt-3 d-flex justify-content-between"></div>
<%-- 					    	<a href="add-to-cart?id=<%=p.getId()%>" class="btn btn-dark">Ajouter au panier</a>  --%>
					    	<a href="add-to-cart?id=<%=p.getId()%>" class="btn btn-outline-light" style="background:#B39188">Ajouter au panier</a> 
					    
					
					    <a href="order-now?quantity=1&id=<%=p.getId()%>" class="btn btn-outline-info">Acheter maintenant</a>
	  					</div>
	  					</div>
				</div>
			</div>
				<% 
// 				out.println(p.getCategory());
			}
		}
		%>
		</div>
	</div>
<footer>
	<div><%@include file="includes/footer.jsp"%></div>
</footer>
</body>
</html>