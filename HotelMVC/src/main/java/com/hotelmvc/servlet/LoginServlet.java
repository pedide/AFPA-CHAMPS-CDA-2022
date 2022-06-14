package com.hotelmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hotelmvc.connection.DbCon;
import com.hotelmvc.dao.UserDAO;
import com.hotelmvc.model.EncryptionPassword;
import com.hotelmvc.model.User;

@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");

		try (PrintWriter out = response.getWriter()) {
			String email = request.getParameter("login-mail");
			String password = request.getParameter("login-password");
			String passwordSHA1 = EncryptionPassword.getSHA1(password);
			UserDAO udao = new UserDAO(DbCon.getConnection());
			User user = udao.userLogin(email, passwordSHA1);

			if (user != null) {

				if (user.getAuthorization().equals("administrateur")) {
					request.getSession().setAttribute("auth", user);
					session.setAttribute("email", email);
					session.setAttribute("email", email);

					response.sendRedirect("admin/admin-home.jsp");
					// response.sendRedirect("index.jsp");
					System.out.println("ADMIN LOGIN");
					System.out.println("ADMIN User ID = [ " + user.getIduser() + " ], username = [ "
							+ user.getUsername() + " ] | from LoginServlet.jsp ligne54");

				} else {
					request.getSession().setAttribute("auth", user);
					response.sendRedirect("home.jsp");
					session.setAttribute("email", email);

					System.out.println("CLIENT LOGIN");
					System.out.println("CLIENT User ID = [ " + user.getIduser() + " ], username = [ "
							+ user.getUsername() + " ] | from LoginServlet.jsp ligne57");

				}

			} else {
				response.sendRedirect("login.jsp??msg=wrongPasswordOrEmail");
				System.err.print("User: NULL | Email = [ " + email + " ] and/or password = [ " + password
						+ " ] are WRONG | from LoginServlet.jsp ligne65");
				System.out.println(" END ERROR");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
	}

}
