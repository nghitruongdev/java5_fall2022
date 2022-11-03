package com.fpoly.java5.service;

import com.fpoly.java5.model.entity.Order;
import com.fpoly.java5.model.entity.OrderDetail;
import com.fpoly.java5.model.entity.Product;
import com.fpoly.java5.repo.OrderDetailRepository;
import com.fpoly.java5.repo.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {

    @Autowired
    OrderRepository repo;

    public List<Order> findAll() {
        return repo.findAll();
    }

    public Order placeAnOrder(Order order) {
        return repo.save(order);
    }

}
