package com.diablement.rest.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.diablement.rest.entity.Order;

public interface IOrderRepository extends JpaRepository<Order,Long>{

}
