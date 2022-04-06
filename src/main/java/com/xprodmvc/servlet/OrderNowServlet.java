package com.xprodmvc.servlet;

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
			// out.println("Buy now servlet works!!");
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			
			User auth = (User) request.getSession().getAttribute("auth");

			if (auth != null) {
				
				String produitId = request.getParameter("id");
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
				
				OrderDao orderDao = new OrderDao(DbCon.getConnection());
				boolean result = orderDao.insertOrder(orderModel);
				
				if (result) {
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
