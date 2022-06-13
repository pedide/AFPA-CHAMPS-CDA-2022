package com.projetafpa.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.projetafpa.model.Cart;


@WebServlet("/remove-from-cart")
public class RemoveFromCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			
			String productId = request.getParameter("id");	
			if(productId!=null) {
		ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
				if (cart_list !=null){
					for (Cart c: cart_list) {
						if (c.getId()== Integer.parseInt(productId)){
							
							cart_list.remove(cart_list.indexOf(c)); // indication
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
