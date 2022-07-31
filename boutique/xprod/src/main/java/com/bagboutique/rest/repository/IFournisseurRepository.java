package com.bagboutique.rest.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bagboutique.rest.entity.Fournisseur;


public interface IFournisseurRepository  extends JpaRepository<Fournisseur,Long> {


}
