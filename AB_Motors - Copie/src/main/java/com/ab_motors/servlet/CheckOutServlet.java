package com.ab_motors.servlet;

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

import com.stripe.Stripe;
import com.stripe.model.WebhookEndpoint;
import com.stripe.param.WebhookEndpointCreateParams;
import com.ab_motors.connection.dbCon;
import com.ab_motors.dao.orderDAO;
import com.ab_motors.dao.productsDAO;
import com.ab_motors.model.Users;
import com.ab_motors.model.cart;
import com.ab_motors.model.order;


@WebServlet(name = "card-check-out", urlPatterns = { "/card-check-out" })
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

		try(PrintWriter out = response.getWriter()) {
			//out.println("chek out");
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			
			HttpSession session = request.getSession();
			 ArrayList<cart> cart_list = (ArrayList<cart>) session.getAttribute("cart-list");
			 Users auth = (Users) request.getSession().getAttribute("auth");
			 
			 Stripe.apiKey = "pk_test_51KsMOyDZuIGQaoXO7rx7pFWfZvBFBKd4UZfbX4ZsGQ1KuynTqXaWxdlJGWwIHeotESYd1jXhdgOCT322ua6NWkfD00lQ3La2ZW";
			 
			 
			 
			 
			 if(cart_list != null && auth!=null) {
				 
				 for(cart c : cart_list) {
					 order order = new order();
					 
					 int qte = c.getQUANTITY();
					 double price= c.getPRIX();
					 order.setIDPROD(c.getIDPROD());
					 order.setID_USER(auth.getID_USERS());
					 order.setQUANTITY(c.getQUANTITY());
					 order.setDATE(formatter.format(date));
					 
					 orderDAO odao = new orderDAO(dbCon.getConnection());
					 boolean result = odao.insertOrder(order);
					 
					 if(!result) break;
				 }
				 cart_list.clear();
				 response.sendRedirect("orders.jsp");
				
			 }else {
				 if(auth==null) {
					 response.sendRedirect("login.jsp");
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
				 

						
				 response.sendRedirect("card.jsp");
			 }
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("card.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
