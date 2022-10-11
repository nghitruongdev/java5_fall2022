package com.fpoly.java5.controller;

import com.fpoly.java5.entity.Report;
import com.fpoly.java5.repo.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/report")
public class ReportController {
    @Autowired
    ProductRepository repo;

    @RequestMapping("/inventory-by-category")
    public String inventory(Model model) {
        List<Report> items = repo.getInventoryByCategory();
        model.addAttribute("items", items);
        return "report/index";
    }
}
