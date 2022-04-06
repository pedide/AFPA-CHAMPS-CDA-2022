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

@WebServlet({ "/AddToCardServlet", "/addToCard" })
public class AddToCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");

		try (PrintWriter out = response.getWriter()) {
			ArrayList<Cart> cartList = new ArrayList<Cart>();
			int id = Integer.parseInt(request.getParameter("IDPRODUIT"));

			Cart cm = new Cart();
			// création du panier
			cm.setId(id); //définit l'id de cm à "id"
			cm.setQuantity(1); // définit la quantity de cm à 1

			HttpSession session = request.getSession();
			ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

			if (cart_list == null) {
				cartList.add(cm);
				session.setAttribute("cart-list", cartList);
				//out.println("Session créée et ajouter à la liste");
				response.sendRedirect("index.jsp");
			} else {
				cartList = cart_list;
				boolean exist = false;
				for (Cart c : cart_list) {
					
					if (c.getId() == id) { // S'il y a quelque chose dans la card list
						exist = true;
						if(c.getId()==id) {
							int quantity = c.getQuantity();
							quantity++;
							c.setQuantity(quantity);
							response.sendRedirect("cart.jsp");
						}
						//out.println("<h3 style='color : crimon; text-align : center'>Le produit exite déjà<a href = 'cart.jsp'>Aller au panier</a></h3>");
					}
					if (!exist) {
						cartList.add(cm);
						//out.println("Produit ajouté");
						out.println("<h3 style='color : crimon; text-align : center'><a href = 'cart.jsp'>Aller au panier</a></h3>");
						//response.sendRedirect("index.jsp");
					}
					

				}
				/*
				 * for (Cart c : cart_list) { out.println(c.getId()); }
				 */
			}
		}
	}

}
