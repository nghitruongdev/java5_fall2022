package com.fpoly.java5.service;

import com.fpoly.java5.model.entity.User;
import com.fpoly.java5.repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserService {

    @Autowired
    UserRepository repo;


    public User findByUsername(String username) {
        return repo.findByUsername(username);
    }

    public User save(User user) {
        return repo.save(user);
    }


    public boolean isUserExist(User user) {
        return repo.existsByUsername(user.getUsername());
    }


}
