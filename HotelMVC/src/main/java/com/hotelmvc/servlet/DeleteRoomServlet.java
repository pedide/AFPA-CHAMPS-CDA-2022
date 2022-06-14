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
import com.hotelmvc.dao.RoomDAO;


@WebServlet("/delete-room")
public class DeleteRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.print("Delete Servlet");
		

		try (PrintWriter out = response.getWriter()) {

			String productId = request.getParameter("id");

			if (productId != null) {
				
				RoomDAO productDao = new RoomDAO(DbCon.getConnection());
				productDao.deleteRoomADMIN(Integer.parseInt(productId));
		
				response.sendRedirect("admin/all-rooms-edit.jsp?msg=productDeleted");

			} else {
				response.sendRedirect("admin/all-rooms-edit.jsp?msg=ErrorProductNotDeleted");
			}

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
