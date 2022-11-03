package com.fpoly.java5.model.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@ToString
@Entity
@Table(name = "orders")
public class Order {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id", nullable = false)
    private long id;
    @Column(name = "user_id", nullable = true, insertable = false, updatable = false)
    private Integer userId;
    @Column(name = "total", nullable = false, precision = 3)
    private Double total;
    @Column(name = "phone", nullable = false, length = 11)
    private String phone;
    @Column(name = "address", nullable = false, length = 255)
    private String address;
    @ToString.Exclude
    @OneToMany(mappedBy = "order", cascade = {CascadeType.ALL})
    private List<OrderDetail> orderDetailsById = new ArrayList<>();
    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;

    public OrderDetail addOrderDetail(Product p) {
        OrderDetail detail = new OrderDetail();
        detail.setOrder(this);
        p.placeOrder(detail);
        orderDetailsById.add(detail);
        return detail;
    }
}
