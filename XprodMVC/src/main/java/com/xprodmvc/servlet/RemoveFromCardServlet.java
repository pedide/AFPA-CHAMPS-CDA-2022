package com.xprodmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.xprodmvc.model.Cart;

/**
 * Servlet implementation class RemoveFromCardServlet
 */
@WebServlet("/remove-from-card")
public class RemoveFromCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
   

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter() ){
			  
			  
			  String productId = request.getParameter("id");
			  if(productId!= null) {
		 ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
		      if (cart_list!=null) {
		    	  for(Cart c:cart_list) {
		    		  if(c.getId()==Integer.parseInt(productId)) {
		    			cart_list.remove(cart_list.indexOf(c));  
		    			break;
		    	  }
		      }
		 
		 
		 
		 
		 
			  }
		      
		      response.sendRedirect("card.jsp");
			  }else {
				  response.sendRedirect("card.jsp");
				  
			  }
		
			
				  }
				 /** for(Cart c: cart_list) {
				    *	out.println(c.getId());
				    } */ 
		}
}


