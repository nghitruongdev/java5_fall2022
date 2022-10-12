package com.fpoly.java5.model.entity;

import lombok.*;
import org.hibernate.Hibernate;

import javax.persistence.*;
import java.io.Serializable;

@Getter
@Setter
@ToString
@AllArgsConstructor
@RequiredArgsConstructor
@Entity
@Table(name = "order_details")
public class OrderDetail implements Serializable {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private int id;
    private Double price;
    private Integer quantity;
    @Column(name = "orderid", nullable = true, insertable = false, updatable = false)
    private Integer orderid;
    @Column(name = "productid", nullable = true, insertable = false, updatable = false)
    private Integer productid;
    @ManyToOne
    @JoinColumn(name = "orderid", referencedColumnName = "id")
    private Order order;
    @ManyToOne
    @JoinColumn(name = "productid", referencedColumnName = "id")
    private Product product;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;

        OrderDetail that = (OrderDetail) o;

        if (id != that.id) return false;
        if (price != null ? !price.equals(that.price) : that.price != null) return false;
        if (quantity != null ? !quantity.equals(that.quantity) : that.quantity != null) return false;
        if (orderid != null ? !orderid.equals(that.orderid) : that.orderid != null) return false;
        if (productid != null ? !productid.equals(that.productid) : that.productid != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (price != null ? price.hashCode() : 0);
        result = 31 * result + (quantity != null ? quantity.hashCode() : 0);
        result = 31 * result + (orderid != null ? orderid.hashCode() : 0);
        result = 31 * result + (productid != null ? productid.hashCode() : 0);
        return result;
    }
}
