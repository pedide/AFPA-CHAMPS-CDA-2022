package com.gaiaconsulting.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaiaconsulting.connection.DbCon;
import com.gaiaconsulting.dao.OrderDao;
import com.gaiaconsulting.dao.ProductsDao;
import com.gaiaconsulting.model.Cart;
import com.gaiaconsulting.model.Order;
import com.gaiaconsulting.model.User;
import com.stripe.model.WebhookEndpoint;
import com.stripe.param.WebhookEndpointCreateParams;


@WebServlet("/cart-check-out")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out = response.getWriter()){
			//out.println("From the check out servlet");
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			
			Date date = new Date();
			
			HttpSession session = request.getSession();
			ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
			User auth = (User) request.getSession().getAttribute("auth");
			ProductsDao pDao = new ProductsDao(DbCon.getConnection());
			
			 double total = pDao.getTotalCartPrice(cart_list);
			 request.setAttribute("total", total);
			
			if(cart_list != null && auth !=null) {
				System.out.println("je suis dans mon if checkoutservlet");
				for(Cart c: cart_list) {
			
					Order order = new Order(); //je cr�� mon achat
					order.setId(c.getId());
					order.setUserId(auth.getId());
					order.setQuantity(c.getQuantity());
					order.setDate(formatter.format(date));
					order.setPrice(pDao.getTotalCartPrice(cart_list));
					order.setTotal(total);
					order.setEmail(auth.getEmail());
					System.out.println("je suis dans mon for checkoutservlet");
					
					OrderDao oDao = new OrderDao(DbCon.getConnection());
					boolean result = oDao.insertOrder(order);
					
					if(! result) break;
					System.out.println("je suis dans mon break dans checkoutservlet");

				}
				cart_list.clear();
				response.sendRedirect("orders.jsp");
				
			}else {
				if(auth == null) {
					response.sendRedirect("login.jsp");
					
				}
				//stripe
				WebhookEndpointCreateParams params = WebhookEndpointCreateParams.builder()
						.setUrl("https://example.com/webhook/enpoint")
						.addAllEnabledEvent(
								Arrays.asList(WebhookEndpointCreateParams.EnabledEvent.PAYMENT_INTENT__PAYMENT_FAILED,
										WebhookEndpointCreateParams.EnabledEvent.PAYMENT_INTENT__SUCCEEDED))
								.setApiVersion(WebhookEndpointCreateParams.ApiVersion.VERSION_2019_03_14).build();
								
				WebhookEndpoint.create(params);
				
				response.sendRedirect("cart.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
