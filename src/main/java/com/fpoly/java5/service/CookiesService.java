package com.fpoly.java5.service;

import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookiesService {
    @Autowired
    HttpServletRequest req;
    @Autowired
    HttpServletResponse res;

    public Cookie get(String name) {
        Cookie[] cookies = req.getCookies();
        if(cookies != null) {
            for(Cookie cookie : cookies) {
                if(cookie.getName().equalsIgnoreCase(name)) {
                    return cookie;
                }
            }
        }
        return null;
    }

    public String getValue(String name) {
        Cookie cookie = get(name);
        if(cookie != null) {
            return cookie.getValue();
        }
        return null;
    }

    public Cookie add(String name, String value, int hours) {
        Cookie cookie = new Cookie(name, value);
        cookie.setMaxAge(hours*60*60);
        cookie.setPath("/");
        res.addCookie(cookie);
        return cookie;
    }
    public void remove(String name) {
        add(name, "", 0);
    }
}
