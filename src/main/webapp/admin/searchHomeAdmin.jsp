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
<title>Recherche</title>
<%@include file="/includes/head.jsp"%>
<%@include file="/admin/admin-header.jsp"%>
<style>
.btn{
font-size:1rem;
}
.btn-supp{
background-color : red;
color : black;
margin-right : 5px;
}
.btn-ed{
background-color : aquamarine;
color : black;
margin-right : 5px;
margin-top : 5px;
}
.btn-ed:hover{
background-color : turquoise;
color : white;
}

.btn-supp:hover{
background-color : darkred;
color : white;
}

.fa-pen-fancy{
color:red;
}
</style>
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
			 <div class="row" style="margin: 15px; float: left;">
					
					 <div>
						<!-- code copier sur https://getbootstrap.com/docs/4.0/components/card/ -->
						<div class="card w-70" style="width: 253px; margin: 15px;">
							<div class "containerimg" style="width: auto; height: 170px;">
								<img class="card-img-top" src="../product-image/<%out.print(rs.getString("IMAGE")); %>"
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
									<a href = "editProduct.jsp?id=<%=rs.getString(1)%>" class="btn btn-sm btn-ed">Editer <i class="fas fa-pen-fancy" style="color:black;"></i></a>
									
									<a href = "../delete?id=<%=rs.getString(1)%>" class="btn btn-sm btn-supp">Supprimer <i class="fas fa-trash" style="color:black;"></i></a>
									
								</div>
							</div>
						</div>
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
		<%}
	}catch(Exception e){
		System.out.println(e.getMessage());
	}
	%>
</body>

<footer>
<%@include file="/includes/footer.jsp" %>
</footer>

</html>