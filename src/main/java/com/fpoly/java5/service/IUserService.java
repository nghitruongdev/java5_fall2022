package com.fpoly.java5.service;

import com.fpoly.java5.dto.UserDto;
import com.fpoly.java5.entity.User;

public interface IUserService {
    User registerNewUserAccount(UserDto userDto) throws Exception;
}
