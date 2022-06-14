package com.hotelmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotelmvc.connection.DbCon;
import com.hotelmvc.dao.MessageDAO;
import com.hotelmvc.model.User;


@WebServlet("/admin-send-chat-message")
public class AdminSendChatMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Vous êtes dans la servlet Send Message users");
		response.setContentType("text/html;charset=UTF-8");		
		try (PrintWriter out = response.getWriter()) {
			
			User auth = (User) request.getSession().getAttribute("auth");
			int userId = auth.getIduser();
			
			String message = request.getParameter("message");
			String client = request.getParameter("idClient");

			String date = "2022/04/26";
			int idClient = Integer.parseInt(client);
			System.out.println("User sender ID" +idClient);

			MessageDAO udao = new MessageDAO(DbCon.getConnection());
			User user = udao.clientSendChatMessage(message, date, userId, idClient);

			System.out.print("User : " + message + userId + user + " registered ! ");
			response.sendRedirect("admin/inbox-chat.jsp?msg=valid");
		} catch (ClassNotFoundException | SQLException e) {
			System.out.print("No user registered ! ");
			response.sendRedirect("admin/inbox-chat.jsp.msg=invalid");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
