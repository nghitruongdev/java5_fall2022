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
    ParamService param;
    @Autowired
    CookieService cookie;

    public boolean login(User localUser) {
        boolean remember = param.getBoolean("remember", false);
        User userDb = repo.findByUsername(localUser.getUsername());
        if (checkLoginInfo(userDb, localUser)) {
            saveLoginInfo(userDb, remember);
            session.add("loggedInUser", userDb);
            return true;
        }
        removeLoginInfo();
        return false;
    }

    public User getSaveUser() {
        String username = cookie.getValue("username");
        String password = cookie.getValue("password");
        return username == null ? null : new User(username, password);
    }


    public void logout() {
        session.remove("loggedInUser");
    }

    private boolean checkLoginInfo(User userDb, User localUser) {
        return userDb != null && userDb.getPassword().equals(localUser.getPassword());
    }

    private void saveLoginInfo(User user, boolean remember) {
        if (remember) {
            int hoursRemember = 10 * 24;
            cookie.add("username", user.getUsername(), hoursRemember);
            cookie.add("password", user.getPassword(), hoursRemember);
        } else {
            removeLoginInfo();
        }
    }

    private void removeLoginInfo() {
        cookie.remove("username");
        cookie.remove("password");
    }

}
