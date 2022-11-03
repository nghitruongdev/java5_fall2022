package com.fpoly.java5.repo;

import com.fpoly.java5.model.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Integer> {
    User findByUsernameAndPassword(String username, String password);

    boolean existsByUsernameAndPassword(String username, String password);

    User findByEmail(String email);

    User findByUsername(String username);

    boolean existsByUsername(String username);
}