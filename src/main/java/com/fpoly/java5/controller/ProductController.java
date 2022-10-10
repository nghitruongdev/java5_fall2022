package com.fpoly.java5.controller;

import com.fpoly.java5.entity.Product;
import com.fpoly.java5.repo.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    ProductRepository repo;

    @RequestMapping("/index")
    public String index(Model model) {
        model.addAttribute("items", repo.findAll());
        return "product/index";
    }


}
