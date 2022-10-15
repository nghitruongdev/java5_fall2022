package com.fpoly.java5.service;

import com.fpoly.java5.model.entity.Product;
import com.fpoly.java5.repo.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {

    @Autowired
    ProductRepository repo;

    public List<Product> findAll() {
        return repo.findAll();
    }

    public Page<Product> findAll(Pageable pageable) {
        return repo.findAll(pageable);
    }

    public Page<Product> findByCategoryId(String id, Pageable pageable) {
        return repo.findByCategoryId(id, pageable);
    }

    public Product findByProductId(String id) {
        return repo.findById(id).orElse(null);
    }

    public Long count() {
        return repo.count();
    }

    public Long countByCategoryId(String id) {
        return repo.countByCategoryId(id);
    }
}
