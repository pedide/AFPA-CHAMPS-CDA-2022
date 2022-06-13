<%@page import="java.util.List"%>
<%@page import="com.gaiaconsulting.model.Cart"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.gaiaconsulting.dao.ProductsDao"%>
<%@page import="com.gaiaconsulting.model.User"%>
<%@page import="com.gaiaconsulting.connection.DbCon"%>

<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute ("dcf",dcf);
User auth = (User) request.getSession().getAttribute("auth");

if (auth != null) {
	//response.sendRedirect("index.jsp");
	request.setAttribute("auth", auth);
	String email = request.getParameter("email"); //je récupère l'email de user
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;

if (cart_list != null) {

	ProductsDao pDao = new ProductsDao(DbCon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);

}
%>
<!DOCTYPE html>
<html>


 
<head>
<link rel="stylesheet" href="panier-style.css"> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css
">
<title>Gaiaconsulting cart</title>
<style type="text/css">
.table tbody td {
	vertical-align: middle;
}

.btn-incre, btn decrease {
	box-shadow: none;
	front-size: 25px;
}
</style>

	<%@include file="includes/navbar.jsp"%>
</head>
<body>
<body style= "margin-top:20px">
<div class="card">
            <div class="row">
                <div class="col-md-8 cart">
                    <div class="title">
                    			<h3>Total Price : ${(total>0)?dcf.format(total):0}€</h3>
                    
                        <div class="row">
                            <div class="col"><h4><b>Shopping Cart</b></h4></div>
                            <div class="col align-self-center text-right text-muted">3 items</div>
                        </div>
                    </div>    
                    <div class="row border-top border-bottom">
                        <div class="row main align-items-center">
                            <div class="col-2"><img class="img-fluid" src="https://i.imgur.com/1GrakTl.jpg"></div>
                            <div class="col">
                                <div class="row text-muted">Shirt</div>
                                <div class="row">Cotton T-shirt</div>
                            </div>
                            <div class="col">
                                <a href="#">-</a><a href="#" class="border">1</a><a href="#">+</a>
                            </div>
                            <div class="col">&euro; 44.00 <span class="close">&#10005;</span></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="row main align-items-center">
                            <div class="col-2"><img class="img-fluid" src="https://i.imgur.com/ba3tvGm.jpg"></div>
                            <div class="col">
                                <div class="row text-muted">Shirt</div>
                                <div class="row">Cotton T-shirt</div>
                            </div>
                            <div class="col">
                                <a href="#">-</a><a href="#" class="border">1</a><a href="#">+</a>
                            </div>
                            <div class="col">&euro; 44.00 <span class="close">&#10005;</span></div>
                        </div>
                    </div>
                    <div class="row border-top border-bottom">
                        <div class="row main align-items-center">
                            <div class="col-2"><img class="img-fluid" src="https://i.imgur.com/pHQ3xT3.jpg"></div>
                            <div class="col">
                                <div class="row text-muted">Shirt</div>
                                <div class="row">Cotton T-shirt</div>
                            </div>
                            <div class="col">
                                <a href="#">-</a><a href="#" class="border">1</a><a href="#">+</a>
                            </div>
                            <div class="col">&euro; 44.00 <span class="close">&#10005;</span></div>
                        </div>
                    </div>
                    <div class="back-to-shop"><a href="#">&leftarrow;</a><span class="text-muted">Back to shop</span></div>
                </div>
                <div class="col-md-4 summary">
                    <div><h5><b>Summary</b></h5></div>
                    <hr>
                    <div class="row">
                        <div class="col" style="padding-left:0;">ITEMS 3</div>
                        <div class="col text-right">&euro; 132.00</div>
                    </div>
                    <form>
                        <p>SHIPPING</p>
                        <select><option class="text-muted">Standard-Delivery- &euro;5.00</option></select>
                        <p>GIVE CODE</p>
                        <input id="code" placeholder="Enter your code">
                    </form>
                    <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                        <div class="col">TOTAL PRICE</div>
                        <div class="col text-right">&euro; Total Price : ${(total>0)?dcf.format(total):0}€</div>
                    </div>
                    <button class="btn">CHECKOUT</button>
                </div>
            </div>
            
        </div>
	<div class="container">
	<br><br>
		<div class="d-flex py-3">
		
			<h3></h3>
			<a  class="mx-3 btn btn-success" href="cart-check-out">Check out</a>
		</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Quantity</th>
					<th scope="col">Buy</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (cart_list != null) {

					for (Cart c : cartProduct) {
				%>
				

				<tr>
				
					<td><%=c.getName() %></td>
					<td><%=c.getCategory() %></td>
					<td><%=dcf.format(c.getPrice()) %></td>
					<td>

						<form action="order-now" method="post" >
							<input type="hidden" name="id" value="<%=c.getId()%>" class="form-input">
							<div class="form-group d-flex justify-content-between w-50">
								<a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"> 
								<i class="fas fa-minus-square"></i>
								</a>
							 <input type="text" name="quantity" class="form-control w-50" value="<%=c.getQuantity()%>" readonly> 
									<a class="btn btn-sm btn-incre"	href="quantity-inc-dec?action=inc&id=<%=c.getId()%>">
									 <i class="fas fa-plus-square"></i>
									 </a>
							</div>
						
					</td>
					<td>
					<button href="order-now?quantity=1&id=<%=c.getId()%>" type="submit" class = "btn btn-primary btn-sm" >Buy</button>
					</td>
					
					<td></form>
					<a class="btn btn-sm btn-danger"  >Cancel</a>
					</td>
				</tr>
				<%
				}
				}
				%>
				
			</tbody>
		</table>
		
	</div>
						
	
</body>
<footer>	<%@include file="includes/footer.jsp"%>
</footer>
</html>