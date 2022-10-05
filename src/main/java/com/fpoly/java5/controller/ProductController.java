package com.fpoly.java5.controller;


import com.fpoly.java5.entity.Category;
import com.fpoly.java5.entity.Product;
import com.fpoly.java5.service.CategoryService;
import com.fpoly.java5.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    ProductService productService;
    @Autowired
    CategoryService categoryService;

    // localhost:8080/product/{categoryID}
    @GetMapping("/{categoryID}")
    public String doGetProductbyCgrId(@PathVariable("categoryID") String categoryId, Model model) {
        List<Product> productList = productService.findByCategoryId(categoryId);
        model.addAttribute("productList", productList);
        List<Category> categoryList = categoryService.findAll();
        model.addAttribute("categoryList",categoryList);

        return "detail";
    }

    // localhost:8080/product?productID=???
    @GetMapping("")
    public String doGetProductById(@RequestParam("productID") String productId, Model model) {
        Product product = productService.findByProductId(productId);
        model.addAttribute("product", product);
        List<Category> categoryList = categoryService.findAll();
        model.addAttribute("categoryList", categoryList);
        return "detailProduct";
    }

}
