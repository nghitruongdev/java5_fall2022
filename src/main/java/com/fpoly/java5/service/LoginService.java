package com.fpoly.java5.service;

import com.fpoly.java5.entity.User;
import com.fpoly.java5.repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

    @Autowired
    UserService userService;
    @Autowired
    UserRepository repo;
    @Autowired
    SessionService sessionService;

    @Autowired
    ParamService paramService;

    @Autowired
    CookieService cookieService;


    public boolean login() {
        String username = paramService.getString("username", "");
        String password = paramService.getString("password", "");
        boolean remember = paramService.getBoolean("remember", false);
        User user = userService.userValidate(username, password);
        if (checkLoginInfo(user)) {
            saveLoginInfo(user, remember);
            sessionService.add("user", user);
            return true;
        }
        removeLoginInfo();
        return false;
    }

    public void register() {

    }

    public User getSaveUser() {
        String username = cookieService.getValue("username");
        String password = cookieService.getValue("password");
        User user = null;
        user.setUsername(username);
        user.setPassword(password);
        return username == null ? null : user;
    }


    public void logout() {
        sessionService.remove("user");
    }

    private boolean checkLoginInfo(User user) {
        return repo.existsByUsernameAndPassword(user.getUsername(), user.getPassword());
    }

    private boolean checkAdmin(User user) {
        return user.isAdmin();
    }

    private void saveLoginInfo(User user, boolean remember) {
        if (remember) {
            System.out.println(remember);
            int hoursRemember = 10 * 24;
            cookieService.add("username", user.getUsername(), hoursRemember);
            cookieService.add("password", user.getPassword(), hoursRemember);
        } else {
            removeLoginInfo();
        }
    }

    private void removeLoginInfo() {
        cookieService.remove("username");
        cookieService.remove("password");
    }

}
