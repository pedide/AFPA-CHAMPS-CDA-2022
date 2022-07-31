package com.xprod.rest.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;

@Entity
@Table(name="XprodImage")
@Inheritance(strategy=InheritanceType.TABLE_PER_CLASS)
public class XprodImage {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID")
	private Long id;
	
	@Column(name="TITRE")
	private String titre;
	
	@Column(name="REF")
	private String ref;
	
	@Column(name="URL")
	private String url;

	public XprodImage() {
		super();
	}

	public XprodImage(Long id, String titre, String url) {
		super();
		this.id = id;
		this.titre = titre;
		this.url = url;
	}
	
	

	public XprodImage(Long id, String titre, String ref, String url) {
		super();
		this.id = id;
		this.titre = titre;
		this.ref = ref;
		this.url = url;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitre() {
		return titre;
	}

	public void setTitre(String titre) {
		this.titre = titre;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getRef() {
		return ref;
	}

	public void setRef(String ref) {
		this.ref = ref;
	}

	
	
}
