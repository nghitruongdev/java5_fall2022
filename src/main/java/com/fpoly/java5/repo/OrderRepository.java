package com.fpoly.java5.repo;

import com.fpoly.java5.entity.Order;
import com.fpoly.java5.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Long> {

}