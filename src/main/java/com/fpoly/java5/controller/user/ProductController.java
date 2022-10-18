package com.fpoly.java5.controller.user;

import com.fpoly.java5.model.entity.Product;
import com.fpoly.java5.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/products")
public class ProductController {

    @Autowired
    ProductService service;
    @Autowired
    HttpServletRequest request;

    @RequestMapping("/{productId}")
    public String viewProduct(@PathVariable String productId, Model model) {
        Product p = service.findById(productId).orElse(null);
        model.addAttribute("product", p);
        return p == null ?
                "redirect:" + request.getHeader("Referer") :
                "product/detail";
    }
}
