package com.xprod.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.xprod.rest.entity.Commande;
import com.xprod.rest.entity.LigneCmd;
import com.xprod.rest.service.impl.CommandeServiceImpl;
import com.xprod.rest.service.impl.LigneCmdServiceImpl;

public class LigneCmdController {
	@Autowired
	LigneCmdServiceImpl ligneCmdServiceImpl;
	
	@PostMapping("/ligneCmd")
	public LigneCmd createLigneCmd(@Validated @RequestBody(required=false)LigneCmd ligneCmd) {
		return ligneCmdServiceImpl.saveLigneCmd(ligneCmd);
	}

	@GetMapping("/ligneCmd")
	public List<LigneCmd> getLigneCmd(@Validated @RequestBody(required=false)LigneCmd ligneCmd) {
		return ligneCmdServiceImpl.getLigneCmd();
	}
	
	@PutMapping("/ligneCmd")
	public LigneCmd updateLigneCmd(@Validated @RequestBody(required=false)LigneCmd ligneCmd) {
		return ligneCmdServiceImpl.updateLigneCmd(ligneCmd);
	}
	
	@GetMapping("/ligneCmd/{idLigneCmd}")
	public ResponseEntity  findLigneCmdById(@PathVariable(name="idCommande")Long idLigneCmd) {
		if(idLigneCmd==null) {
			return ResponseEntity.badRequest().body("Cannot retrieve Commande with null Id!");
		}
		LigneCmd ligneCmd = ligneCmdServiceImpl.getLigneCmdById(idLigneCmd);
		if(idLigneCmd==null) {
			return ResponseEntity.notFound().build();
		}
		return ResponseEntity.ok().body(ligneCmd);
	}
	
	@DeleteMapping("/ligneCmd/{id}")
	public ResponseEntity deleteLigneCmd( @PathVariable(name="id")Long idLigneCmd) {
		LigneCmd ligneCmd = ligneCmdServiceImpl.getLigneCmdById(idLigneCmd);
		if(idLigneCmd==null) {
			return ResponseEntity.notFound().build();
		}
		ligneCmdServiceImpl.deleteLigneCmd(ligneCmd);
		return ResponseEntity.ok().body(ligneCmd);
	}
}
