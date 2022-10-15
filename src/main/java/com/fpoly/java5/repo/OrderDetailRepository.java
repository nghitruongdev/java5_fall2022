package com.fpoly.java5.repo;

import com.fpoly.java5.model.entity.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {
    OrderDetail getOrderDetailByOrderId(Long orderID);
}