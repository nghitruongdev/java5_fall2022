package com.fpoly.java5.interceptor;

import com.fpoly.java5.model.entity.User;
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
        User loggedInUser = (User) session.get("loggedInUser").orElse(null);
        boolean isLoggedIn = loggedInUser != null;
        boolean isAdmin = isLoggedIn && loggedInUser.isAdmin();
        boolean isAdminPage = uri.startsWith("/admin");
        boolean isCheckoutPage = uri.contains("/checkout");

        if (isAdminPage) {
            if (!isLoggedIn) {
                session.add("security-uri", uri);
                response.sendRedirect("/account/login");
            } else if (!isAdmin) {
                response.sendRedirect("/");
            }
        } else if (isCheckoutPage) {
            if (!isLoggedIn) {
                session.add("security-uri", uri);
                response.sendRedirect("/account/login");
            }
        }
        return isCheckoutPage && isLoggedIn || isAdminPage && isAdmin;
    }
}
