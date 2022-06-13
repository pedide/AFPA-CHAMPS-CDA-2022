package com.pokepok.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
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

import com.pokepok.connection.DbCon;
import com.pokepok.dao.CommandeDao;
import com.pokepok.dao.OrderDao;
import com.pokepok.model.Cart;
import com.pokepok.model.Commande;
import com.pokepok.model.DataEncryption;
import com.pokepok.model.Order;
import com.pokepok.model.User;
import com.stripe.Stripe;
import com.stripe.model.WebhookEndpoint;
import com.stripe.param.WebhookEndpointCreateParams;

@WebServlet("/cart-check-out")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			response.setContentType("text/html;charset=UTF-8");
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
			Date date = new Date();
			
			HttpSession session = request.getSession();
			ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
			User auth = (User) request.getSession().getAttribute("auth");
			
			//Stripe Key
			
			Stripe.apiKey="sk_test_51KsMMgBVONHwYaOucMzKbpYCfEejgMimQAwga1wHsmkOq2nfYNkxu968LURRDFNlOFm69sudVAsoNADFwZvfUTlY00fbS15Vm4";
			
			String name = "";
			String email = "";
			String password = "";
			String mobileNumber = "";
			String securityQuestion = "";
			String answer = "";
			String adress = request.getParameter("adress");
			String city = request.getParameter("city");
			String cp = request.getParameter("cp");
			String state = request.getParameter("state");
			String country = request.getParameter("country");
			String auth1 = "client";
			
			if(cart_list != null && auth != null) {
				
				System.out.println(auth.getId());
				/*
				 * try{ Connection con = DbCon.getConnection(); PreparedStatement ps = con.
				 * prepareStatement("insert into user (USERNAME, EMAIL, PASSWORD, AUTHORIZATION, mobileNumber, securityQuestion, answer, adress,city,cp,state,country) values (?,?,?,?,?,?,?,?,?,?,?,?) where IDUSER = auth.getId()"
				 * );
				 * 
				 * ps.setString(1,name); ps.setString(2,email);
				 * ps.setString(3,DataEncryption.getSHA1(password)); ps.setString(4,auth1);
				 * ps.setString(5,mobileNumber); ps.setString(6,securityQuestion);
				 * ps.setString(7,answer);
				 * 
				 * ps.setString(8,adress); ps.setString(9,city); ps.setString(10,cp);
				 * ps.setString(11,state); ps.setString(12,country); ps.executeUpdate();
				 * 
				 * response.sendRedirect("signup.jsp?msg=valid");
				 * 
				 * 
				 * }catch(Exception e){ System.out.println(e.getMessage());
				 * response.sendRedirect("signup.jsp?msg=invalid"); }
				 */
				WebhookEndpointCreateParams params =
							  WebhookEndpointCreateParams.builder()
							    .setUrl("https://example.com/my/webhook/endpoint")
							    .addAllEnabledEvent(Arrays.asList(
							      WebhookEndpointCreateParams.EnabledEvent.PAYMENT_INTENT__PAYMENT_FAILED,
							      WebhookEndpointCreateParams.EnabledEvent.PAYMENT_INTENT__SUCCEEDED))
							    .setApiVersion(WebhookEndpointCreateParams.ApiVersion.VERSION_2019_03_14)
							    .build();

							WebhookEndpoint.create(params);
				
				int quantite = 0;
				double total = 0;
				
				  for(Cart c : cart_list) { // parcours tout les éléments de cart_list Order
					  Order order = new Order(); 
					  order.setId(c.getId()); 
					  order.setUid(auth.getId());
					  order.setQuantity(c.getQuantity()); 
					  order.setDate(formatter.format(date));
					  order.setPrixU(c.getPrixU());
					  //order.setPrix(c.getPrix());
					  order.setEmail(auth.getEmail());
					  
					  quantite = quantite + c.getQuantity();
					  total = total + (c.getQuantity()* c.getPrixU());
					  
					  OrderDao oDao = new OrderDao(DbCon.getConnection());
					  boolean result = oDao.insertOrder(order);
					  
					  if(!result) { break; }
				  }
				  Commande commande = new Commande();
				  commande.setDate(new Date().toString());
				  commande.setFdp(0);
				  commande.setNbArticles(quantite);
				  commande.setTotalHT(total);
				  commande.setTva(20);
				  commande.setTotalTTC(0);
				  commande.setIdClient(auth.getId());
				  commande.setNomClient(auth.getName());
				  commande.setPrenomClient(auth.getName());
				  
				  
				  CommandeDao cd= new CommandeDao(DbCon.getConnection());
				  boolean result = cd.insertCommande(commande);
				  cart_list.clear();
				  response.sendRedirect("orders.jsp");
				 
			}else {
					
				if(auth == null) {
					response.sendRedirect("login.jsp");
				}else {
					response.sendRedirect("cart.jsp");
				}
			}
			//out.println("From the check out servlet");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
