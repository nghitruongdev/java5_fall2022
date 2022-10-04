package com.fpoly.java5.repo;

import com.fpoly.java5.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Integer> {
}