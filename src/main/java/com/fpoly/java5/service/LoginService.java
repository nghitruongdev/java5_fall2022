package com.fpoly.java5.service;

import com.fpoly.java5.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {
    @Autowired
    ParamService paramService;
    @Autowired
    CookieService cookieService;
    @Autowired
    SessionService sessionService;

    public boolean login() {
        String username = paramService.getString("username", "");
        String password = paramService.getString("password", "");
        boolean remember = paramService.getBoolean("remember", false);
            User user = new User(username, password);
        if (checkLoginInfo(user)) {
            saveLoginInfo(user, remember);
            sessionService.add("user", user);
            return true;
        }
        removeLoginInfo();
        return false;
    }

    public User getSaveUser(){
        String username = cookieService.getValue("username");
        String password = cookieService.getValue("password");
        return username == null ? null : new User(username, password);
    }


    public void logout() {
        sessionService.remove("user");
    }
    private boolean checkLoginInfo(User user){
        return "fpoly".equalsIgnoreCase(user.getUsername()) && "123".equals(user.getPassword());
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
