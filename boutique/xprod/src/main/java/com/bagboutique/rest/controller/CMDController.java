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

import com.bagboutique.rest.entity.Commande;
import com.bagboutique.rest.service.impl.CommandeImpl;

@RestController
@RequestMapping
@CrossOrigin
public class CMDController {
	
	
	
	
	@Autowired
	CommandeImpl commandeImpl;
	
	@PostMapping("/commande")
	public Commande createcommande(@Validated @RequestBody(required=false)Commande commande) {
	return	commandeImpl.saveCommande(commande);
		
	}

	@GetMapping ("/commande/list")
	public List<Commande> getAllCommande(@Validated @RequestBody(required=false)Commande commande) {
		return	commandeImpl.getAllCommande();
	}
	
	@PutMapping ("/commande/{numCms}")
	public Commande updateCommande(@Validated @RequestBody(required=false)Commande commande) {
		return	commandeImpl.saveCommande(commande);
	}
	
	
	@GetMapping ("/commande/{numCms}")
	public ResponseEntity findCommande( @PathVariable(name="numCms")Long numCms) {
		
		if(numCms==null) {
			return ResponseEntity.badRequest().body("cannot retrieve Commande with null id!");
		}
Commande commande = commandeImpl.getCommandeById(numCms);
			if(commande==null) {
				return ResponseEntity.notFound().build();
			}
			return ResponseEntity.ok().body(commande);
		}
	
		
		
	
	@DeleteMapping ("/commande/{id}")
	public ResponseEntity deleteCommande( @PathVariable(name="id")Long numCms) {
		
		Commande commande = commandeImpl.getCommandeById(numCms);
			if(commande==null) {
				return ResponseEntity.notFound().build();
			}
			commandeImpl.deleteCommande(commande);
			
			return ResponseEntity.ok().body(commande);
		}
		
}



