package com.bagboutique.rest.controller;

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

import com.bagboutique.rest.entity.ProduitAppro;
import com.bagboutique.rest.service.impl.ProduitApproServiceImpl;



@RestController
@RequestMapping
@CrossOrigin//accepter tous les url

public class ProduitApproController {
	
	@Autowired
	ProduitApproServiceImpl produitApproServiceImpl;
	
	@PostMapping("/produit-Appro")
	public ProduitAppro createProduitAppro(@Validated @RequestBody(required=false)ProduitAppro produitAppro) {
	return	produitApproServiceImpl.saveProduitAppro(produitAppro);
		
	}

	@GetMapping ("/produit-Appro")
	public List<ProduitAppro> getAllProduitAppro(@Validated @RequestBody(required=false)ProduitAppro produitAppro) {
		return	produitApproServiceImpl.getAllProduitAppro();
	}
	
	@PutMapping ("/produit-Appro/{idProduitAppro}")
	public ProduitAppro updateProduitAppro(@Validated @RequestBody(required=false)ProduitAppro produitAppro) {
		return	produitApproServiceImpl.saveProduitAppro(produitAppro);
	}
	
	
	@GetMapping ("/produit-Appro/{idProduitAppro}")
	public ResponseEntity findProduitAppro( @PathVariable(name="idProduitAppro")Long idProduitAppro) {
		
		if(idProduitAppro==null) {
			return ResponseEntity.badRequest().body("cannot retrieve ProduitFab with null id!");
		}
			ProduitAppro produitAppro = produitApproServiceImpl.getProduitApproById(idProduitAppro);
			if(produitAppro==null) {
				return ResponseEntity.notFound().build();
			}
			return ResponseEntity.ok().body(produitAppro);
		}
	
		
		
	
	@DeleteMapping ("/produit-Appro/{id}")
	public ResponseEntity deleteProduitAppro( @PathVariable(name="id")Long idProduitAppro) {
		
			ProduitAppro produitAppro = produitApproServiceImpl.getProduitApproById(idProduitAppro);
			if(produitAppro==null) {
				return ResponseEntity.notFound().build();
			}
			produitApproServiceImpl.deleteProduitAppro(produitAppro);
			
			return ResponseEntity.ok().body(produitAppro);
		}
		
}


