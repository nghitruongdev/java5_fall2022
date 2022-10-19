package com.fpoly.java5.model.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.List;

@Getter
@Setter
@ToString
@Entity
@Table(name = "products")
public class Product implements Serializable {
    //    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id", nullable = false, length = 50)
    private String id;

    @Column(name = "name", nullable = true, length = 255)
    @NotBlank(message = "{name.notBlank}")
    private String name;

    @Column(name = "price", nullable = true, precision = 3)
    @NotNull(message = "{price.notNull}")
    @Min(message = "{price.min}", value = 0L)
    private Double price;

    @Column(name = "description", nullable = true, length = -1)
    private String description;

    @Column(name = "img", nullable = true, length = 255)
    private String img;

    @Column(name = "quantity", nullable = true)
    @NotNull(message = "{quantity.notNull}")
    @Min(message = "{quantity.min}", value = 0L)
    private Integer quantity;

    @Column(name = "category_id", nullable = true, length = 50, insertable = false, updatable = false)
    private String categoryId;
    @JsonIgnore
    @ToString.Exclude
    @OneToMany(mappedBy = "product")
    private List<OrderDetail> orderDetailsById;
    @JsonIgnore
    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "category_id", referencedColumnName = "id")
    private Category category;

    public OrderDetail placeOrder(OrderDetail detail) {
        detail.setProduct(this);
        detail.setPrice(price);
        detail.setQuantity(quantity);
        return detail;
    }
}
