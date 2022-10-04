package com.fpoly.java5.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.util.List;
@Getter
@Setter
@ToString
@Entity
@Table(name = "orders", schema = "shop_java5")
public class Order {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id", nullable = false)
    private long id;
    @Basic
    @Column(name = "user_id", nullable = true, insertable = false, updatable = false)
    private Integer userId;
    @Basic
    @Column(name = "total", nullable = false, precision = 3)
    private Double total;
    @Basic
    @Column(name = "phone", nullable = false, length = 11)
    private String phone;
    @Basic
    @Column(name = "address", nullable = false, length = 255)
    private String address;
   @ToString.Exclude
    @OneToMany(mappedBy = "order")
    private List<OrderDetail> orderDetailsById;
    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Order order = (Order) o;

        if (id != order.id) return false;
        if (userId != null ? !userId.equals(order.userId) : order.userId != null) return false;
        if (total != null ? !total.equals(order.total) : order.total != null) return false;
        if (phone != null ? !phone.equals(order.phone) : order.phone != null) return false;
        if (address != null ? !address.equals(order.address) : order.address != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (userId != null ? userId.hashCode() : 0);
        result = 31 * result + (total != null ? total.hashCode() : 0);
        result = 31 * result + (phone != null ? phone.hashCode() : 0);
        result = 31 * result + (address != null ? address.hashCode() : 0);
        return result;
    }

}
