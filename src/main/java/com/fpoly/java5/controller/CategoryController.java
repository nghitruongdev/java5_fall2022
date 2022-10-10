package com.fpoly.java5.controller;

import com.fpoly.java5.entity.Category;
import com.fpoly.java5.repo.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    CategoryRepository repo;

    @GetMapping("/index")
    public String index(Model model) {
        model.addAttribute("item", new Category());
        return "category/index";
    }

    @GetMapping("/edit/{id}")
    public String edit(Model model, @PathVariable("id") String id) {
        model.addAttribute("item", repo.findById(id).orElse(new Category()));
        return "category/index";
    }

    @PostMapping("/create")
    public String create(Category category) {
        repo.save(category);
        return "category/index";
    }

    @PostMapping("/update")
    public String update(Category category) {
        repo.save(category);
        return "category/edit/" + category.getId();
    }

    @GetMapping("/delete/{id}")
    public String delete(Model model, @PathVariable("id") String id) {
        repo.deleteById(id);
        return "category/index";
    }

    @ModelAttribute("items")
    public List<Category> getList() {
        return repo.findAll();
    }
}
