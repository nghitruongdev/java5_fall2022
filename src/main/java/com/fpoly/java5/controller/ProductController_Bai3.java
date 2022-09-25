package com.fpoly.java5.controller;

import com.fpoly.java5.domain.Product;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ProductController_Bai3 {

    @RequestMapping("/product/form")
    public ModelAndView form(ModelAndView mv){
        mv.setViewName("product_form");
        return mv;
    }

    List<Product> list = new ArrayList<>();
    @PostMapping("/product/add")
    public ModelAndView add(Product product, ModelAndView mv){
        list.add(product);
        mv.addObject("list", list).setViewName("product_form");
        return mv;
    }
}
