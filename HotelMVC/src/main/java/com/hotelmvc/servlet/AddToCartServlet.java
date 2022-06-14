package com.hotelmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hotelmvc.model.Cart;


@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out = response.getWriter()){
			ArrayList<Cart> cartList = new ArrayList<Cart>();
			int id = Integer.parseInt(request.getParameter("id"));
			
			Cart cart = new Cart();
			cart.setRoomId(id);
			cart.setCartQuantity(1);
			
			HttpSession session = request.getSession();
			ArrayList<Cart> cartBySession = (ArrayList<Cart>) session.getAttribute("cart-list");
			
			
			
			if(cartBySession==null) {
				if(request.getSession().getAttribute("auth")==null) {
					
					out.println("<h3 style='color:crimon; text-align:center'><a href='login.jsp'>Login or register to save your fav list</a></h3><h3 "
							+ "style='color:crimon; text-align:center'>Go to Cart page<a href='cart.jsp'>Go to Cart</a></h3>");
					cartList.add(cart);
					session.setAttribute("cart-list", cartList);
				}else {
					
					cartList.add(cart);
					session.setAttribute("cart-list", cartList);
					out.println("<h3 style='color:crimon; text-align:center'><a href='room.jsp'>Continue your shopping</a></h3><h3 "
							+ "style='color:crimon; text-align:center'>Go to Cart page<a href='cart.jsp'>Go to Cart</a></h3>");					}


			} else {
				cartList = cartBySession;
				boolean exist = false;
				
				for(Cart c  : cartBySession) {		

					if(c.getRoomId()==id) {
						exist=true;	
						/*
						 * out.
						 * println("<h3 style='color:crimon; text-align:center'>Item already in your cart page.<a href='cart.jsp'>"
						 * + "Go to Cart page</a></h3>");
						 */
						System.out.println("product exist");
						response.sendRedirect("cart.jsp");		

					}
				} if(!exist) {
					cartList.add(cart);
					
					out.println("<h3 style='color:crimon; text-align:center'><a href='room.jsp'>Continue your shopping</a></h3><h3 style='color:crimon;"
							+ " text-align:center'>Go to Cart<a href='cart.jsp'>Go to Cart's page</a></h3>");
				}
		
			}
			for(Cart c : cartBySession) {
				out.println(c.getRoomId());
			}
		}
	}	

}
