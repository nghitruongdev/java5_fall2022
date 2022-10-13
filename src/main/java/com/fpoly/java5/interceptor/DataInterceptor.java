package com.fpoly.java5.interceptor;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Service
public class DataInterceptor implements HandlerInterceptor {

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        String uri = request.getRequestURI();
        request.setAttribute("isAbout", uri.startsWith("/about"));
        request.setAttribute("isProduct", uri.startsWith("/products"));
        request.setAttribute("isContact", uri.startsWith("/contact"));

    }
}
