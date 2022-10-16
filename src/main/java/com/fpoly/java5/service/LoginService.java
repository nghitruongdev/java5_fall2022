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
    SessionService sessionService;

    @Autowired
    ParamService paramService;

    @Autowired
    CookieService cookieService;


    public boolean login() {
        String username = paramService.getString("username", "");
        String password = paramService.getString("password", "");
        boolean remember = paramService.getBoolean("remember", false);
        // Create local user to store client input
        User localUser = new User();
        // Local user will now store username and password from client
        localUser.setUsername(username);
        localUser.setPassword(password);
        // Use database user to compare with client input
        User userDb = repo.findByUsername(username);
        // Check if client input is equal to database user or not
        if (checkLoginInfo(userDb, localUser)) {
            saveLoginInfo(userDb, remember);
            sessionService.add("user", userDb);
            return true;
        }
        removeLoginInfo();
        return false;
    }

    public boolean getAdmin(String username) {
        User user = repo.findByUsername(username);
        return user.isAdmin();
    }
//
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
        sessionService.remove("user");
    }

    private boolean checkLoginInfo(User userDb, User localUser) {
        return localUser.equals(userDb);
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
