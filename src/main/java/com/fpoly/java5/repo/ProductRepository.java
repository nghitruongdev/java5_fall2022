package com.fpoly.java5.repo;

import com.fpoly.java5.entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, String> {
    Page<Product> findByCategoryId(String id, Pageable pageable);

    Product findProductById(String id);
    Long countByCategoryId(String id);
}