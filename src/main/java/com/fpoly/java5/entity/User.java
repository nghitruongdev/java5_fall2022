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
@Table(name = "users")
public class User {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id", nullable = false)
    private int id;
    @Column(name = "username", nullable = false, length = 50)
    private String username;
    @Column(name = "password", nullable = true, length = 50)
    private String password;
    @Column(name = "full_name", nullable = true, length = 50)
    private String fullName;
    @Column(name = "email", nullable = true, length = 50)
    private String email;
    @Column(name = "phone", nullable = true, length = 10)
    private String phone;
    @Column(name = "role", nullable = true)
    private boolean admin;
    @ToString.Exclude
    @OneToMany(mappedBy = "user")
    private List<Order> ordersById;

}
