package com.fpoly.java5.service;

import com.fpoly.java5.entity.User;
import com.fpoly.java5.repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    UserRepository repo;

    public User userValidate(String username, String password) {
        return repo.findByUsernameAndPassword(username, password);
    }
}
