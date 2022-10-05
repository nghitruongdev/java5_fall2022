package com.fpoly.java5.repo;

import com.fpoly.java5.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, String> {
    List<Product> findByCategoryId(String id);


    Product findProductById(String id);


}