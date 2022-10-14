package com.fpoly.java5.repo;

import com.fpoly.java5.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Integer> {
    User findByUsernameAndPassword(String username, String password);

    boolean existsByUsernameAndPassword(String username, String password);

    User findByEmail(String email);

    User findByUsername(String username);


}