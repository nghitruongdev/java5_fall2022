package com.fpoly.java5.model.entity;

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
@Table(name = "products")
public class Product implements Serializable {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private int id;
    private Byte available;
    private Date createdate;
    private String image;
    private String name;
    private Double price;
    @Column(name = "categoryid", nullable = true, length = 50, insertable = false, updatable = false)
    private String categoryid;
    @OneToMany(mappedBy = "product")
    private Collection<OrderDetail> orderDetails;
    @ManyToOne
    @JoinColumn(name = "categoryid", referencedColumnName = "id")
    private Category category;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;

        Product product = (Product) o;

        if (id != product.id) return false;
        if (available != null ? !available.equals(product.available) : product.available != null) return false;
        if (createdate != null ? !createdate.equals(product.createdate) : product.createdate != null) return false;
        if (image != null ? !image.equals(product.image) : product.image != null) return false;
        if (name != null ? !name.equals(product.name) : product.name != null) return false;
        if (price != null ? !price.equals(product.price) : product.price != null) return false;
        if (categoryid != null ? !categoryid.equals(product.categoryid) : product.categoryid != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (available != null ? available.hashCode() : 0);
        result = 31 * result + (createdate != null ? createdate.hashCode() : 0);
        result = 31 * result + (image != null ? image.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (price != null ? price.hashCode() : 0);
        result = 31 * result + (categoryid != null ? categoryid.hashCode() : 0);
        return result;
    }
}
