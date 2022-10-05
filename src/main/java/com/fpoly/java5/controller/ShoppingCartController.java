package com.fpoly.java5.controller;

import com.fpoly.java5.entity.Category;
import com.fpoly.java5.repo.CategoryRepository;
import com.fpoly.java5.service.ParamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class ShoppingCartController {
    @Autowired
    CategoryRepository repo;
    @Autowired
    ParamService service;


    // Index page
    @RequestMapping("category/index")
    public String index(Model model) {
        Category category = new Category();
        model.addAttribute("category", category);
        List<Category> items = repo.findAll();
        model.addAttribute("items", items);
        return "index";
    }

    @RequestMapping("/category/edit/{id}")
    public String edit(@PathVariable("id") String id, Model model) {
        Category category = repo.findById(id).get();
        model.addAttribute("category", category);
        List<Category> items = repo.findAll();
        model.addAttribute("items", items);
        return "index";
    }

    @PostMapping("/category/add")
    public String add(Category category) {
        repo.save(category);
        return "redirect:/category/index";
    }

    @PostMapping("/category/update")
    public String update(Category category) {
        repo.save(category);
        return "redirect:/category/edit/" + category.getId();
    }

    @GetMapping("/category/delete/{id}")
    public String delete(@PathVariable("id") String id) {
        repo.deleteById(id);
        return "redirect:/category/index";
    }
}
