package com.fpoly.java5.model.entity;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Entity
@Table(name = "users")
public class User {
    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id", nullable = false)
    private int id;

    @Column(name = "username", nullable = false, length = 50)
    @NotEmpty(message = "Username cannot be null")
    @NotNull(message = "Not null")
    @NotBlank
    private String username;

    @Column(name = "password", nullable = true, length = 50)
    @NotBlank
    @NotNull(message = "Not null")
    @NotEmpty(message = "Password cannot be null")
    private String password;

    @Column(name = "full_name", nullable = true, length = 50)
    @NotNull
    @NotEmpty(message = "Cannot be null")
    private String fullName;

    @Column(name = "email", nullable = true, length = 50)
    @Email(message = "Wrong email type")
    @NotNull(message = "Not null")
    @NotEmpty(message = "Email cannot be null")
    private String email;

    @Column(name = "phone", nullable = true, length = 10)
    private String phone;

    @Column(name = "role", nullable = true)
    private boolean admin;

    @ToString.Exclude
    @OneToMany(mappedBy = "user")
    private List<Order> ordersById;

    @Column(name = "img", nullable = true, length = 50)
    private String img;

    @Column(name = "address", nullable = true, length = 255)
    private String address;
}
