package com.xprodmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xprodmvc.connection.DbCon;
import com.xprodmvc.dao.UsersDao;

@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String email = request.getParameter("email");
			String numerotel = request.getParameter("numerotel");
			String questionsecrete = request.getParameter("questionsecrete");
			String reponsesecrete = request.getParameter("reponsesecrete");
			String newmot_de_passe = request.getParameter("newmot_de_passe");
			
			UsersDao udao = new UsersDao(DbCon.getConnection());
			udao.userForgotPassword(email,numerotel,questionsecrete,reponsesecrete,newmot_de_passe);
			
			System.out.print("User:"+email+" :mot de passe change!");
			response.sendRedirect("forgotPassword.jsp?msg=done");
			
		} catch (ClassNotFoundException | SQLException e) {
			System.out.print("Mot de passe pas changé");
			response.sendRedirect("forgotPassword.jsp?msg=undone");

		}
		}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
