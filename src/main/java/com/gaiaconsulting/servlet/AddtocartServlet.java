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


@WebServlet("/add-to-cart")
public class AddtocartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");

		try (PrintWriter out = response.getWriter()){
			ArrayList<Cart> cartList = new ArrayList<Cart>();
			int id = Integer.parseInt(request.getParameter("id"));
			
			Cart cm = new Cart();
			
			cm.setId(id);
			cm.setQuantity(1);
			
			HttpSession session = request.getSession();
			ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
			
			if(cart_list == null ) {
				cartList.add(cm);
				session.setAttribute("cart-list", cartList);
				response.sendRedirect("index.jsp");
			}else {
				cartList = cart_list;
				boolean exist = false;
				for (Cart c : cart_list) {
					if (c.getId() == id) {
						exist = true;
						System.out.println("<h3 style='color : crimon; text-align : center'>Le produit existe déjà<a href = 'cart.jsp'> Aller au panier </a></h3>");	
					}
					if (!exist) {
						cartList.add(cm);
						System.out.println("Produit ajouté");
						/* response.sendRedirect("index.jsp"); */
						System.out.println("<h3 style='color : crimon; text-align : center'>pour continuer votre achat<a href = 'cart.jsp'> Aller au panier </a></h3>");	
						
					}					
				}
			}			
		}
//		response.getWriter().append("Served at: ").append(request.getContextPath());
// out.println("je suis dans la servlet");
	}
	

	
	
	

}
