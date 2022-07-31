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

public class ShoppingS {
	
		
				@Id
				@GeneratedValue(strategy=GenerationType.AUTO)
				@Column(name="idpanier")
				private Long idpanier;
				
				@Column(name="iduser")
				private Long iduser;
				
				@Column(name="total")
				private Long total;
				
				@Column(name="created_at")
				private String created_at;
				
				@Column(name="modified_at")
				private String modified_at;

				public ShoppingS() {
					super();
				}

				public ShoppingS(Long idpanier, Long iduser, Long total, String created_at, String modified_at) {
					super();
					this.idpanier = idpanier;
					this.iduser = iduser;
					this.total = total;
					this.created_at = created_at;
					this.modified_at = modified_at;
				}

				public Long getIdpanier() {
					return idpanier;
				}

				public void setIdpanier(Long idpanier) {
					this.idpanier = idpanier;
				}

				public Long getIduser() {
					return iduser;
				}

				public void setIduser(Long iduser) {
					this.iduser = iduser;
				}

				public Long getTotal() {
					return total;
				}

				public void setTotal(Long total) {
					this.total = total;
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
