package com.pokepok.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pokepok.connection.DbCon;
import com.pokepok.dao.CommandeDao;
import com.pokepok.dao.OrderDao;
import com.pokepok.model.Cart;
import com.pokepok.model.Commande;
import com.pokepok.model.Order;
import com.pokepok.model.User;

@WebServlet("/order-now")
public class OrderNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			// out.println("Buy now servlet works!!");
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			
			User auth = (User) request.getSession().getAttribute("auth");

			if (auth != null) {
				
				String produitId = request.getParameter("id");
				Double prix = Double.parseDouble(request.getParameter("prixU"));
				/* double productPrice = Double.parseDouble(request.getParameter("price")); */
				int quantiteProduit = Integer.parseInt(request.getParameter("quantity"));

				if (quantiteProduit <= 0) {
					quantiteProduit = 1;
				}
				System.out.println("id produit : " + produitId);
				Order orderModel = new Order();
				orderModel.setId(Integer.parseInt(produitId));
				orderModel.setUid(auth.getId());
				orderModel.setQuantity(quantiteProduit);
				orderModel.setDate(formatter.format(date));
				orderModel.setPrixU(prix);
				orderModel.setEmail(auth.getEmail());
				/*
				 * System.out.println(productPrice); orderModel.setPrixU(productPrice);
				 */
				
				OrderDao orderDao = new OrderDao(DbCon.getConnection());
				boolean result = orderDao.insertOrder(orderModel);
				 
				Commande commande = new Commande();
					  commande.setDate(new Date().toString());
					  commande.setFdp(0);
					  commande.setNbArticles(1);
					  commande.setTotalHT(prix);
					  commande.setTva(20);
					  commande.setTotalTTC(0);
					  commande.setIdClient(auth.getId());
					  commande.setNomClient(auth.getName());
					  commande.setPrenomClient(auth.getName());
					  
					  
					  CommandeDao cd= new CommandeDao(DbCon.getConnection());
					  boolean result2 = cd.insertCommande(commande);
					  
				if (result || result2) {
					ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
					if(cart_list != null) {
						for(Cart c : cart_list){
							if(c.getId()== Integer.parseInt(produitId)) {
								cart_list.remove(cart_list.indexOf(c)); //Indication
								break;
							}
						}
					}
					
					
					
					response.sendRedirect("orders.jsp");
				} else {
					out.println("Echec de la commande");
				}
			} else {
				response.sendRedirect("login.jsp");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
