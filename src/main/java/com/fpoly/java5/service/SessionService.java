package com.fpoly.java5.service;

import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

@Service
public class SessionService {
    @Autowired
    HttpSession session;

    /**
     * Đọc giá trị của attribute trong session
     *
     * @param name tên attribute
     * @return giá trị đọc được hoặc null nếu không tồn tại
     */
    public <T> T get(String name) {
        return (T) session.getAttribute(name);
    }

    /**
     * Đọc giá trị của attribute trong session
     *
     * @param name         tên attribute
     * @param defaultValue giá trị mặc định nếu không tồn tại
     * @return giá trị đọc được hoặc null nếu không tồn tại
     */
    public <T> T get(String name, T defaultValue) {
        T o = (T) session.getAttribute(name);
        return o == null ? defaultValue : o;
    }

    /**
     * Thay đổi hoặc tạo mới attribute trong session
     *
     * @param name  tên attribute
     * @param value giá trị attribute
     */
    public void add(String name, Object value) {
        session.setAttribute(name, value);
    }

    /**
     * Xóa attribute trong session
     *
     * @param name tên attribute cần xóa
     */
    public void remove(String name) {
        session.removeAttribute(name);
    }
}
