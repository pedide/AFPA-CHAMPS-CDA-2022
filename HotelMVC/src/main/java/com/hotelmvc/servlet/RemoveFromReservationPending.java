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
import com.hotelmvc.dao.ReservationDAO;


@WebServlet("/remove-from-reservation")
public class RemoveFromReservationPending extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.print("Delete Servlet");
		

		try (PrintWriter out = response.getWriter()) {

			String resaId = request.getParameter("id");

			if (resaId != null) {
				
				ReservationDAO rDao = new ReservationDAO(DbCon.getConnection());
				rDao.deleteReservationPending(Integer.parseInt(resaId));
		
				response.sendRedirect("check-out.jsp?msg=productRemoved");

			} else {
				response.sendRedirect("check-out.jsp?msg=ErrorProductNotRemoved");
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
