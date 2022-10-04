package com.fpoly.java5.controller;

import com.fpoly.java5.repo.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {

    @Autowired
    ProductRepository repo;
    @ResponseBody
    @RequestMapping
    public String home(){
        return repo.findAll().toString();
    }
}
