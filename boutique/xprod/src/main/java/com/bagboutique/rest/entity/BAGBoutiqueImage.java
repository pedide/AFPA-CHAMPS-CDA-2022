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
@Table(name="BAGBoutiqueImage")
@Inheritance(strategy=InheritanceType.TABLE_PER_CLASS)

public class BAGBoutiqueImage {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID")
	private Long id;
	
	@Column(name="DESCRIPTIF")
	private String descriptif;
	
	@Column(name="URL")
	private String url;

	public BAGBoutiqueImage() {
		super();
	}
	

	public BAGBoutiqueImage(String descriptif, String url) {
		super();
		this.descriptif = descriptif;
		this.url = url;
	}


	public BAGBoutiqueImage(Long id, String descriptif, String url) {
		super();
		this.id = id;
		this.descriptif = descriptif;
		this.url = url;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescriptif() {
		return descriptif;
	}

	public void setDescriptif(String descriptif) {
		this.descriptif = descriptif;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	

}
