package com.fpoly.java5.controller.admin;

import com.fpoly.java5.model.entity.Order;
import com.fpoly.java5.service.OrderService;
import com.fpoly.java5.service.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin/orders")
public class OrderAdminController {
    @Autowired
    OrderService service;
    @Autowired
    UploadService upload;
    final String ORDER_INDEX = "admin/order/index";

    @RequestMapping
    public String openOrderPage() {
        return ORDER_INDEX;
    }

    @ModelAttribute("orders")
    public List<Order> getOrders() {
        return service.findAll();
    }
}
