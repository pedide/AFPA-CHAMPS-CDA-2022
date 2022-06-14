package com.hotelmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotelmvc.connection.DbCon;
import com.hotelmvc.dao.OrderDAO;
import com.hotelmvc.model.Order;
import com.hotelmvc.model.User;


@WebServlet("/order-now")
public class OrderNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		try(PrintWriter out = response.getWriter()){
			out.println("Buy now Servlet Works");

			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			out.println("La date : "+date);
			User auth = (User)request.getSession().getAttribute("auth");
			out.println("L'user : " + auth);

			if(auth!=null) {
				String roomId = request.getParameter("id");
				out.println("Le room ID : " + roomId);

				//String price = request.getParameter(productId.);
				int roomQuantity = Integer.parseInt(request.getParameter("quantity"));
				out.println("Quantity : " + roomQuantity);


				Double total = Double.parseDouble(request.getParameter("total"));
				out.println("Ici TOTAL: " + total );
				if (roomQuantity <= 0) {
					roomQuantity = 1;
				}
				Order orderModel = new Order();
				orderModel.setRoomId(Integer.parseInt(roomId));
				orderModel.setUid(auth.getIduser());
				orderModel.setQuantity(roomQuantity);
				orderModel.setDate(formatter.format(date));
				orderModel.setTotal(total);
				
				
				
				OrderDAO orderDao = new OrderDAO(DbCon.getConnection());
				boolean result = orderDao.insertOrder(orderModel);
				if(result) {
					//ArrayList<Cart>cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
					response.sendRedirect("orders.jsp");
				} else {
					out.println("Order failed");
				}
				
				}else {
					response.sendRedirect("login.jsp");
				}
		
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
