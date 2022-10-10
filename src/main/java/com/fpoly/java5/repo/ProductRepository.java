package com.fpoly.java5.repo;

import com.fpoly.java5.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface ProductRepository extends JpaRepository<Product, Integer> {
    @Query("FROM Product p WHERE p.price BETWEEN ?1 AND ?2")
    List<Product> findByPrice(double min, double max);
}
