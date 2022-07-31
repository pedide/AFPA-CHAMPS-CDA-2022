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

import com.diablement.rest.entity.ProduitAppro;
import com.diablement.rest.service.impl.ProduitApproServiceImpl;

@RestController //genere des API rest JSON
@RequestMapping
@CrossOrigin("*")
public class ProduitApproController {
	
	@Autowired
	ProduitApproServiceImpl produitApproServiceImpl;
	
	@PostMapping("/produit-appro")
	public ProduitAppro createProduitAppro(@Validated 
			@RequestBody(required=false)ProduitAppro produitAppro) {
		
		return produitApproServiceImpl.saveProduitAppro(produitAppro);
	}
	
	@GetMapping("/produit-appro")
	public List<ProduitAppro> getAllProduitAppro(@Validated 
			@RequestBody(required=false)ProduitAppro produitAppro) {
		
		return produitApproServiceImpl.getAllProduitAppro();
	}
	
	@PutMapping("/produit-appro/{idProduitAppro}")//mise à jour
	public ProduitAppro updateProduitAppro(@Validated 
			@RequestBody(required=false)ProduitAppro produitAppro) {
		
		return produitApproServiceImpl.saveProduitAppro(produitAppro);
	}
	
	//recupere un produitAppro en fonction de id
	@GetMapping("/produit-appro/{idProduitAppro}")
	public ResponseEntity findProduitApproById(@PathVariable(name="idProduitAppro")
	Long idProduitAppro) {
		if(idProduitAppro == null) {
			return ResponseEntity.badRequest().body("Cannot retrieve ProduitAppro with null Id!");
		}
		ProduitAppro produitAppro = produitApproServiceImpl.getProduitApproById(idProduitAppro);
		if(produitAppro == null) {
			return ResponseEntity.notFound().build();
		}
		
		return ResponseEntity.ok().body(produitAppro);
	}
	
	@DeleteMapping("/produit-appro/{id}")
	public ResponseEntity deleteProduitAppro(@PathVariable(name="id")
	Long idProduitAppro) {
	
		ProduitAppro produitAppro = produitApproServiceImpl.getProduitApproById(idProduitAppro);
		if(produitAppro == null) {
			return ResponseEntity.notFound().build();
		}
		produitApproServiceImpl.deleteProduitAppro(produitAppro);
		return ResponseEntity.ok().body(produitAppro);
	}
		
}
