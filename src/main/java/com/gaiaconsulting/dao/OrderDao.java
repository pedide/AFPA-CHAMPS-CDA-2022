package com.gaiaconsulting.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gaiaconsulting.model.Order;
import com.gaiaconsulting.model.Products;

public class OrderDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	
	public OrderDao(Connection con) {
		super();
		this.con = con;
	}
public boolean insertOrder(Order model) {
	boolean result = false;
	try { 
		query = "insert into orders(idProduit,idUsers,quantity,dateOrders,price,total,email)"+"value(?,?,?,?,?,?,?)";
		pst = this.con.prepareStatement(query);
		pst.setInt(1, model.getId());
		pst.setInt(3, model.getUserId());
		pst.setInt(4, model.getQuantity());
		pst.setString(5, model.getDate());
		pst.setDouble(6, model.getPrice());
		pst.setDouble(7, model.getTotal());
		pst.setString(17, model.getEmail());
		pst.executeUpdate();
		result = true;
		System.out.println("Order inserted !");
	}catch(Exception e) {
		System.out.println(e.getMessage());
	}
	
	return result;
}

public List<Order> userOrders(int id){
	List<Order> list = new ArrayList<>();
	try {
		query = "select * from orders where idUsers=? order by orders.idOrders desc"; //order by = mettre en ordre, desc = descendant
		pst = this.con.prepareStatement(query); //prepare la requete
		pst.setInt(1, id); //recupere l'id
		rs = pst.executeQuery(); //resultat lors de l'execution de la requ�te
		while(rs.next()) { //Je parcours le r�sultat(de la table) de notre prepareStatement 
			Order order = new Order();
			ProductsDao productDao = new ProductsDao(this.con);
			int pId = rs.getInt("idProduit");
			
			 Products product = productDao.getSingleProduct(pId); 
			
			order.setOrderId(rs.getInt("idOrders"));
			order.setId(pId);
			order.setName(product.getName());
			order.setCategory(product.getCategory());
			order.setPrice(product.getPrice());
			order.setQuantity(rs.getInt("quantity"));
			order.setDate(rs.getString("dateOrders"));
			
			list.add(order);
		} 
	}
	catch(Exception e) {
		e.printStackTrace();
		System.out.println(e.getMessage());
	}
	return list;
	
}
public void cancelOrder(int id) {
try {
	query = "delete from orders where idOrders=?";
	pst = this.con.prepareStatement(query);
	pst.setInt(1, id);
	pst.execute();
	
}catch(SQLException e){
	e.printStackTrace();
	System.out.println(e.getMessage());
}	
}


}
