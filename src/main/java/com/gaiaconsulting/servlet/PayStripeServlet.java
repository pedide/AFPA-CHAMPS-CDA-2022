package com.gaiaconsulting.servlet;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.WebhookEndpoint;
import com.stripe.param.WebhookEndpointCreateParams;

/**
 * Servlet implementation class PayStripeServlet
 */
@WebServlet("/pay-stripe")
public class PayStripeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Stripe.apiKey="sk_test_51KsMbGJzzGmAJd7yzwUBSm0xjuwQ3IE0hbfFtlQ8nZojWuVhRUVP6UlJuDQOtLFFznV9Qimv9yx478wNOcvdiKBt00Pj1fRXDU";
		WebhookEndpointCreateParams params =
				  WebhookEndpointCreateParams.builder()
				    .setUrl("https://example.com/my/webhook/endpoint")
				    .addAllEnabledEvent(Arrays.asList(
				      WebhookEndpointCreateParams.EnabledEvent.PAYMENT_INTENT__PAYMENT_FAILED,
				      WebhookEndpointCreateParams.EnabledEvent.PAYMENT_INTENT__SUCCEEDED))
				    .setApiVersion(WebhookEndpointCreateParams.ApiVersion.VERSION_2019_03_14)
				    .build();

				try {
					WebhookEndpoint.create(params);
				} catch (StripeException e) {
					
					e.printStackTrace();
				}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
