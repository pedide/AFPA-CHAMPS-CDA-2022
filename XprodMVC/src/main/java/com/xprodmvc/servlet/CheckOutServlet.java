package com.xprodmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.stripe.Stripe;
import com.stripe.model.WebhookEndpoint;
import com.stripe.param.WebhookEndpointCreateParams;
import com.xprodmvc.connection.DBCon;
import com.xprodmvc.dao.*;
import com.xprodmvc.model.*;
import java.sql.*;
/**
 * Servlet implementation class CheckOutServlet
 */
@WebServlet("/cart-check-out")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	 // Date date = new Date();//ça va donner la date du jour
	  //stripe
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html;charset=UTF-8");
		DecimalFormat dcf=new DecimalFormat("#.##");

		try(PrintWriter out = response.getWriter()){

		  Stripe.apiKey="sk_test_51KsMNtC2CASgLiYFgVUaldyMkWzpwZ6E7r4y5lJe2VSSzIAtCSxfWJHDOyIbYygv269ITbRnhtUurrech0xV6oli00vmbmL38K";
		  System.out.println("test servlet ");
		  //ProductDao pDao= new ProductDao(DBCon.getConnection());
		  HttpSession session= request.getSession();
		 // ArrayList<Cart> cart_list = (ArrayList<Cart>)session.getAttribute("cart-list");
		  //User auth = (User) request.getSession().getAttribute("auth");
		 
		  User auth = (User) session.getAttribute("auth");
		  double total = (double) session.getAttribute("thetotal");
		  System.out.println("user id is :" + auth.getId() + " and total is :" + total);
		  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			 Date date = new Date();

		  String adress = request.getParameter("adress");
		  String city = request.getParameter("city");
		  String ville = request.getParameter("ville");
		  String pays = request.getParameter("pays");
		  String mobileNum= request.getParameter("mobileNum");
		  String deliveryDate= request.getParameter("deliveryDate");
		  String date1=(formatter.format(date));
		 // CartItem cartItem = new CartItem();
		  Order currentOrder = new Order();
		  
		  OrderDao oDao = new OrderDao(DBCon.getConnection());
		  currentOrder = oDao.insertOrder(auth.getId(),total,adress,city,ville,pays,mobileNum,deliveryDate,date1);
		  OrderItemDao OItem = new OrderItemDao(DBCon.getConnection());
		  request.getSession().setAttribute("currentOrder", currentOrder);
		  System.out.println("id order in checkout"+currentOrder.getIdOrder());
		  
		  
		  Shoppingsession shopS = (Shoppingsession) request.getSession().getAttribute("shoppingcard");

		  Statement st = DBCon.getConnection().createStatement();
		  ResultSet rs2 = st.executeQuery("select * from cartitem where idShopping='"+shopS.getId()+"'");
		  
	        while(rs2.next()){
	        	
		  OItem.insertintoOrderItem(currentOrder.getIdOrder(),rs2.getInt(3),rs2.getInt(4));
		  
	        }
	        
	        
	        CartItemDao cdao = new CartItemDao(DBCon.getConnection());
	        cdao.deleteCardItem(shopS.getId());
	        
	        ShoppingDao shopdao = new ShoppingDao(DBCon.getConnection());
	        shopdao.deleteShopping(shopS.getId());
	        
		  
		  
		  
			/*
			 * Cart row = new Cart();
			 * 
			 * ProductDao productDao= new ProductDao(DBCon.getConnection());
			 * 
			 * if(cart_list != null && auth!=null) { for(Cart c : cart_list) {
			 * 
			 * 
			 * 
			 * 
			 * 
			 * 
			 * 
			 * 
			 * boolean result = oDao.insertOrder(order);
			 * 
			 * if(!result) break;
			 * 
			 * 
			 * 
			 * 
			 * cart_list.clear();
			 */			  response.sendRedirect("ConfirmationCommande.jsp");
			  
	 
			/*
			 * else { if(auth == null) {
			 * 
			 * response.sendRedirect("login.jsp"); WebhookEndpointCreateParams params =
			 * WebhookEndpointCreateParams.builder()
			 * .setUrl("https://example.com/my/webhook/endpoint")
			 * .addAllEnabledEvent(Arrays.asList(
			 * WebhookEndpointCreateParams.EnabledEvent.PAYMENT_INTENT__PAYMENT_FAILED,
			 * WebhookEndpointCreateParams.EnabledEvent.PAYMENT_INTENT__SUCCEEDED))
			 * .setApiVersion(WebhookEndpointCreateParams.ApiVersion.VERSION_2019_03_14)
			 * .build();
			 * 
			 * WebhookEndpoint.create(params); } // response.sendRedirect("card.jsp");
			 */
				  }
				 
			  
	
		catch (Exception e) {
			
			e.printStackTrace();

		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
