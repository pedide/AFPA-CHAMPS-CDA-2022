package com.xprod.rest.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.beans.factory.annotation.Autowired;
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

import com.xprod.rest.entity.Fournisseur;
import com.xprod.rest.service.impl.FournisseurServiceImpl;

@RestController
@RequestMapping
@CrossOrigin("*")
public class FournisseurController {
	@Autowired
	FournisseurServiceImpl fournisseurServiceImpl;
	
	@PostMapping("/fournisseur")
	public Fournisseur createFournisseur(@Validated @RequestBody(required=false)Fournisseur fournisseur) {
		return fournisseurServiceImpl.saveFournisseur(fournisseur);
	}

	@GetMapping("/fournisseur")
	public List<Fournisseur> getAllFournisseur(@Validated @RequestBody(required=false)Fournisseur fournisseur) {
		return fournisseurServiceImpl.getFournisseur();
	}
	
	@PutMapping("/fournisseur")
	public Fournisseur updateFournisseur(@Validated @RequestBody(required=false)Fournisseur fournisseur) {
		return fournisseurServiceImpl.updateFournisseur(fournisseur);
	}
	
	@GetMapping("/fournisseur/{idFournisseur}")
	public ResponseEntity  findFournisseurById(@PathVariable(name="idFournisseur")Long idFournisseur) {
		if(idFournisseur==null) {
			return ResponseEntity.badRequest().body("Cannot retrieve Fournisseur with null Id!");
		}
		Fournisseur fournisseur = fournisseurServiceImpl.getFournisseurById(idFournisseur);
		if(idFournisseur==null) {
			return ResponseEntity.notFound().build();
		}
		return ResponseEntity.ok().body(fournisseur);
	}
	
	@DeleteMapping("/fournisseur/{id}")
	public ResponseEntity fournisseur( @PathVariable(name="id")Long idFournisseur) {
		Fournisseur fournisseur = fournisseurServiceImpl.getFournisseurById(idFournisseur);
		if(idFournisseur==null) {
			return ResponseEntity.notFound().build();
		}
		fournisseurServiceImpl.deleteFournisseur(fournisseur);
		return ResponseEntity.ok().body(fournisseur);
	}
}
