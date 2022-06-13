package com.xprodmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xprodmvc.connection.DBCon;
import com.xprodmvc.dao.CartItemDao;
import com.xprodmvc.model.Cart;
import com.xprodmvc.model.Shoppingsession;
import com.xprodmvc.model.CartItem;


 
@WebServlet("/quantite-inc-dec")
public class QuantiteIncDecServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

  
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		//PrintWriter out = response.getWriter();
		//out.println("inc dec servlet");
		
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()){
			String action = request.getParameter("action");
			int id =Integer.parseInt(request.getParameter("id"));
			int qte = Integer.parseInt(request.getParameter("qte"));
			Shoppingsession shopS = (Shoppingsession) request.getSession().getAttribute("shoppingcard");
			ArrayList<Cart> cart_list=(ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			
			if(action !=null && id>=1) {
			
				if(action.equals("inc")) {
					
					CartItemDao cartdao = new CartItemDao(DBCon.getConnection());
					System.out.println(" Before update " + shopS.getId() + "    " + id + "   " + qte);
											
					cartdao.updatCartItem(shopS.getId(),id, qte);
					System.out.println(" after update");
					response.sendRedirect("card.jsp");
					/*
					 * for(Cart c : cart_list) {
					 * 
					 * if(c.getId()==id) { int quantite=c.getQuantite(); quantite++;
					 * c.setQuantite(quantite); response.sendRedirect("card.jsp");
					 * 
					 * }
					 * 
					 * }
					 */
				}
				
				if(action.equals("dec")) {
					
					CartItemDao cartdao = new CartItemDao(DBCon.getConnection());
					System.out.println(" Before update " + shopS.getId() + "    " + id + "   " + qte);
											
					cartdao.updat2CartItem(shopS.getId(),id, qte);
					System.out.println(" after update");
					
					 
					System.out.println("update in  CartItem successful !");
				
					
					
					response.sendRedirect("card.jsp");
					
/*					
 * 
					for(Cart  c : cart_list) {
						if(c.getId()==id  && c.getQuantite()>1) {
							int quantite=c.getQuantite();
							quantite--;
							c.setQuantite(quantite);
							break;
							*/
	
				}
				
			}else {
				response.sendRedirect("card.jsp");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
