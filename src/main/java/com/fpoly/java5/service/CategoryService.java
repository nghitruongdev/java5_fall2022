package com.fpoly.java5.service;

import com.fpoly.java5.model.entity.Category;
import com.fpoly.java5.repo.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class CategoryService {
    @Autowired
    CategoryRepository repo;

    public List<Category> findAll() {
        return repo.findAll();
    }

}
