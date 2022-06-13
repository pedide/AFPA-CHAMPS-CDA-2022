package com.pokepok.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.pokepok.connection.DbCon;
import com.pokepok.model.Cart;
import com.pokepok.model.Product;

public class ProductDao {
	private Connection con;
	private String query;
	private Statement st;
	private PreparedStatement pst; //
	private ResultSet rs; // pour stocker le résultat

	public ProductDao(Connection con) {

		this.con = con;
	}

	// Création d'une liste donc "Product" se met entre < >
	public List<Product> getAllProducts() {
		List<Product> products = new ArrayList<Product>();

		try {
			query = "select * from produits";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
			while (rs.next()) {
				// pour chaque ligne, créer un nouveau produit et récupere les données
				Product row = new Product();
				row.setId(rs.getInt("IDPRODUIT"));
				row.setName(rs.getString("DESIGNATION"));
				row.setCategorie(rs.getString("DESCRIPTIF"));
				row.setPrixU(rs.getDouble("PRIXUHT"));
				row.setPrix(rs.getDouble("PRIXUHT"));
				row.setImage(rs.getString("IMAGE"));
				// ajoute la liste de produit
				products.add(row);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// retourne les produits qui ont été récupérés
		return products;
	}

	public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
		// Création d'une liste de panier
		List<Cart> products = new ArrayList<>();
		try {
			if (cartList.size() > 0) {
				for (Cart item : cartList) {

					query = "select * from produits where IDPRODUIT=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs = pst.executeQuery();
					while (rs.next()) {
						Cart row = new Cart();
						row.setId(rs.getInt("IDPRODUIT"));
						row.setName(rs.getString("DESCRIPTIF"));
						row.setCategorie(rs.getString("REF"));
						row.setPrixU(rs.getDouble("PRIXUHT"));
						row.setPrix(rs.getDouble("PRIXUHT") * item.getQuantity());
						row.setQuantity(item.getQuantity());

						products.add(row);

					}
				}

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return products;
	}

	public double getTotalCartPrice(ArrayList<Cart> cartList) {
		double sum = 0;
		try {
			if (cartList.size() > 0) {
				for (Cart item : cartList) {
					query = "select PRIXUHT from produits where IDPRODUIT=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs = pst.executeQuery();
					while (rs.next()) {
						sum += rs.getDouble("PRIXUHT") * item.getQuantity();
					}

				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sum;
	}

	public int getTotalQteCart(ArrayList<Cart> cartList) {
		int qte = 1;
		try {
			if(cartList.size()>0) {
		
			for(Cart item : cartList) {
				query = "select * from produits where IDPRODUIT=?";
				pst = this.con.prepareStatement(query);
				pst.setInt(1, item.getId());
				rs = pst.executeQuery();
				while(rs.next()) {
					qte += item.getQuantity();
				}
					
			}
				
			}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return qte;
}

	public Product getSingleProduct(int pId) {
		Product row = null;
		try {
			query = "select * from produits where IDPRODUIT = ?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, pId);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				row = new Product();
				row.setId(rs.getInt("IDPRODUIT"));
				row.setName(rs.getString("DESIGNATION"));
				row.setCategorie(rs.getString("REF"));
				row.setPrixU(rs.getDouble("PRIXUHT"));
				row.setImage(rs.getString("IMAGE"));
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return row;
	}
	
	public Product addProduct(String name, String categorie, double prix, String image, String active) {
		Product product = null;
		
		try {
			query = "insert into produits (REF, DESIGNATION, DESCRIPTIF, PRIXUHT, IMAGE, active) values (?,?,?,?,?,?)";
			pst = this.con.prepareStatement(query);
			pst.setString(1, categorie);
			pst.setString(2, name);
			pst.setString(3, name);
			pst.setDouble(4, prix);
			pst.setString(5, image);
			pst.setString(6, active);
			
			pst.executeUpdate();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return product;
	}
	
		/*public Cart addToCartTotal(int produit_id, String email)  {
			
			 * Cart cart = null; int quantity = 1; double product_price=0; double
			 * product_total=0; double cart_total=0; int z=0;
			 * 
			 * try { con = DbCon.getConnection(); st = con.createStatement(); ResultSet
			 * rs_prod =
			 * st.executeQuery("select * from produits where IDPRODUIT = '"+produit_id+"'");
			 * while(rs_prod.next()) { product_price = rs_prod.getDouble(5); product_total =
			 * product_price; } ResultSet rs_order =
			 * st.executeQuery("select * from orders where idProduct = '"
			 * +produit_id+"' and email = '"+email+"' and adresse is NULL");
			 * while(rs_order.next()) { cart_total = rs_order.getDouble(7); cart_total =
			 * cart_total+product_total; quantity = rs_order.getInt(4); quantity +=1; z=1; }
			 * }catch(Exception e) { System.out.println(e); } if(z==1) { try {
			 * st.executeUpdate("update orders set total = '"+cart_total+"', quantity = '"
			 * +quantity+"' where idProduct = '"+produit_id+"' and email = '"
			 * +email+"' and adresse is NULL"); System.out.println("Mise à jour réussi" );
			 * }catch(SQLException e) { e.printStackTrace();
			 * System.out.println("Echec de mise à jour" ); } } if(z==0) { try {
			 * PreparedStatement pst = con.
			 * prepareStatement("insert into orders (idProduct, quantity, price, total, email) values (?,?,?,?,?)"
			 * ); pst.setInt(2, produit_id); pst.setInt(4, quantity); pst.setDouble(6,
			 * product_price); pst.setDouble(7, cart_total); pst.setString(18, email);
			 * pst.executeUpdate();
			 * 
			 * System.out.println("Insertion reussi" );
			 * 
			 * } catch (SQLException e) { e.printStackTrace();
			 * System.out.println("Echec d'insertion" ); } }
			
			return cart;
		} */
	}
