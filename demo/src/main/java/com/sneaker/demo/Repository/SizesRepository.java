package com.sneaker.demo.Repository;

import com.sneaker.demo.model.Size;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SizesRepository extends JpaRepository<Size, Long> {
    
}
