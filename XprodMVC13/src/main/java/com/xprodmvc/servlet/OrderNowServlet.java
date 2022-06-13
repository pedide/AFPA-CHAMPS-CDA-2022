package com.xprodmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xprodmvc.connection.DbCon;
import com.xprodmvc.dao.OrderDao;
import com.xprodmvc.model.Cart;
import com.xprodmvc.model.Order;
import com.xprodmvc.model.User;

@WebServlet("/order-now")
public class OrderNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");

		try (PrintWriter out = response.getWriter()) {

			request.setCharacterEncoding("UTF-8");
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date(); // ça va donner la date du jour

			// out.println("Acheter maintenant fonctionne !");
			User auth = (User) request.getSession().getAttribute("auth");

			if (auth != null) {
				String productId = request.getParameter("id");
				//Double productPrice = request.getParameter("price");erreur 
				System.out.println("OrderNowServlet");
				
				int productQuantity = Integer.parseInt(request.getParameter("quantity"));

				if (productQuantity <= 0) {
					productQuantity = 1;
				}

				Order orderModel = new Order();// on cree un achat

				// on va cree une instance d'achat. il faut id
				orderModel.setId(Integer.parseInt(productId));
				orderModel.setUid(auth.getId());// on recupere id de celui qui s'authentifie
				orderModel.setQuantity(productQuantity);
				orderModel.setDate(formatter.format(date));

				// on va rajouter notre objet dao
				OrderDao orderDao = new OrderDao(DbCon.getConnection());
				boolean result = orderDao.insertOrder(orderModel);// c'est un objet de type boolean

				if (result) {// si un objet a ete achete il faut renvoyer vers orders

					// si on a encore des produits ds la liste et si liste non null
					ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
					if (cart_list != null) {
						for (Cart c : cart_list) {
							if (c.getId() == Integer.parseInt(productId)) {
								cart_list.remove(cart_list.indexOf(c));

								break;
							}
						}
					}

					response.sendRedirect("orders.jsp");
				} else {
					out.println("La commande a échouée !");
				}
			} else {
				// sinon on redirige vers le login
				response.sendRedirect("login.jsp");
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	//c'est pour poster un formulaire
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
