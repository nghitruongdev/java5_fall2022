package com.fpoly.java5.service;

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

        if ("fpoly".equalsIgnoreCase(username) && "123".equals(password)) {
            if (remember) {
                int hoursRemember = 10 * 24;
                cookieService.add("user", username, hoursRemember);
            }
            return true;
        }
        cookieService.remove("user");
        return false;
    }
}
