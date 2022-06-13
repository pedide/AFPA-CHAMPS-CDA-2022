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

@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");

		try (PrintWriter out = response.getWriter()) {
			
			request.setCharacterEncoding("UTF-8");

			ArrayList<Cart> cartList = new ArrayList<Cart>();
			int id = Integer.parseInt(request.getParameter("id"));

			Cart cn = new Cart();
			// creation du panier
			cn.setId(id);// definit l'id de cn "id"
			cn.setQuantity(1);// définit la quantity de cn à 1

			HttpSession session = request.getSession();
			ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

			if (cart_list == null) {
				cartList.add(cn);
				session.setAttribute("cart-list", cartList);
				// out.println("La session a été créee et un élémenet a été ajouter à la
				// liste.");
				// out.println("<h3 style='color : crimon; text-align : center'>Vous avez bien
				// ajouté votre roduit. <a href = 'cart.jsp'>Aller au panier</a></h3>");
				response.sendRedirect("index.jsp");
			} else {
				// out.println("La liste existe déjà en session!");
				cartList = cart_list;

				// On ajoute un produit uniquement s'il n'existe pas encore
				// Est ce que le produit existe ?
				boolean existe = false;
				for (Cart c : cartList)
				{
					if (c.getId() == cn.getId())
					{
						existe = true;
					}
				}
				// On ajoute uniquement les nouveaux produits
				if (! existe)
				{
					cartList.add(cn);
				}
				
				// Dans tous les cas on retourne sur la page index
				response.sendRedirect("index.jsp");
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());

		}
	}
}
