package com.bagboutique.rest.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bagboutique.rest.entity.Commande;



public interface ICommandeRepository  extends JpaRepository<Commande,Long>{

}
