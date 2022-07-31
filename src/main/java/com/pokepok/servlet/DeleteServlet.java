package com.pokepok.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.pokepok.connection.DbCon;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");
		int deletebutton = JOptionPane.showConfirmDialog(null, "Etes vous sur de vouloir supprimer cet article?");
		response.setContentType("text/html;charset=UTF-8");

		try (PrintWriter out = response.getWriter()) {
			// out.print("modified product");
			if (deletebutton == JOptionPane.YES_OPTION) {
				if (id != null) {
					Connection con = DbCon.getConnection();
					Statement st = con.createStatement();
					st.execute("DELETE FROM produits where IDPRODUIT='" + id + "'");

					System.out.print("Produit : supprimé !");
					response.sendRedirect("admin/adminHome.jsp?msg=done");
				}
			} else if (deletebutton == JOptionPane.NO_OPTION) {
				response.sendRedirect("admin/adminHome.jsp?msg=wrong");
			}
		} catch (Exception e) {
			System.out.print("le produit n'a pas été supprimé !");
			System.out.println(e.getMessage());
			response.sendRedirect("admin/adminHome.jsp?msg=wrong");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("post");
		doGet(request, response);
	}

}
