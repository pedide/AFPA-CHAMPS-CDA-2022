package com.xprod.rest.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.xprod.rest.entity.Commande;

public interface ICommandeRepository extends JpaRepository<Commande, Long>{

//pour faire des ajouts ou suppressions
}
