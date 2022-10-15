package com.fpoly.java5.interceptor;

import com.fpoly.java5.repo.CategoryRepository;
import com.fpoly.java5.repo.ProductRepository;
import com.fpoly.java5.service.CategoryService;
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
    }

}
