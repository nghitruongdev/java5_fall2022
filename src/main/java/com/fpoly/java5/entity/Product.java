package com.fpoly.java5.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;
@Getter
@Setter
@ToString
@Entity
@Table(name = "products")
public class Product {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id", nullable = false, length = 50)
    private String id;
    @Column(name = "name", nullable = true, length = 255)
    private String name;
    @Column(name = "price", nullable = true, precision = 3)
    private double price;
    @Column(name = "description", nullable = true, length = -1)
    private String description;
    @Column(name = "img", nullable = true, length = 255)
    private String img;
    @Column(name = "quantity", nullable = true)
    private Integer quantity;
    @Column(name = "category_id", nullable = true, length = 50, insertable = false, updatable = false)
    private String categoryId;
    @ToString.Exclude
    @OneToMany(mappedBy = "product")
    private List<OrderDetail> orderDetailsById;
    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "category_id", referencedColumnName = "id")
    private Category category;

}
