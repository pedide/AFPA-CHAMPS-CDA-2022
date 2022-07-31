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

import com.diablement.rest.entity.Commande;
import com.diablement.rest.service.impl.CommandeServiceImpl;



@RestController //genere des API rest JSON
@RequestMapping
@CrossOrigin("*")
public class CommandeController {

	@Autowired
	CommandeServiceImpl commandeServiceImpl;
	
	//recuper une cmde
	@GetMapping("/commande")
	public List<Commande> getAllCommande(@Validated
			@RequestBody(required=false)Commande commande){
		
		return commandeServiceImpl.getAllCommande();
	}
	
	@PostMapping("/commande")
	public Commande createCommande(@Validated 
			@RequestBody(required=false)Commande commande) {
		
		return commandeServiceImpl.saveCommande(commande);
	}
	
	//on recupere 1 cmde en fonction de id
	@GetMapping("/commande/{idCmde}")
	public ResponseEntity findCommandeById(@PathVariable(name="idCmde") Long idCmde){
		if(idCmde==null) {
			return ResponseEntity.badRequest().body("On ne trouve pas de commande avec id null");
		}
		
		Commande commande = commandeServiceImpl.getCommandeById(idCmde);
		
		if(commande == null) {
			return ResponseEntity.notFound().build();//pas trouvé ce cmde
		}
		return ResponseEntity.ok().body(commande);
	}
	
	//mettre à jour ma cmde
	@PutMapping("/commande")
	public Commande updateCommande(@Validated @RequestBody(required=false) Commande commande) {
		return commandeServiceImpl.updateCommande(commande);
	}
	
	@DeleteMapping("/commande/{id}")
	public ResponseEntity<Commande> deleteCommande(@Validated @PathVariable(name="id") Long idCmde){
		Commande commande = commandeServiceImpl.getCommandeById(idCmde);
		
		if(commande == null) {
			return ResponseEntity.notFound().build();
		}
		commandeServiceImpl.deleteCommande(commande);//on supprime la cmde
		return ResponseEntity.ok().body(commande);
	}
	
}
