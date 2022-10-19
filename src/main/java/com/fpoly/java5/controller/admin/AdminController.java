package com.fpoly.java5.controller.admin;

import com.fpoly.java5.model.entity.Product;
import com.fpoly.java5.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

public class AdminController {
    public String index() {
        return "admin/index";
    }

}
