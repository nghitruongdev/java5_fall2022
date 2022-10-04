package com.fpoly.java5.entity;

import lombok.*;
import org.hibernate.Hibernate;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;
import java.util.Collection;
@Getter
@Setter
@ToString
@AllArgsConstructor
@RequiredArgsConstructor
@Entity
@Table(name = "orders", schema = "J5Shop", catalog = "")
public class Order implements Serializable {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id", nullable = false)
    private int id;
    @Basic
    @Column(name = "address", nullable = true, length = 50)
    private String address;
    @Basic
    @Column(name = "createdate", nullable = true)
    private Date createdate;
    @Basic
    @Column(name = "username", nullable = true, length = 50, insertable = false, updatable = false)
    private String username;
    @OneToMany(mappedBy = "orderByOrderid")
    private Collection<OrderDetail> orderDetailsById;
    @ManyToOne
    @JoinColumn(name = "username", referencedColumnName = "username")
    private Account accountByUsername;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;

        Order order = (Order) o;

        if (id != order.id) return false;
        if (address != null ? !address.equals(order.address) : order.address != null) return false;
        if (createdate != null ? !createdate.equals(order.createdate) : order.createdate != null) return false;
        if (username != null ? !username.equals(order.username) : order.username != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (address != null ? address.hashCode() : 0);
        result = 31 * result + (createdate != null ? createdate.hashCode() : 0);
        result = 31 * result + (username != null ? username.hashCode() : 0);
        return result;
    }

}
