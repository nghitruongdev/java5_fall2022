package com.fpoly.java5;

import com.fpoly.java5.repo.ProductRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@SpringBootApplication
public class Java5Fall2022Application {
    public static void main(String[] args) {
        SpringApplication.run(Java5Fall2022Application.class, args);
    }

//    @Autowired
//    ProductRepository repo;
//    @RequestMapping
//    @ResponseBody
//    public String index(){
//        return repo.findAll().toString();
//    }
}
