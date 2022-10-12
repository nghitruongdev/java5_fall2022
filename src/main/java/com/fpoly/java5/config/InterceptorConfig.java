package com.fpoly.java5.config;

import com.fpoly.java5.service.interceptor.AuthInterceptor;
import com.fpoly.java5.service.interceptor.GlobalInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {
    @Autowired
    GlobalInterceptor globalInterceptor;
    @Autowired
    AuthInterceptor authInterceptor;
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(globalInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns("/assets/**");

        registry.addInterceptor(authInterceptor)
                .addPathPatterns("/account/edit","/account/chgpwd", "/order/**", "/admin/**")
                .excludePathPatterns("/assets/**", "/admin/home/index");
    }


}
