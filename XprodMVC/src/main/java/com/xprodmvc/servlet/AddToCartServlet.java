package com.xprodmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.stripe.param.WebhookEndpointCreateParams;
import com.xprodmvc.connection.DBCon;
import com.xprodmvc.dao.CartItemDao;
import com.xprodmvc.dao.ShoppingDao;
import com.xprodmvc.model.Cart;
import com.xprodmvc.model.CartItem;
import com.xprodmvc.model.Product;
import com.xprodmvc.model.Shoppingsession;
import com.xprodmvc.model.User;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()){
		  ArrayList<Cart> cartList = new ArrayList<Cart>();
		  int id =Integer.parseInt(request.getParameter("id")); //ID du produit
		  User auth = (User) request.getSession().getAttribute("auth");
		  System.out.println("Auth 3:" + auth);
		  Cart cm = new Cart();
		  cm.setId(id);
		  cm.setQuantite(1);
		  
		  Cart cart = new Cart();
		  CartItem cartItem=new CartItem() ;
		  
		  Product prod = new Product();
		  Shoppingsession shopS = (Shoppingsession) request.getSession().getAttribute("shoppingcard");
		  //System.out.println("test shopping card id " + shopS.getId() + "id product " + id);
		  
		   CartItemDao cartdao = new CartItemDao(DBCon.getConnection());

		   if(auth == null) {
				  response.sendRedirect("login.jsp");
			  
		  }else {

				  System.out.println("before check ");
			  CartItem carditemobject = cartdao.checkCartItem(shopS.getId(),id);
			  System.out.println("after check ");
			  System.out.println("Value of cartitem is : " + carditemobject);
			  if (carditemobject == null) {
			System.out.println("ajout d'un nouveau ");
			  CartItem CItem = cartdao.addItem(shopS.getId(),id, 1);//ajouter
			  System.out.println("ajouter");
			  
			  } else {
				  
				cartdao.updatCartItem(carditemobject.getIdShopping(), carditemobject.getIdProduct(), carditemobject.getQte());
			  }
			  response.sendRedirect("index.jsp");
			 
			  /***
			  HttpSession session= request.getSession();
			  ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
			
			 
			  if(cart_list == null) {
				   cartList.add(cm);
				   session.setAttribute("cart-list",cartList);
				   out.println("session created and added to list");
				   response.sendRedirect("index.jsp");
			  }else {
				  cartList = cart_list;
				  boolean exist=false;
				  
				  for(Cart c : cart_list) {
					  if (c.getId()==id) 
					  {
						  exist=true;
					  
					 out.println("<h3 style='color:crimon; text-align:center'>produit exist d�ja.<a href='card.jsp'>Aller au Panier</a></h3>"); 

	}
					  if(!exist) {
						  cartList.add(cm);
						  out.println("product added !");
						
						  out.println("<h3 style='color:crimon; text-align:center'>produit exist d�ja.<a href='card.jsp'>Aller au Panier</a></h3>"); 
					   
					  }}
				  ***/
				 /** for(Cart c: cart_list) {
				    *	out.println(c.getId());
				    } */ 
					  }}
			  catch (Exception e) {

					System.out.println(e.getMessage());
				}
		}
			
	}

