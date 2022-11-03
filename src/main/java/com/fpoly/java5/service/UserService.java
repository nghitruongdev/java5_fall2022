package com.fpoly.java5.service;

import com.fpoly.java5.model.entity.Product;
import com.fpoly.java5.model.entity.User;
import com.fpoly.java5.repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

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

    public Optional<User> findById(int id) {
        return repo.findById(id);
    }

    public List<User> findAll() {
        return repo.findAll();
    }

    public void deleteById(int id) {
        repo.deleteById(id);
    }

    public boolean existsById(int id) {
        return repo.existsById(id);
    }
}
