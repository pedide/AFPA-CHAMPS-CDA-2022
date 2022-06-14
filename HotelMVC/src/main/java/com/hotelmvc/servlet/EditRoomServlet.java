package com.hotelmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotelmvc.connection.DbCon;


@WebServlet("/edit-room")
public class EditRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String category = request.getParameter("category");
		//Double price = Double.parseDouble(request.getParameter("price"));
		String price = request.getParameter("price");
		String image = request.getParameter("image");
		String active = request.getParameter("active");
		try(PrintWriter out = response.getWriter()){
			Connection con = DbCon.getConnection();
			Statement st = con.createStatement();
			st.executeUpdate("UPDATE room SET roomName='"+name+"', roomCategory='"+category+"', roomPrice='"+price+"',roomImage='"+image+"', roomIsActive='"+active+"' WHERE roomId='"+id+"'");

			if(active.equals("No")) {
				st.executeUpdate("DELETE FROM cart WHERE roomId='"+id+"' and address is NULL");
				response.sendRedirect("admin/edit-room.jsp?msg=done");
				
			}
			response.sendRedirect("admin/edit-room.jsp?msg=done");

		}	catch (Exception e) {
			e.printStackTrace();
			
			System.out.println("No room updated!");
			response.sendRedirect("admin/edit-room.jsp?msg=wrong");
		} 	
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
