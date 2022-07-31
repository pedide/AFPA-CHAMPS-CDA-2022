package com.diablement.rest.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.diablement.rest.entity.Commande;

public interface ICommandeRepository extends JpaRepository<Commande, Long>{

}
