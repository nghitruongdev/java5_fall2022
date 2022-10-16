package com.fpoly.java5.repo;

import com.fpoly.java5.model.entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, String> {
    @Query("select o from Product o where o.name like %?1%")
    List<Product> findByName(String nameProduct);
    Page<Product> findByCategoryId(String id, Pageable pageable);



    Long countByCategoryId(String id);
}