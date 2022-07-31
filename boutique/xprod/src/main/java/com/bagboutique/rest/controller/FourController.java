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

import com.bagboutique.rest.entity.Fournisseur;
import com.bagboutique.rest.service.impl.FournisseurImpl;


@RestController
@RequestMapping
@CrossOrigin ("*")//accepter tous les url


public class FourController {
	
	@Autowired
	FournisseurImpl fournisseurImpl;
	
	@PostMapping("/fournisseur")
	public Fournisseur createFournisseur(@Validated @RequestBody(required=false)Fournisseur fournisseur) {
	return	fournisseurImpl.saveFour(fournisseur);
		
	}

	@GetMapping ("/fournisseur/list")
	public List<Fournisseur> getAllFour(@Validated @RequestBody(required=false)Fournisseur fournisseur) {
		return	fournisseurImpl.getAllFour();
	}
	
	@PutMapping ("/fournisseur/{idFour}")
	public Fournisseur updateFour(@Validated @RequestBody(required=false)Fournisseur fournisseur) {
		return	fournisseurImpl.saveFour(fournisseur);
	}
	
	
	@GetMapping ("/fournisseur/{idFour}")
	public ResponseEntity findFour( @PathVariable(name="idFour")Long idFour) {
		
		if(idFour==null) {
			return ResponseEntity.badRequest().body("cannot retrieve Fournisser with null id!");
		}
Fournisseur fournisseur = fournisseurImpl.getFourById(idFour);
			if(fournisseur==null) {
				return ResponseEntity.notFound().build();
			}
			return ResponseEntity.ok().body(fournisseur);
		}
	
		
		
	
	@DeleteMapping ("/fournisseur/{id}")
	public ResponseEntity deleteFour( @PathVariable(name="id")Long idFour) {
		
		Fournisseur fournisseur = fournisseurImpl.getFourById(idFour);
			if(fournisseur==null) {
				return ResponseEntity.notFound().build();
			}
			fournisseurImpl.deleteFour(fournisseur);
			
			return ResponseEntity.ok().body(fournisseur);
		}
		
}


	
	
	
	

