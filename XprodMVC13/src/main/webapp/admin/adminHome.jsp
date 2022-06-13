<%@page import="java.sql.Connection"%>
<%@ page import="java.nio.charset.StandardCharsets"%>
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

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Page Admin</title>
<style>
h1 {
	color: white;
	text-align:center;
	font-size: 100px;
}
</style>
<%@include file="/includes/head.jsp"%>

<body>

<%-- <%@include file="/admin/adminHeader.jsp"%> --%>
<%@include file="/admin/adminNavbar.jsp"%>
<!-- <div style="color:black; text-align:center; font-size:30px;">Bienvenue à l'Accueil <i class="fas fa-home"></i></div> -->
<%
	String msg = request.getParameter("msg");
	if ("done".equals(msg)) {
	%>
	<h3 class="alert">Le produit a été mise à jour correctement.</h3>
	<%
	}
	%>
	<%
	if ("wrong".equals(msg)) {
	%>
	<h3 class="alert">Il y a une erreur ! Merci d'essayer à nouveau !</h3>
	<%
	}
	%>
	
<div class="container">
<div class="card-header my-3" style="background-color:#FFFAF0">Liste des produits</div>
<div class="row">
		<%
		if(!products.isEmpty()){
			for(Produits p : products){
		%>
				<div class="col md-3">
				<div class="card w-80" style="width: 18rem;">
					<div class="container-img" style="width:250px; heigh:250px;">
					<img class="card-img-top" src="../product-image/<%=p.getImage() %>" alt="Card image cap">
					</div>
					<div class="card-body">
					    <h5 class="card-title"><%=p.getName()%></h5>
					    <h6 class="price">Prix : <%=p.getPrice()%>€</h6>
					    <h6 class="category"><%=p.getCategory() %></h6>
					    	<div class="mt-3 d-flex justify-content-between"></div>
					
				    	<a href="editProduct.jsp?id=<%=p.getId()%>" class="btn btn-outline-secondary">Edition <i class="fas fa-pen-fancy"></i></a>
				    	
				    	<a href="../delete-product?id=<%=p.getId()%>" class="btn btn-danger">Suppression <i class="fas fa-trash"></i></a>  
				    	
<%-- 				<!-- Button -->
    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#popup">
		Suppression <i class="fas fa-trash"></i></button> 

    <!-- Pop-up -->
      <div id="popup" class="modal">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <p> Entête du pop-up </p>
            </div>
            <div class="modal-body">
              <p> Voulez-vous supprimer le produit ?</p>
              <button type="button" class="btn btn-primary">
              	<a href="../delete-product?id=<%=p.getId()%>" class="btn btn-danger">Suppression <i class="fas fa-trash"></i></a>
              </button> 
            </div>
            <div class="modal-footer">
              <p> Footer du pop-up</p>
           <button type="button" class="btn btn-secondary" data-dismiss="modal">
           	<a href="adminHome.jsp">Fermer le popup</a>
           </button>
            </div>
          </div>
        </div>
      </div> --%>
				    	
				    	
	  				</div>
				</div>
			</div>
				<%
				}
		}
			%>
		</div>
	</div>
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>	
</body>
<footer>
	<%@ include file="adminFooter.jsp"%>
</footer>
</html>