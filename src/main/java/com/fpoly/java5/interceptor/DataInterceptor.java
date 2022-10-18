package com.fpoly.java5.interceptor;

import com.fpoly.java5.service.CartService;
import com.fpoly.java5.service.CategoryService;
import com.fpoly.java5.service.LoginService;
import com.fpoly.java5.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Service
public class DataInterceptor implements HandlerInterceptor {

    @Autowired
    CategoryService categoryService;

    @Autowired
    CartService cartService;

    @Autowired
    LoginService loginService;

    @Autowired
    SessionService session;

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        String uri = request.getRequestURI();
        boolean isAbout = uri.startsWith("/about");
        boolean isProduct = uri.startsWith("/products") || uri.startsWith("/categories");
        boolean isContact = uri.startsWith("/contact");
        boolean isHome = !(isAbout || isProduct || isContact);
        request.setAttribute("uri", uri);
        request.setAttribute("isAbout", isAbout);
        request.setAttribute("isProduct", isProduct);
        request.setAttribute("isContact", isContact);
        request.setAttribute("isHome", isHome);
        request.setAttribute("categories", categoryService.findAll());
        request.setAttribute("cart", cartService);

        request.setAttribute("savedUser", loginService.getSaveUser());
        session.add("title", "default Title from java");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
    }
}
