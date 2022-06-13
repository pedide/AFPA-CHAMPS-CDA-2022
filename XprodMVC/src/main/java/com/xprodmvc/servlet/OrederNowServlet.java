package com.xprodmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.xprodmvc.connection.DBCon;
import com.xprodmvc.dao.OrderDao;
import com.xprodmvc.dao.ProductDao;
import com.xprodmvc.model.Cart;
import com.xprodmvc.model.Order;
import com.xprodmvc.model.User;

/**
 * Servlet implementation class OrederNowServler
 */
@WebServlet("/oreder-now")
public class OrederNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out = response.getWriter()){
			
		    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();//ça va donner la date du jour
			
			
			HttpSession session= request.getSession();
			ArrayList<Cart> cart_list =(ArrayList<Cart>) session.getAttribute("cart-list");
			List<Cart> cartProduct = null;

			if(cart_list !=null){
				Cart cart = new Cart();
				//int product_id= cart.getId();
				ProductDao pDao= new ProductDao(DBCon.getConnection());
				cartProduct = pDao.getCartProducts(cart_list);
				String email=request.getParameter("email");
			   double total = pDao.getTotalCartPrice(cart_list);
			  // Cart tuto =pDao.addToCartTotal(product_id,"email");
			  
			   request.setAttribute("total",total);
			  
			  
				request.setAttribute("cart_list", cart_list);
		//out.println("Acheter fonctionne");
		
		
		User auth = (User)request.getSession().getAttribute("auth");
	
		if(auth != null) {
		
			
			String productId = request.getParameter("id");
			
			int productQuantite= Integer.parseInt(request.getParameter("quantite"));
			
		
			if (productQuantite <=0) {
				productQuantite =1;
			}
			Order orderModel = new Order();//on cree un achat
			
			//on va cree une instance d'achat.il faut id
			orderModel.setId(Integer.parseInt(productId));
			orderModel.setUid(auth.getId());
			orderModel.setQuantite(productQuantite);
			orderModel.setDate(formatter.format(date));
			//orderModel.setTotal(pDao.getTotalCartPrice(cart_list));
			//orderModel.setEmail(email);
			
			//on va rajouter notre objet dao
			OrderDao orderDao=new OrderDao(DBCon.getConnection());			
			boolean result = orderDao.insertOrder(orderModel);
			
			if(result){//une fois que j aurai acheté mon article je retire de ma carde liste li produit acheter
				
				//ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
		      if (cart_list!=null) {
		    	  for(Cart c:cart_list) {
		    		  if(c.getId()==Integer.parseInt(productId)) {
		    			cart_list.remove(cart_list.indexOf(c));  
		    			break;
		    	  }
		      }
		 
		
			  }
		      
				
				response.sendRedirect("orders.jsp");
				
			}else {
				
				out.println("la commande a echouée !");
			}
			
			
			}else {
				System.out.print("je ne suis pas rentrer hadjer");
				response.sendRedirect("login.jsp");
				
			
		}
		
			}}catch (ClassNotFoundException e) {
		e.printStackTrace();
		
		} catch (SQLException e) {
		e.printStackTrace();
	} 
	
		}

		
		  protected void doPost(HttpServletRequest request, HttpServletResponse
		  response) throws ServletException, IOException {
		  
		  doGet(request, response); }
		 
}
