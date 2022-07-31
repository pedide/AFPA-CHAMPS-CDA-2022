package com.bagboutique.rest.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bagboutique.rest.entity.OrderItem;



public interface IOrderItemRepository extends JpaRepository <OrderItem,Long> {

}
