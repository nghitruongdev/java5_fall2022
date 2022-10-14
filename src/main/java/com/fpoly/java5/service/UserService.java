package com.fpoly.java5.service;

import com.fpoly.java5.dto.UserDto;
import com.fpoly.java5.entity.User;
import com.fpoly.java5.repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserService implements IUserService{


    @Autowired
    UserRepository repo;

    public User userValidate(String username, String password) {
        return repo.findByUsernameAndPassword(username, password);
    }

    @Override
    public User registerNewUserAccount(UserDto userDto) throws Exception {
        if (emailExists(userDto.getEmail())) {
            throw new Exception("There is an account with that email address: "
                    + userDto.getEmail());
        }
        User user = new User();
        user.setFullName(userDto.getFullname());
        user.setUsername(userDto.getPassword());
        user.setEmail(userDto.getEmail());
        user.setPhone(user.getPhone());

        return repo.save(user);
    }

    private boolean emailExists(String email) {
        return repo.findByEmail(email) != null;
    }



}
