package com.fpoly.java5.model.entity;

import lombok.*;
import org.hibernate.Hibernate;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Collection;

@Getter
@Setter
@ToString
@AllArgsConstructor
@RequiredArgsConstructor
@Entity
@Table(name = "accounts")
public class Account implements Serializable {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private String username;
    private boolean activated;
    private boolean admin;
    private String email;
    private String fullname;
    private String password;
    private String photo;
    @OneToMany(mappedBy = "account")
    @ToString.Exclude
    private Collection<Order> orders;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;

        Account account = (Account) o;

        if (activated != account.activated) return false;
        if (admin != account.admin) return false;
        if (username != null ? !username.equals(account.username) : account.username != null) return false;
        if (email != null ? !email.equals(account.email) : account.email != null) return false;
        if (fullname != null ? !fullname.equals(account.fullname) : account.fullname != null) return false;
        if (password != null ? !password.equals(account.password) : account.password != null) return false;
        if (photo != null ? !photo.equals(account.photo) : account.photo != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = username != null ? username.hashCode() : 0;
        result = 31 * result + (activated ? 1 : 0);
        result = 31 * result + (admin ? 1 : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (fullname != null ? fullname.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (photo != null ? photo.hashCode() : 0);
        return result;
    }
}
