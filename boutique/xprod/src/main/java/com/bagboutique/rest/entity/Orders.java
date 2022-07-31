package com.bagboutique.rest.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;


@Entity
@Table(name="oroders")
@Inheritance(strategy=InheritanceType.TABLE_PER_CLASS)


public class Orders {

	
		@Id
		@GeneratedValue(strategy=GenerationType.AUTO)
		@Column(name="ID")
		private Long id;
		
		@Column(name="idClient")
		private Long idClient;
		
		@Column(name="total")
		private String total;
		
		@Column(name="adress")
		private String adress;
		
		@Column(name="ville")
		private String ville;
		
		@Column(name="mobilNumber")
		private String mobilNumber;
		
		@Column(name="pays")
		private String pays;
		
		@Column(name="deleveryDate")
		private String deleveryDate;
		
		@Column(name="dateCommande")
		private String dateCommande;

		public Orders() {
			super();
		}

		public Orders(Long id, Long idClient, String total, String adress, String ville, String mobilNumber,
				String pays, String deleveryDate, String dateCommande) {
			super();
			this.id = id;
			this.idClient = idClient;
			this.total = total;
			this.adress = adress;
			this.ville = ville;
			this.mobilNumber = mobilNumber;
			this.pays = pays;
			this.deleveryDate = deleveryDate;
			this.dateCommande = dateCommande;
		}

		public Orders(Long idClient, String total, String adress, String ville, String mobilNumber, String pays,
				String deleveryDate, String dateCommande) {
			super();
			this.idClient = idClient;
			this.total = total;
			this.adress = adress;
			this.ville = ville;
			this.mobilNumber = mobilNumber;
			this.pays = pays;
			this.deleveryDate = deleveryDate;
			this.dateCommande = dateCommande;
		}

		
		
		
		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public Long getIdClient() {
			return idClient;
		}

		public void setIdClient(Long idClient) {
			this.idClient = idClient;
		}

		public String getTotal() {
			return total;
		}

		public void setTotal(String total) {
			this.total = total;
		}

		public String getAdress() {
			return adress;
		}

		public void setAdress(String adress) {
			this.adress = adress;
		}

		public String getVille() {
			return ville;
		}

		public void setVille(String ville) {
			this.ville = ville;
		}

		public String getMobilNumber() {
			return mobilNumber;
		}

		public void setMobilNumber(String mobilNumber) {
			this.mobilNumber = mobilNumber;
		}

		public String getPays() {
			return pays;
		}

		public void setPays(String pays) {
			this.pays = pays;
		}

		public String getDeleveryDate() {
			return deleveryDate;
		}

		public void setDeleveryDate(String deleveryDate) {
			this.deleveryDate = deleveryDate;
		}

		public String getDateCommande() {
			return dateCommande;
		}

		public void setDateCommande(String dateCommande) {
			this.dateCommande = dateCommande;
		}

		@Override
		public String toString() {
			return "Orders [id=" + id + ", idClient=" + idClient + ", total=" + total + ", adress=" + adress
					+ ", ville=" + ville + ", mobilNumber=" + mobilNumber + ", pays=" + pays + ", deleveryDate="
					+ deleveryDate + ", dateCommande=" + dateCommande + "]";
		}
		
		
		

		
}

		
		
		
		
		
		



