package com.xprodmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user-register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try (PrintWriter out = response.getWriter()) {
			String nom = request.getParameter("nom");
		
		String email = request.getParameter("email");
		String numerotel = request.getParameter("numerotel");
		String motdepasse = request.getParameter("mot_de_passe");
		String questionsecrete = request.getParameter("questionsecrete");
		String reponsesecrete = request.getParameter("reponsesecrete");
		String authorizations = request.getParameter("authorizations");
		String codepostal ="";
		String ville = "";
		String adresse = "";
		String region = "";
		String pays = "";
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
