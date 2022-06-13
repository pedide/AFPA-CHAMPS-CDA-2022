<%@page errorPage="error.jsp" %>
<%@page import="java.sql.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="com.pokepok.connection.DbCon"%>
<%@ page import="com.pokepok.model.*"%>
<%@ page import="java.util.List"%>
<%@ page import="com.pokepok.dao.ProductDao"%>

<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);

User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;

if (cart_list != null) {
	ProductDao pDao = new ProductDao(DbCon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
	//double total = pDao.getTotalCartPrice(cart_list);
}

ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getAllProducts();

if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="includes/navbar.jsp"%>
<%@include file="includes/head.jsp"%>
<style type = "text/css">

.btn-aj{
background-color : orange;
color : white;
margin-right : 5px;

}
.btn-aj:hover{
background-color : #fd7e04;
color : white;
}

.col-md-3{
margin-top : 20px;
}
</style>
<title>Recherche</title>
</head>
<body>

<div style="color: black; text-align: center; font-size: 30px; margin: 10px;">
		<h1 class="titre">Rechercher <i class="fas fa-search" style="font-size: unset;"></i></h1>
</div>

	<%
	int z=0;
	try{
		String search = request.getParameter("search");
		String query="select * from produits where DESCRIPTIF like '%"+search+"%' or ref like '%"+search+"%' and active='Yes'";
		Connection con = DbCon.getConnection();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(query);
		while(rs.next()){
			z=1;%>
			 <div class="row" style="margin-left: 15px;">
					
					 <div>
						<!-- code copier sur https://getbootstrap.com/docs/4.0/components/card/ -->
						<div class="card w-70" style="width: 253px; float:left; margin-left: 15px;">
							<div class "containerimg" style="width: auto; height: 170px;">
								<img class="card-img-top" src="product-image/<%out.print(rs.getString("IMAGE")); %>"
									alt="Card image cap">
							</div>
							<div class="card-body">
								<h5 class="card-title"><%out.print(rs.getString("DESIGNATION")); %></h5>
								<h6 class="price">
									Prix :
									<%out.print(rs.getString("PRIXUHT")); %>
									€
								</h6>
								<h6 class="categorie">
									Catégorie :
									<%=rs.getString(2)%></h6>
								
								<div>
									<a href="addToCard?IDPRODUIT=<%=rs.getString(1)%>" class="btn btn-sm btn-aj">Ajouter au panier</a>
				    				<a href="order-now?quantity=1&id=<%=rs.getString(1)%>" class="btn btn-sm btn-primary">Acheter</a>
								</div>
							</div>
					
					

				</div> 
		<%}
	}catch(Exception e){
		System.out.println(e.getMessage());
	}
	%>	
	</div>
	<%
		if(z==0){%>
		<div>
			<h2 style="color:black; text-align:center;">Aucun article trouvé</h2>
			<a href = "index.jsp" class="btn btn-sm btn-aj" style="text-align:center;">Retour</a>
		</div>
		<%}
	%>
	</div> 
</body>

<footer>
<%@include file="/includes/footer.jsp" %>
</footer>

</html>