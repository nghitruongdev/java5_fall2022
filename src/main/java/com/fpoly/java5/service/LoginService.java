package com.fpoly.java5.service;

import com.fpoly.java5.model.entity.User;
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
    SessionService session;
    @Autowired
    ParamService paramService;
    @Autowired
    CookieService cookieService;


    public boolean login(User localUser) {
        boolean remember = paramService.getBoolean("remember", false);
        User userDb = repo.findByUsername(localUser.getUsername());
        if (checkLoginInfo(userDb, localUser)) {
            saveLoginInfo(userDb, remember);
            session.add("loggedInUser", userDb);
            return true;
        }
        removeLoginInfo();
        return false;
    }

    //    public User getSaveUser() {
//        String username = cookieService.getValue("username");
//        String password = cookieService.getValue("password");
//        User user = null;
//        user.setUsername(username);
//        user.setPassword(password);
//        return username == null ? null : user;
//    }
//


    public void logout() {
        session.remove("user");
    }

    private boolean checkLoginInfo(User userDb, User localUser) {
        return localUser.equals(userDb);
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
