package com.bagboutique.rest.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bagboutique.rest.entity.Orders;

public interface IOrderRepository extends JpaRepository <Orders,Long>  {

}

//Repository apel jpa repository qui comunique avec la dao (il implemente jpa