package com.gaiaconsulting.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaiaconsulting.model.Cart;


@WebServlet("/remove-from-cart")
public class RemoveFromCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try(PrintWriter out = response.getWriter()){
		String productsId = request.getParameter("id");

		/* out.println("Produit id : "+id); */
		if(productsId != null) {
			ArrayList<Cart>cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			if(cart_list != null) {
				for(Cart c  : cart_list) {
					if(c.getId()==Integer.parseInt(productsId)) {
						
						cart_list.remove(cart_list.indexOf(c));
	break;
					}
				}
				
			}
			response.sendRedirect("cart.jsp");	
			}else {
				response.sendRedirect("cart.jsp");	
			}		
		}
		
		



	}
	
}


