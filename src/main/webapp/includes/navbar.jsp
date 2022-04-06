<%@page import="com.xprodmvc.model.User"%>
<%@page import="com.xprodmvc.connection.DbCon"%>
<%@page import="com.xprodmvc.dao.ProductDao"%>
<%@page import="com.xprodmvc.model.Cart"%>
<%@ page import="java.util.*"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container">
			<div class="container-fluid">
				<a class="navbar-brand" href="index.jsp">XPROD</a>
				
			 	<%	
				ArrayList<Cart> liste = (ArrayList<Cart>) session.getAttribute("cart-list");
				//List<Cart> cartProduct = null;
				if (liste != null) {
					ProductDao ppDao = new ProductDao(DbCon.getConnection());
					int qte = ppDao.getTotalQteCart(liste);
				}
				//User auth = (User) request.getSession().getAttribute("auth");
			 	%>
				
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" active" aria-current="page" href="index.jsp">Accueil</a></li>
						 <li class="nav-item"><a class="nav-link" href = "cart.jsp">Panier<span class = "badge badge-danger mx-1 px-2">${cart_list.size()}</span></a></li>
						<%--<li class="nav-item"><a class="nav-link" href = "cart.jsp">Panier<span class = "badge badge-danger mx-1 px-2">${qte}</span></a></li> --%>
						<% if (auth != null){ %>
							<li class="nav-item"><a class="nav-link" href = "orders.jsp">Commandes</a></li>
							<li class="nav-item"><a class="nav-link" href = "log-out">Se déconnecter</a></li>
						<% } else { %>
						<li class="nav-item"><a class="nav-link" href = "login.jsp">Se connecter</a></li>
						<%} %>
					</ul>
				</div>
			</div>
		</div>
	</nav>