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
@Table(name="cartItem")
@Inheritance(strategy=InheritanceType.TABLE_PER_CLASS)

public class CartItem {
	
		
			@Id
			@GeneratedValue(strategy=GenerationType.AUTO)
			@Column(name="idcart")
			private Long idcart;
			
			@Column(name="idShopping")
			private Long idShopping;
			
			@Column(name="idProduct")
			private String idProduct;
			
			@Column(name="qte")
			private String qte;
			
			@Column(name="created_at")
			private String created_at;
			
			@Column(name="modified_at")
			private String modified_at;

			public CartItem() {
				super();
			}

			public CartItem(Long idcart, Long idShopping, String idProduct, String qte, String created_at,
					String modified_at) {
				super();
				this.idcart = idcart;
				this.idShopping = idShopping;
				this.idProduct = idProduct;
				this.qte = qte;
				this.created_at = created_at;
				this.modified_at = modified_at;
			}

			public Long getIdcart() {
				return idcart;
			}

			public void setIdcart(Long idcart) {
				this.idcart = idcart;
			}

			public Long getIdShopping() {
				return idShopping;
			}

			public void setIdShopping(Long idShopping) {
				this.idShopping = idShopping;
			}

			public String getIdProduct() {
				return idProduct;
			}

			public void setIdProduct(String idProduct) {
				this.idProduct = idProduct;
			}

			public String getQte() {
				return qte;
			}

			public void setQte(String qte) {
				this.qte = qte;
			}

			public String getCreated_at() {
				return created_at;
			}

			public void setCreated_at(String created_at) {
				this.created_at = created_at;
			}

			public String getModified_at() {
				return modified_at;
			}

			public void setModified_at(String modified_at) {
				this.modified_at = modified_at;
			}
			


}
