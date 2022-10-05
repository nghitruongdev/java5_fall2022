package com.fpoly.java5.service;

import com.fpoly.java5.entity.Product;
import com.fpoly.java5.repo.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductService {

    @Autowired
    ProductRepository repo;

    public List<Product> findAll() {
        return repo.findAll();
    }

    public List<Product> findByCategoryId(String id) {
        return repo.findByCategoryId(id);
    }

    public Product findByProductId(String id) {
        return repo.findProductById(id);
    }
}
