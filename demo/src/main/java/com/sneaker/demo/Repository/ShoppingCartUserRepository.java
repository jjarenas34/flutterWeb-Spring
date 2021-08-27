package com.sneaker.demo.Repository;

import org.springframework.stereotype.Repository;

import com.sneaker.demo.model.ShoppingCartUser;

import org.springframework.data.jpa.repository.JpaRepository;

@Repository
public interface ShoppingCartUserRepository extends JpaRepository<ShoppingCartUser, Long>{
    
}
