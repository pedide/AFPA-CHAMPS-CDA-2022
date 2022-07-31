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
@Table(name="orderItem")
@Inheritance(strategy=InheritanceType.TABLE_PER_CLASS)

public class OrderItem {
	
			@Id
			@GeneratedValue(strategy=GenerationType.AUTO)
			@Column(name="id")
			private Long id;
			
			@Column(name="idOrder")
			private Long idOrder;
			
			@Column(name="idProduct")
			private Long idProduct;
			
			@Column(name="qte")
			private String qte;

			public OrderItem() {
				super();
			}

			public OrderItem(Long id, Long idOrder, Long idProduct, String qte) {
				super();
				this.id = id;
				this.idOrder = idOrder;
				this.idProduct = idProduct;
				this.qte = qte;
			}

			public Long getId() {
				return id;
			}

			public void setId(Long id) {
				this.id = id;
			}

			public Long getIdOrder() {
				return idOrder;
			}

			public void setIdOrder(Long idOrder) {
				this.idOrder = idOrder;
			}

			public Long getIdProduct() {
				return idProduct;
			}

			public void setIdProduct(Long idProduct) {
				this.idProduct = idProduct;
			}

			public String getQte() {
				return qte;
			}

			public void setQte(String qte) {
				this.qte = qte;
			}
	
			

}
