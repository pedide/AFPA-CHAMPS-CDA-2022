package com.xprod.rest.service.impl;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xprod.rest.entity.XprodImage;
import com.xprod.rest.repository.IXprodImageRepository;


@Service
public class XprodImageServiceImpl {

	@Autowired
	private IXprodImageRepository xprodImageRepository;
	
	public XprodImage getXprodImageById(Long idImage) {
		return xprodImageRepository.findById(idImage).get();
	}
	
	public List<XprodImage> getAllXprodImage(){
		return xprodImageRepository.findAll();
	}
	
	public XprodImage saveXprodImage(XprodImage img) {
		return xprodImageRepository.save(img);
	}
	
	public XprodImage updateXprodImage(@Valid XprodImage xprodImage) {
		return xprodImageRepository.saveAndFlush(xprodImage);
	}
	
	public void deleteXprodImage(XprodImage fournisseur) {
		xprodImageRepository.delete(fournisseur);
	}
}
