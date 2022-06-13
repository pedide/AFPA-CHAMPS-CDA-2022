package com.xprodmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
import com.stripe.exception.StripeException;
import com.stripe.model.WebhookEndpoint;
import com.stripe.param.WebhookEndpointCreateParams;
import com.xprodmvc.connection.DbCon;
import com.xprodmvc.dao.*;
import com.xprodmvc.model.Cart;
import com.xprodmvc.model.Order;
import com.xprodmvc.model.Users;

@WebServlet("/cart-check-out")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CheckOutServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			PrintWriter out = response.getWriter();
			System.out.println("tes bien dans la servlet add to check out servlet");
			out.println("bienvenue servlet add to chek out servlet");
			response.setContentType("text/html;charset=UTF-8");
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			ProductsDao pDao = new ProductsDao(DbCon.getConnection());
			// STRIPE API
			
			Stripe.apiKey="sk_test_51KsMM1G7jkpgEBMIVSPgCEspiOUSJAZj3Pm7FJ0rVlvGT6yTW5Xs4tlK4izdiOI8PLtclWNGG5OJnQRB65IQUJah00Nl0mToOK";
			
			HttpSession session = request.getSession();
			ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
			Users auth = (Users) request.getSession().getAttribute("auth");

			if (cart_list != null && auth != null) {
				for (Cart c : cart_list) {
					Order order = new Order();
					order.setIdProd(c.getIdProd());
					order.setIdUser(auth.getIdUser());
					order.setQuantity(c.getQuantite());
					order.setDate(formatter.format(date));
					order.setTotal(pDao.getTotalCartPrice(cart_list));
					order.setEmail(auth.getEmail());
					order.setPrice(pDao.getTotalCartPrice(cart_list));
					OrderDao oDao = new OrderDao(DbCon.getConnection());
					boolean result = oDao.insertOrder(order);

					if (!result)break;

				}
				cart_list.clear();
				response.sendRedirect("order.jsp");
			} else {
				if (auth == null) {
					response.sendRedirect("login.jsp");
				}
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

		} catch (SQLException | ClassNotFoundException |StripeException e) {
			e.printStackTrace();
		} 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
