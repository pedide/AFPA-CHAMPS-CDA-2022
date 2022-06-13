package com.projetafpa.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.projetafpa.connection.DbCon;
import com.projetafpa.dao.OrderDao;
import com.projetafpa.model.Cart;
import com.projetafpa.model.Order;
import com.projetafpa.model.User;


@WebServlet("/order-now")
public class OrderNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try (PrintWriter out = response.getWriter()){
			
			SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd");
			Date date = new Date();
		
		User auth = (User) request.getSession().getAttribute("auth");
		
		if (auth !=null) {
			String productId = request.getParameter("id");
			Double productPrice = Double.parseDouble(request.getParameter("price"));
			
			int productQuantity =Integer.parseInt(request.getParameter("quantity"));
			
			if(productQuantity <= 0) {
				productQuantity = 1;
			}
			Order orderModel = new Order();
			
			orderModel.setId(Integer.parseInt(productId)); //mettre des donnees dans un objet
			orderModel.setOrderId(auth.getId()); // je recupere id de la personne authentifié
			orderModel.setQuantity(productQuantity);
			orderModel.setDate(formatter.format(date));
			orderModel.setPrice(productPrice);
			
			
				OrderDao orderDao = new OrderDao(DbCon.getConnection());
				boolean result = orderDao.insertOrder(orderModel);
				//System.out.println(result);
				
				if (result) { 
					ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
					if (cart_list !=null){
						for (Cart c: cart_list) {
							if (c.getId()== Integer.parseInt(productId)){
								
								cart_list.remove(cart_list.indexOf(c)); // indication
								break;
								
			}
		}

	}// suppose quelqu'un achète
					response.sendRedirect("Orders.jsp");	
				
		}else {
			out.println("Order failed");
			
		}
		
		}else {
			response.sendRedirect("Login.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
	
		}
		
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
