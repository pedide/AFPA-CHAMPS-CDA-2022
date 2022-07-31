package com.xprod.rest.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.xprod.rest.entity.Produits;

//connection à la DB
public interface IProduitsRepository  extends JpaRepository<Produits, Long>{// va chercher les methodes pour modifier la DB grace au extends

}
