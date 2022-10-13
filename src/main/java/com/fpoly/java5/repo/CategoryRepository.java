package com.fpoly.java5.repo;

import com.fpoly.java5.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface CategoryRepository extends JpaRepository<Category, String> {

    Category findCategoryById(String id);
}