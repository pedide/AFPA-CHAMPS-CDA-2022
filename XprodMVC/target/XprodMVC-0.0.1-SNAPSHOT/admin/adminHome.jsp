<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.text.*"%>
    <%@page import="java.text.DecimalFormat"%>
<%@page import="com.xprodmvc.dao.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.xprodmvc.connection.DBCon"%>
<%@page import="com.xprodmvc.model.*"%>
<%@page import="com.xprodmvc.model.Cart"%>
<%@page import="com.xprodmvc.dao.ProductDao"%>
<%@page import="java.util.*" %>
 <%@page import="com.xprodmvc.model.User" %>
  
    <%
    DecimalFormat dcf=new DecimalFormat("#.##");
    request.setAttribute("dcf",dcf);

    User auth = (User) request.getSession().getAttribute("auth");
    List<Order> orders = null;
    
    if (auth != null) {
    	request.setAttribute("person", auth);
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
    
    
    <%
//User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}
ProductDao pd = new ProductDao(DBCon.getConnection());
List<Product> products = pd.getAllProducts();

//ArrayList<Cart> cart_list =(ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;

if(cart_list !=null){

	request.setAttribute("cart_list", cart_list);
}
if(cart_list !=null){
	ProductDao pDao= new ProductDao(DBCon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	
   double total = pDao.getTotalCartPrice(cart_list);
   request.setAttribute("total",total);
  
  
	request.setAttribute("cart_list", cart_list);
}

%>
  		

<!DOCTYPE html>
<html>
<%@include file="adminHeader.jsp"%>
<head>
<meta charset="UTF-8">
<title>Bienvenue sur la page d'administrateur</title>

<!-- <style>
h1{
color:Red;
text-align:center;
font-size:100px;
}
</style> -->

</head>
<body>



<div class="contenair">
<div style="color:black; text-align:center; font-size:30px;">ACCUEIL<i class="fa fa-home" ></i></div>

		<div class="card-header my-3">Liste des produits</div>
		<div class="row">
			<%
			if (!products.isEmpty()) {
				for (Product p : products) {
			%>

			<div class="col-md-3">
				<div class="card w-80" style="width: 15rem;">
					<div class=contenairIMG style="width: 100px, height:100px">
						<img class="card-img-top" src="../product-image/<%=p.getImage()%>" alt="Card image cap">
						<%--<img src="product-image/<%=p.getImage()%>" /> --%>
						<div class="card-body">
							<h5 class="card-title"><%=p.getNom()%></h5>
							<h5 class="card-title"><%=p.getCategorie()%></h5>
							<h6 class="Prix"><%=p.getPrix()%></h6>
							<h6 class="Categorie">Categorie: categorie 1...</h6>
							<div =class="mt-3 d-flex justify-content-between"></div>
							<a href="../delete?id=<%=p.getId()%>" class="btn btn-sm btn-danger"><i class='fas fa-trash style='color: red'></i>Supprimer</a> 
						<a href="editProduct.jsp?quantite=1&id=<%=p.getId()%>" class="btn btn-primary"><i class="fas fa-pen-fancy"></i>Editer</a>
					
								
						</div>
					</div>
				</div>
			</div>

			<%
			}
			}
			%>

		</div>
		
 
 <!--   <h3 class="alert">Product added successfully</h3>
<h3 class="alert">Product already exist in your crt! quantity increased!</h3>
<h3 class="alert">Password change successfully!</h3>
 -->
  
</body>


</html>