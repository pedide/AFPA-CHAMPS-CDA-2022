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

import com.xprod.rest.entity.XprodImage;
import com.xprod.rest.service.impl.XprodImageServiceImpl;

@RestController
@RequestMapping
@CrossOrigin("*")
public class XproImageController {
	@Autowired
	XprodImageServiceImpl xprodImageServiceImpl;
	
	@PostMapping("/image")
	public XprodImage createXprodImage(@Validated @RequestBody(required=false)XprodImage xprodImage) {
		return xprodImageServiceImpl.saveXprodImage(xprodImage);
	}

	@GetMapping("/image")
	public List<XprodImage> getAllXprodImage(@Validated @RequestBody(required=false)XprodImage xprodImage) {
		return xprodImageServiceImpl.getAllXprodImage();
	}
	
	@PutMapping("/image")
	public XprodImage updateXprodImage(@Validated @RequestBody(required=false)XprodImage xprodImage) {
		return xprodImageServiceImpl.updateXprodImage(xprodImage);
	}
	
	@GetMapping("/image/{idImage}")
	public ResponseEntity  findXprodImageById(@PathVariable(name="idImage")Long idImage) {
		if(idImage==null) {
			return ResponseEntity.badRequest().body("Cannot retrieve XprodImage with null Id!");
		}
		XprodImage xprodImage = xprodImageServiceImpl.getXprodImageById(idImage);
		if(idImage==null) {
			return ResponseEntity.notFound().build();
		}
		return ResponseEntity.ok().body(xprodImage);
	}
	
	@DeleteMapping("/xprodImage/{id}")
	public ResponseEntity deleteXprodImage( @PathVariable(name="id")Long id) {
		XprodImage xprodImage = xprodImageServiceImpl.getXprodImageById(id);
		if(id==null) {
			return ResponseEntity.notFound().build();
		}
		xprodImageServiceImpl.deleteXprodImage(xprodImage);
		return ResponseEntity.ok().body(xprodImage);
	}
}
