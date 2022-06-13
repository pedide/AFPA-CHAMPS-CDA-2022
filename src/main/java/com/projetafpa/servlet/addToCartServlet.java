package com.projetafpa.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projetafpa.model.Cart;


@WebServlet("/add-to-cart")
public class addToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charest=UTF-8");
		try (PrintWriter out = response.getWriter()){
			ArrayList<Cart> cartList = new ArrayList<Cart>();
			int id = Integer.parseInt(request.getParameter("id"));
			
			Cart cm = new Cart(); // creation du panier
			cm.setId(id);
			cm.setQuantity(1);
			
			HttpSession session = request.getSession();
			ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
			
			if(cart_list == null) {
				cartList.add(cm);
				session.setAttribute("cart-list", cartList);
				response.sendRedirect("index.jsp");
				
			
				
			}else{
				
				cartList = cart_list;
				boolean exist = false;
				for (Cart c : cart_list) {
					if(c.getId() == id) { // si il y a quelque chose dans la cart list
						exist = true;
						out.println("<h3 style='color : crimon; text-align: center'>Le produit existe déjà <a href ='Cart.jsp'> Aller au panier </a> <h3>");
					}
					if (!exist) {
						cartList.add(cm);
						out.println("produit ajouté");
						response.sendRedirect("index.jsp"); //suppression erreur 500
						out.println("<h3 style='color : crimon; text-align: center'>Pour continuer vos achats <a href ='index.jsp'> Retourner au mennu </a> <h3>");

					}
				}
				
			} for (Cart c : cart_list) {
				System.out.print(c.getId());
			}
			}
		}
}