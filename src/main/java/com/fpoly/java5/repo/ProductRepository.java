package com.fpoly.java5.repo;

import com.fpoly.java5.model.entity.Product;
import com.fpoly.java5.model.entity.Report;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Integer> {
    @Query("FROM Product p WHERE p.price BETWEEN ?1 AND ?2")
    List<Product> findByPrice(double min, double max);

    List<Product> findByPriceBetween(double min, double max);

    @Query("FROM Product p WHERE p.name LIKE ?1")
    Page<Product> findByKeyword(String keyword, Pageable pageable);

    Page<Product> findAllByNameLike(String keyword, Pageable pageable);
    @Query("SELECT new Report(p.category, SUM(p.price), COUNT(p)) " +
            "FROM Product p " +
            "GROUP BY p.category " +
            "ORDER BY sum(p.price) DESC")
    List<Report> getInventoryByCategory();
}
