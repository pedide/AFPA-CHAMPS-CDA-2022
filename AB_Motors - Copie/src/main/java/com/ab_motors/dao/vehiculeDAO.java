package com.ab_motors.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ab_motors.connection.dbCon;
import com.ab_motors.model.*;

public class vehiculeDAO {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	private Statement st;

	public vehiculeDAO(Connection con) {
		this.con = con;
	}
	
	public List<vehicule> getAllVehicule() {
		List<vehicule> vehicule = new ArrayList<vehicule>();
		try {
			query = "select * from vehicule";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();

			while (rs.next()) {
				vehicule row = new vehicule();
				row.setIDVEHICULE(rs.getInt("idvehicule"));
				row.setMODELE(rs.getString("modele"));
				row.setCATEGORIE(rs.getString("categorie"));
				row.setPRIX(rs.getDouble("prix"));
				row.setCARBURANT(rs.getString("carburant"));
				row.setKILOMETRAGE(rs.getInt("kilometrage"));
				row.setPUISSANCE(rs.getInt("puissance"));
				row.setBOITE(rs.getString("boite"));
				row.setANNEE(rs.getInt("annee"));
				row.setIMG1(rs.getString("img1"));
				row.setIMG2(rs.getString("img2"));
				row.setIMG3(rs.getString("img3"));

				vehicule.add(row);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vehicule;
	}

	public List<cartVehicule> getCardVehicule(ArrayList<cartVehicule> cardlistV) {
		List<cartVehicule> vehicule = new ArrayList<>();
		try {
			if (cardlistV.size() > 0) {

				for (cartVehicule item : cardlistV) {

					query = "select * from vehicule where idvehicule=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getIDVEHICULE());
					rs = pst.executeQuery();
					while (rs.next()) {

						cartVehicule row = new cartVehicule();
						row.setIDVEHICULE(rs.getInt("idvehicule"));
						row.setMODELE(rs.getString("modele"));
						row.setCATEGORIE(rs.getString("categorie"));
						row.setMARQUE(rs.getString("marque"));
						row.setPRIX(rs.getDouble("prix"));
						row.setCARBURANT(rs.getString("carburant"));
						row.setKILOMETRAGE(rs.getInt("kilometrage"));
						row.setPUISSANCE(rs.getInt("puissance"));
						row.setBOITE(rs.getString("boite"));
						row.setANNEE(rs.getInt("annee"));
						row.setIMG1(rs.getString("img1"));
						row.setIMG2(rs.getString("img2"));
						row.setIMG3(rs.getString("img3"));
						row.setQUANTITY(item.getQUANTITY());

						vehicule.add(row);
					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vehicule;
	}

	public double getTotalCartPrice(ArrayList<cartVehicule> cardlistV) {
		double sum = 0;

		try {
			if (cardlistV.size() > 0) {
				for (cartVehicule item : cardlistV) {
					query = "select prix from vehicule where idvehicule=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getIDVEHICULE());
					rs = pst.executeQuery();
					while (rs.next()) {
						sum += rs.getDouble("prix") * item.getQUANTITY();
					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sum;
	}

	public vehicule getSingleVehicule(int vID) {
		vehicule row = null;
		try {
			query ="select * from vehicule where idvehicule=?";
			
			pst = this.con.prepareStatement(query);
			pst.setInt(1, vID);
			ResultSet rs =pst.executeQuery();
			
			while(rs.next()) {
				row = new vehicule();
				row.setIDVEHICULE(rs.getInt("idvehicule"));
				row.setMODELE(rs.getString("modele"));
				row.setCATEGORIE(rs.getString("categorie"));
				row.setPRIX(rs.getDouble("prix"));
				row.setCARBURANT(rs.getString("carburant"));
				row.setKILOMETRAGE(rs.getInt("kilometrage"));
				row.setPUISSANCE(rs.getInt("puissance"));
				row.setBOITE(rs.getString("boite"));
				row.setANNEE(rs.getInt("annee"));
				row.setIMG1(rs.getString("img1"));
				row.setIMG2(rs.getString("img2"));
				row.setIMG3(rs.getString("img3"));
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return row;
	}

	public vehicule addvehicule(String mODELE, String cATEGORIE, String mARQUE, double pRIX, int kILOMETRAGE,
			int pUISSANCE, String cARBURANT, String bOITE, int aNNEE, String iMG1) {
		vehicule vehicule = null;
	    
	    try {
	    	query = "insert into products(modele,categorie,marque,prix,carburant,kilometrage,puissance,boite,annee,img1) values(?,?,?,?,?,?,?,?,?,?)";
	    	pst= this.con.prepareStatement(query);
	    	
	    	pst.setString(1, mODELE);
	    	pst.setString(2, cATEGORIE);
	    	pst.setString(4, mARQUE);
	    	pst.setDouble(3, pRIX);
	    	pst.setInt(5, kILOMETRAGE);
	    	pst.setInt(6, pUISSANCE);
	    	pst.setString(7, cARBURANT);
	    	pst.setString(8, bOITE);
	    	pst.setInt(9, aNNEE);
	    	pst.setString(10, iMG1);
	    	
	    	pst.executeUpdate();
	    	
	    
	    }catch(Exception e) {
	    	e.printStackTrace();
	    	System.out.println(e.getMessage());
	    }
		return vehicule;
	}
	
}