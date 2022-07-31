package com.diablement.rest.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.diablement.rest.entity.Fournisseur;
import com.diablement.rest.entity.User;
import com.diablement.rest.exception.domaine.EmailExistException;
import com.diablement.rest.exception.domaine.NotAnImageFileException;
import com.diablement.rest.exception.domaine.UserNotFoundException;
import com.diablement.rest.exception.domaine.UsernameExistException;
import com.diablement.rest.service.impl.FournisseurServiceImpl;

@RestController //genere des API rest JSON
@RequestMapping
@CrossOrigin("*")//autoriser les url provenant du serveur sinon nagigateur va bloquer 
public class FournisseurController {
	
	@Autowired
	FournisseurServiceImpl fournisseurServiceImpl;
	
	//recuper un four
	@GetMapping("/fournisseur")
	public List<Fournisseur> getAllFournisseur(@Validated
			@RequestBody(required=false)Fournisseur fournisseur){
		
		return fournisseurServiceImpl.getAllFournisseur();
	}
	
	@PostMapping("/fournisseur")
	public Fournisseur createFournisseur(@Validated 
			@RequestBody(required=false)Fournisseur fournisseur) {
		
		return fournisseurServiceImpl.saveFournisseur(fournisseur);
	}
	
	//on recupere 1 four en fonction de id
	@GetMapping("/fournisseur/{idFour}")
	public ResponseEntity findFournisseurById(@PathVariable(name="idFour") Long idFour){
		if(idFour==null) {
			return ResponseEntity.badRequest().body("On ne trouve pas de fournisseur avec id null");
		}
		Fournisseur fournisseur = fournisseurServiceImpl.getFournisseurById(idFour);
		
		if(fournisseur == null) {
			return ResponseEntity.notFound().build();//pas trouvé ce produit
		}
		return ResponseEntity.ok().body(fournisseur);
	}
	
	//mettre à jour mon fournisseur
	@PutMapping("/fournisseur")
	public Fournisseur updateFournisseur(@Validated @RequestBody(required=false) Fournisseur fournisseur) {
		return fournisseurServiceImpl.updateFournisseur(fournisseur);
	}
	
	
	@DeleteMapping("/fournisseur/{id}")
	public ResponseEntity<Fournisseur> deleteFournisseur(@Validated @PathVariable(name="id") Long idFournisseur){
		Fournisseur fournisseur = fournisseurServiceImpl.getFournisseurById(idFournisseur);
		
		if(fournisseur == null) {
			return ResponseEntity.notFound().build();
		}
		fournisseurServiceImpl.deleteFournisseur(fournisseur);//on supprime le four
		return ResponseEntity.ok().body(fournisseur);
	}
	
}
