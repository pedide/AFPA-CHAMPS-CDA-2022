package com.projetafpa.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projetafpa.connection.DbCon;
import com.projetafpa.dao.OrderDao;
import com.projetafpa.dao.ProductDao;
import com.projetafpa.model.Cart;
import com.projetafpa.model.Order;
import com.projetafpa.model.User;

import com.stripe.Stripe;
import com.stripe.model.WebhookEndpoint;
import com.stripe.param.WebhookEndpointCreateParams;


@WebServlet("/check-out")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try (PrintWriter out = response.getWriter()){
			out.println("je suis dans la servelet check out");
			SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd");
			Date date = new Date();
			ProductDao pDao = new ProductDao(DbCon.getConnection());
			
			//Stripe Key
			Stripe.apiKey="sk_test_51KsMRKJtAklxDm4Buql8FQ11EWJQbAooEyCwQ11Z5y3Kbbkb2Sk3YI8zuKqkAAe5zrFt7PxUvVYviGohw9Plpzfs00IBUANThU";
					
					
					
			HttpSession session = request.getSession();
			ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
			User auth = (User) request.getSession().getAttribute("auth");
			
			if (cart_list !=null && auth!=null ) {
				
				for (Cart c:cart_list){ // je parcours les elements de cartlist
					Order order = new Order();
					order.setId(c.getId());
					order.setOrderId(auth.getId());
					order.setQuantity(c.getQuantity());
					order.setDate(formatter.format(date));
					order.setPrice(pDao.getTotalCartPrice(cart_list));
	                order.setTotal(pDao.getTotalCartPrice(cart_list));
	                order.setEmail(auth.getEmail());
					OrderDao oDao = new OrderDao(DbCon.getConnection());
					boolean result = oDao.insertOrder(order);
					if(! result) break;
				}
				cart_list.clear();
				response.sendRedirect("Orders.jsp");
				
				}else {
					if (auth == null) 
					response.sendRedirect("Login.jsp");
				}
			
			WebhookEndpointCreateParams params =
					  WebhookEndpointCreateParams.builder()
					    .setUrl("https://example.com/my/webhook/endpoint")
					    .addAllEnabledEvent(Arrays.asList(
					      WebhookEndpointCreateParams.EnabledEvent.PAYMENT_INTENT__PAYMENT_FAILED,
					      WebhookEndpointCreateParams.EnabledEvent.PAYMENT_INTENT__SUCCEEDED))
					    .setApiVersion(WebhookEndpointCreateParams.ApiVersion.VERSION_2019_03_14)
					    .build();

					WebhookEndpoint.create(params);
			
					response.sendRedirect("Cart.jsp");
		
		

		}catch (Exception e) {
			e.printStackTrace();
		}
		}
		
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
