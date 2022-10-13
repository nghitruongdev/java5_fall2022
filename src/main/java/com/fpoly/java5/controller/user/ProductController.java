package com.fpoly.java5.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {

    @RequestMapping("/products")
    public String index() {
        return "product/index";
    }
}
