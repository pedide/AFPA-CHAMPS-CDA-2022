package com.xprodmvc.servlet;

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

import com.stripe.Stripe;
import com.stripe.model.WebhookEndpoint;
import com.stripe.param.WebhookEndpointCreateParams;
import com.xprodmvc.connection.DbCon;
import com.xprodmvc.dao.OrderDao;
import com.xprodmvc.dao.ProductsDao;
import com.xprodmvc.model.Cart;
import com.xprodmvc.model.Order;
import com.xprodmvc.model.User;

@WebServlet("/cart-check-out")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");

		try (PrintWriter out = response.getWriter()) {
			// out.println("Je suis dans checkout servlet.");

			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date(); // ça va donner la date du jour

			HttpSession session = request.getSession();
			ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
			User auth = (User) request.getSession().getAttribute("auth");
			
			//stripe key
			Stripe.apiKey = "sk_test_51KsMNVLKYS2bssV2Ib2gyGxuoKMK2iqaKXh2U1sgcnyRXAUhnYXrVYrMv5n4IRjtpPIbmHMcvDauWUAR1lW2gSav00672a5m3o";
			
			
			ProductsDao pDao = new ProductsDao(DbCon.getConnection());
			 			
			if (cart_list != null && auth != null) {
				for (Cart c : cart_list) {
					
					Order order = new Order();				
					order.setId(c.getId());
					order.setUid(auth.getId());// on veut id de l'utilisateur (auth)
					order.setQuantity(c.getQuantity());
					order.setDate(formatter.format(date));
					
			
					order.setPrice(pDao.getTotalCartPrice(cart_list));
					order.setTotal(pDao.getTotalCartPrice(cart_list));
					order.setEmail(auth.getEmail());
					
					OrderDao oDao = new OrderDao(DbCon.getConnection());
					boolean result = oDao.insertOrder(order);

					if (!result)
						break;

				}
				cart_list.clear();
				response.sendRedirect("orders.jsp");
				
			} else {
				
				if (auth == null) {
					//response.sendRedirect("addressPaymentForOrder.jsp");test à remettre 
					response.sendRedirect("login.jsp");
					
					
					//stripe
					WebhookEndpointCreateParams params =
							  WebhookEndpointCreateParams.builder()
							    .setUrl("https://example.com/my/webhook/endpoint")
							    .addAllEnabledEvent(Arrays.asList(
							      WebhookEndpointCreateParams.EnabledEvent.PAYMENT_INTENT__PAYMENT_FAILED,
							      WebhookEndpointCreateParams.EnabledEvent.PAYMENT_INTENT__SUCCEEDED))
							    .setApiVersion(WebhookEndpointCreateParams.ApiVersion.VERSION_2019_03_14)
							    .build();
	
					WebhookEndpoint.create(params);
				}	
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
