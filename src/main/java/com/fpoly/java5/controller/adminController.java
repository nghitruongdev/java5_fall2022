package com.fpoly.java5.controller;

import com.fpoly.java5.entity.Product;
import com.fpoly.java5.helper.ProductHelper;
import com.fpoly.java5.repo.CategoryRepository;
import com.fpoly.java5.repo.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


@Controller
@RequestMapping("admin")
public class adminController {
    @Autowired
    CategoryRepository categoryDAO;
    @Autowired
    ProductRepository productDAO;

    ProductHelper productHelper = new ProductHelper();


}
