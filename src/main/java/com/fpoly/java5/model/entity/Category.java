package com.fpoly.java5.model.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Getter
@Setter
@ToString
@Entity
@Table(name = "categories")
public class Category implements Serializable {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id", nullable = false, length = 50)
    private String id;
    @Column(name = "name", nullable = true, length = 255)
    private String name;
    @Column(name = "note", nullable = true, length = -1)
    private String note;
    @ToString.Exclude
    @OneToMany(mappedBy = "category")
    private transient List<Product> productsById;
}
