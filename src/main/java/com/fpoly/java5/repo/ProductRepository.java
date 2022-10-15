package com.fpoly.java5.repo;

import com.fpoly.java5.model.entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, String> {
    Page<Product> findByCategoryId(String id, Pageable pageable);

    Long countByCategoryId(String id);
}