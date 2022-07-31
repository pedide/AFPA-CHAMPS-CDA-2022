package com.diablement.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.diablement.rest.dao.ProduitsDao;
import com.diablement.rest.entity.Produits;

@RestController
@RequestMapping
@CrossOrigin("*") //autoriser les url provenant du serveur sinon nagigateur va bloquer 
public class ProduitsController {
	
	@Autowired //injection de dependance
	ProduitsDao produitsDao;
	
	//recuperer un produit
	@GetMapping("/produits")
	public List<Produits> getAllProduits(@Validated @RequestBody(required=false) Produits produits){
		return produitsDao.getProduit();
	}
	
	//enregister un produit
	@PostMapping("/produits")
	public Produits createProduit(@Validated @RequestBody(required=false) Produits produits){
		return produitsDao.saveProduit(produits);
	}
	
	@GetMapping("/produits/{idProduit}")
	public ResponseEntity findProduitById(@PathVariable(name="idProduit") Long idProduit){
		if(idProduit==null) {
			return ResponseEntity.badRequest().body("On ne trouve pas de produit avec id null");
		}
		Produits produit = produitsDao.getProduitById(idProduit);
		
		if(produit == null) {
			return ResponseEntity.notFound().build();//pas trouvé ce produit
		}
		return ResponseEntity.ok().body(produit);
	}
	
	//mettre à jour mon produit
	@PutMapping("/produits")
	public Produits updateProduit(@Validated @RequestBody(required=false) Produits produits) {
		return produitsDao.saveProduit(produits);
	}
	
	@DeleteMapping("/produits/{id}")
	public ResponseEntity<Produits> deleteProduits(@Validated @PathVariable(name="id") Long idProduit){
		Produits produit = produitsDao.getProduitById(idProduit);
		
		if(produit == null) {
			return ResponseEntity.notFound().build();
		}
		produitsDao.deleteProduit(produit);//on supprime le produit
		return ResponseEntity.ok().body(produit);
	}
	
}
