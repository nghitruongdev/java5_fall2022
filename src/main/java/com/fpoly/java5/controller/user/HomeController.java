package com.fpoly.java5.controller.user;

import com.fpoly.java5.model.entity.Product;
import com.fpoly.java5.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @Autowired
    ProductService productService;

    @RequestMapping
    public String index(Model model) {
        Page<Product> page = productService.findAll(PageRequest.of(0, 6));
        model.addAttribute("products", page.getContent());
        return "home/index";
    }

    @RequestMapping("/about")
    public String about() {
        return "about/index";
    }

}
