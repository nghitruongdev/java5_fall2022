package com.fpoly.java5.config;

import com.fpoly.java5.interceptor.DataInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

    @Autowired
    DataInterceptor dataInterceptor;
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(dataInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns("/assets/**");
    }
}
