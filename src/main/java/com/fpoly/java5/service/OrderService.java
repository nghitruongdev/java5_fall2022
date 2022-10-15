package com.fpoly.java5.service;

import com.fpoly.java5.model.entity.Order;
import com.fpoly.java5.repo.OrderDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderService {

    @Autowired
    OrderDetailRepository repo;

    public Order getOrder(Order order) {
        return repo.getOrderDetailByOrderId(order.getId()).getOrder();
    }
}
