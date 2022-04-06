package com.xprodmvc.servlet;

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
import javax.servlet.http.HttpSession;

import com.xprodmvc.connection.DbCon;
import com.xprodmvc.dao.OrderDao;
import com.xprodmvc.model.Cart;
import com.xprodmvc.model.Order;
import com.xprodmvc.model.User;

@WebServlet("/cart-check-out")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			response.setContentType("text/html;charset=UTF-8");
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
			Date date = new Date();
			
			HttpSession session = request.getSession();
			ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
			User auth = (User) request.getSession().getAttribute("auth");
			
			if(cart_list != null && auth != null) {
				for(Cart c : cart_list) { // parcours tout les éléments de cart_list
					Order order = new Order();
					order.setId(c.getId());
					order.setUid(auth.getId());
					order.setQuantity(c.getQuantity());
					order.setDate(formatter.format(date));
					
					OrderDao oDao = new OrderDao(DbCon.getConnection());
					boolean result = oDao.insertOrder(order);
					
					if(!result) {
						break;
					}
				}
				cart_list.clear();
				response.sendRedirect("orders.jsp");
			}else {
				if(auth == null) {
					response.sendRedirect("login.jsp");
				}else {
					response.sendRedirect("cart.jsp");
				}
			}
			//out.println("From the check out servlet");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
