package com.xprodmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xprodmvc.model.Cart;


@WebServlet("/quantity-inc-dec")
public class QuantityIncDecServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//PrintWriter out = response.getWriter();
		//out.println("inc des servlet");//on verifie qu'on rentre ds servlet
		
		response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out = response.getWriter()){
			String action = request.getParameter("action");
			int id = Integer.parseInt(request.getParameter("id"));
			
			ArrayList<Cart> cart_list = (ArrayList<Cart>)request.getSession().getAttribute("cart-list");//recupere la session
			
			if(action != null && id>=1) {
				if(action.equals("inc")) {
					for(Cart c : cart_list) {//on parcout la liste
						if(c.getId() == id) {//si j'ai un id
							int quantity = c.getQuantity();//on recupere la quantite
							quantity++;
							c.setQuantity(quantity);
							response.sendRedirect("cart.jsp");
						}
					}
				}
				if(action.equals("dec")) {
					for(Cart c : cart_list) {//on parcout la liste 
						if(c.getId() == id && c.getQuantity()>1) {//si j'ai un id et on verifie que quantity est strictement positif
							int quantity = c.getQuantity();//on recupere la quantite
							quantity--;
							c.setQuantity(quantity);
							break;
						}
					}
					response.sendRedirect("cart.jsp");
				}
			}else{
				response.sendRedirect("cart.jsp");
			}
		}
	}
}

