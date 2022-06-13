package com.gaiaconsulting.servlet;

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

import com.gaiaconsulting.connection.DbCon;
import com.gaiaconsulting.dao.OrderDao;
import com.gaiaconsulting.model.Cart;
import com.gaiaconsulting.model.Order;
import com.gaiaconsulting.model.User;

/**
 * Servlet implementation class OrderNowServlet
 */
@WebServlet(name = "order-now", urlPatterns = { "/order-now" })
public class OrderNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderNowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			
			User auth= (User) request.getSession().getAttribute("auth");
			if(auth!=null) {
				String productId = request.getParameter("id");
				String productPrice = request.getParameter("price");
				
				int productQuantity = Integer.parseInt(request.getParameter("quantity"));
				if(productQuantity<=0) {
					productQuantity = 1;
				}
				
				Order orderModel = new Order();
				
				orderModel.setId(Integer.parseInt(productId));
				orderModel.setUserId(auth.getId());
				orderModel.setQuantity(productQuantity);
				orderModel.setDate(formatter.format(date));
				//orderModel.setPrice(productPrice);
				
				OrderDao orderDao = new OrderDao(DbCon.getConnection());
				boolean result = orderDao.insertOrder(orderModel);
				
				if(result) {
					ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
                    if (cart_list!=null) {
                        for (Cart c : cart_list) {
                            if (c.getId() == Integer.parseInt(productId)) {

                                cart_list.remove(cart_list.indexOf(c));
                                break;
                            }
                        }
                    }
					response.sendRedirect("orders.jsp");
				}
				else {
					out.println("orders failed");
					}
				}else {
					response.sendRedirect("login.jsp");
				}
			}
				
			
		 catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}