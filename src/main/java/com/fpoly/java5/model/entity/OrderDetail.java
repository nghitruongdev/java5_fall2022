package com.fpoly.java5.model.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

@Getter
@Setter
@ToString
@Entity
@Table(name = "order_details")
public class OrderDetail {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id", nullable = false)
    private long id;
    @Column(name = "order_id", nullable = true, insertable = false, updatable = false)
    private Long orderId;
    @Column(name = "product_id", nullable = true, length = 50, insertable = false, updatable = false)
    private String productId;
    @Column(name = "quantity", nullable = false)
    private int quantity;
    @Column(name = "price", nullable = false, precision = 3)
    private Double price;
    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "order_id", referencedColumnName = "id")
    private Order order;
    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "product_id", referencedColumnName = "id")
    private Product product;

    public double getTotal() {
        return price * quantity;
    }
}
