package com.xprod.rest.controller;

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

import com.xprod.rest.entity.Commande;
import com.xprod.rest.service.impl.CommandeServiceImpl;

@RestController
@RequestMapping
@CrossOrigin("*") //Autorise l'app à lire les URL dans le navigateur
public class CommandeController {
	@Autowired
	CommandeServiceImpl commandeServiceImpl;
	
	@PostMapping("/commande")
	public Commande createCommande(@Validated @RequestBody(required=false)Commande commande) {
		return commandeServiceImpl.saveCommande(commande);
	}

	@GetMapping("/commande")
	public List<Commande> getAllCommande(@Validated @RequestBody(required=false)Commande commande) {
		return commandeServiceImpl.getCommande();
	}
	
	@PutMapping("/commande")
	public Commande updateCommande(@Validated @RequestBody(required=false)Commande commande) {
		return commandeServiceImpl.updateCommande(commande);
	}
	
	@GetMapping("/commande/{idCommande}")
	public ResponseEntity  findCommandeById(@PathVariable(name="idCommande")Long idCommande) {
		if(idCommande==null) {
			return ResponseEntity.badRequest().body("Cannot retrieve Commande with null Id!");
		}
		Commande commande = commandeServiceImpl.getCommandeById(idCommande);
		if(idCommande==null) {
			return ResponseEntity.notFound().build();
		}
		return ResponseEntity.ok().body(commande);
	}
	
	@DeleteMapping("/commande/{id}")
	public ResponseEntity deleteCommande( @PathVariable(name="id")Long idCommande) {
		Commande commande = commandeServiceImpl.getCommandeById(idCommande);
		if(idCommande==null) {
			return ResponseEntity.notFound().build();
		}
		commandeServiceImpl.deleteCommande(commande);
		return ResponseEntity.ok().body(commande);
	}
}