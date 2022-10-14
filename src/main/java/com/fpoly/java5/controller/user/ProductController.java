package com.fpoly.java5.controller.user;

import com.fpoly.java5.entity.Product;
import com.fpoly.java5.repo.ProductRepository;
import com.fpoly.java5.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class ProductController {
    private static final int PAGE_SIZE = 6;
    @Autowired
    ProductService productService;

    @RequestMapping("/products")
    public String index(Model model) {
        model.addAttribute("products", productService.findAll());
        return "product/index";
    }

    @RequestMapping("/products/{id}")
    public String byCategory(Model model, @PathVariable String id) {
        List<Product> list = productService.findByCategoryId(id);
        model.addAttribute("products", list);
        model.addAttribute("totalPages", getTotalPages(list));
        return "product/index";
    }

    private int getTotalPages(List<Product> list) {
        return (int) Math.ceil(list.size() * 1d / PAGE_SIZE);
    }
}
