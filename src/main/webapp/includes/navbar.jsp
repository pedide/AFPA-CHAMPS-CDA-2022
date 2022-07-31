<%@page import="com.pokepok.dao.UserDao"%>
<%@page import="com.pokepok.model.User"%>
<%@page import="com.pokepok.connection.DbCon"%>
<%@page import="com.pokepok.dao.ProductDao"%>
<%@page import="com.pokepok.model.Cart"%>
<%@ page import="java.util.*"%>
<style>
 [type=submit]{
	border:0;
	/*background-color:#1d7ccb;
	height:15%;
	color:white;
	font-size:auto;
	font-weight:auto;
	width:10% !important;
	margin-top : 10px !important;
	marfgin-left : 5px !important;*/
} 
.block{
	width:100%;
	line-height:inherit !important;
}
li{
font-size:medium;
}

</style>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color:#004040";">
	<div class="block">
		<div class="container-fluid" style = "padding-left: 5%;">

			<%
			/* ArrayList<Cart> liste = (ArrayList<Cart>) session.getAttribute("cart-list");
			//List<Cart> cartProduct = null;
			if (liste != null) {
				ProductDao ppDao = new ProductDao(DbCon.getConnection());
				int qte = ppDao.getTotalQteCart(liste);
			} */
			User auth1 = (User) request.getSession().getAttribute("auth");
			%>
			
			<%-- <%
			if (auth1 != null) {
			%>
			<h3>
				Bonjour
				<%
			out.print(auth1.getName());
			%>
			</h3>
			<%
			}
			%> --%>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent" style="float:left; width : 80%;">
				<ul class="navbar-nav" style="display : -webkit-box;">
					
					<li class="nav-item"><a class="nav-link" "active" aria-current="page" href="index.jsp">Accueil <i class='fas fa-home'></i></a></li>
					<li class="nav-item"><a class="nav-link" href="cart.jsp">Panier <i class='fas fa-cart-arrow-down'></i><span
							class="badge badge-danger mx-1 px-2">${cart_list.size()}</span></a></li>
					<%--<li class="nav-item"><a class="nav-link" href = "cart.jsp">Panier<span class = "badge badge-danger mx-1 px-2">${qte}</span></a></li> --%>
					<%
					if (auth1 != null) {
					%>
					<li class="nav-item"><a class="nav-link" href="orders.jsp">Commandes <i class='fab fa-elementor'></i></a></li>
		            <li class="nav-item"><a class="nav-link" href="info.jsp">Informations personnelles <i class="fas fa-user"></i></a>
		           	<li class="nav-item"><a class="nav-link" href="message.jsp">Nous contacter <i class='fas fa-comment-alt'></i></a></li>
		            <li class="nav-item"><a class="nav-link" href="log-out">Se déconnecter <i class="fas fa-right-long-to-line"></i></a></li>
					<%
					} else {
					%>
					
		            <li class="nav-item"><a class="nav-link" href="login.jsp">Se connecter / S'inscrire</a></li>
					<%
					}
					%>
					
		            <li class="nav-item"><a class="nav-link" href="contact.jsp">A propos <i class="fa fa-address-book"></i></a></li>
					</ul></div>
					<div class ="serch-container" style="float:right; width : 30%; display:contents;">
					<form action="searchHome.jsp" method="post">
						<input type="text" placeholder="rechercher" name="search" style="background-color: white; width: 200px; margin:8px;">
						<button classe ="loupe" type="submit" style=" margin-right:5px; width:25px; height:30px;"><i class="fas fa-search" ></i></button>
					</form>
					</div>
					
				
			
		</div>
	</div>
</nav>