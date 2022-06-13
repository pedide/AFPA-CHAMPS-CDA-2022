package com.gaiaconsulting.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gaiaconsulting.connection.DbCon;
import com.gaiaconsulting.dao.UserDao;
import com.gaiaconsulting.model.Cart;
import com.gaiaconsulting.model.DataEncryption;
import com.gaiaconsulting.model.User;


@WebServlet("/log-out")
public class LogoutServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try (PrintWriter out = response.getWriter()) {

			if (request.getSession().getAttribute("auth") != null) {
			
					request.getSession().removeAttribute("auth");

				response.sendRedirect("login.jsp");
				
				} else {
				response.sendRedirect("index.jsp");
			
			}
		} catch (Exception e) {
		
			e.printStackTrace();
		
		
	}

	}
		}
