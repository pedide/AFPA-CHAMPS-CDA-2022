package com.ab_motors.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import com.ab_motors.model.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/add-to-cart-servlet")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            ArrayList<cart> cartlist = new ArrayList<cart>();
            int id = Integer.parseInt(request.getParameter("idproducts"));

            cart cm = new cart();
            cm.setIDPROD(id);
            cm.setQUANTITY(1);
            HttpSession session = request.getSession();
            ArrayList<cart> cart_list = (ArrayList<cart>) session.getAttribute("cart-list");

            if (cart_list == null) {
                cartlist.add(cm);
                session.setAttribute("cart-list", cartlist);
                //out.println("Session créee et ajouté à la liste");
                response.sendRedirect("card.jsp");
            }else {
                cartlist =cart_list;
                boolean exist=false;

                for (cart c: cart_list) {
                	
                    if(c.getIDPROD()==id)
                    {
                        c.setQUANTITY(c.getQUANTITY()+1);
                        exist=true;
                        response.sendRedirect("card.jsp");
                    }
                    if(!exist) {
                        cartlist.add(cm);
                       // out.print("Produit ajouté");
                        //out.println("<h3 style='color:crimon ; text-align:center'>aller au panier<a href='card.jsp'>ici.</a></h3>");
                        response.sendRedirect("card.jsp");
                    }
                    //for (cart ca : cart_list) {
                      //  out.print(ca.getIDPROD());

                    //}
                }
            }
        }catch(Exception e) {
        	e.printStackTrace();
        }
    }
}
