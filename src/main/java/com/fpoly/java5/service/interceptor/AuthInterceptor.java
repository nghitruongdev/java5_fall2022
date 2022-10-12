package com.fpoly.java5.service.interceptor;

import com.fpoly.java5.model.entity.Account;
import com.fpoly.java5.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Service
public class AuthInterceptor implements HandlerInterceptor {

    @Autowired
    SessionService session;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String uri = request.getRequestURI();
        Account user = session.get("user");
        String error = "";
        if (user == null) error = "Please Login!";
        else if (!user.isAdmin() && uri.startsWith("/admin")) error = "Access Denied!";
        if (!error.isEmpty()) {
            session.add("security-uri", uri);
            response.sendRedirect("/account/login?error=" + error);
            return false;
        }
        return true;
    }
}
