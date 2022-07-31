package com.bagboutique.rest.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bagboutique.rest.entity.Produits;

public interface IProduitsRepository extends JpaRepository <Produits,Long>  {

}
// Repository apel jpa repository qui comunique avec la dao (il implemente jpa)