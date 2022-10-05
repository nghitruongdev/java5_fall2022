package com.fpoly.java5.service;

import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpSession;

public class SessionService {
    @Autowired
    HttpSession session;

    /**
     * Đọc giá trị của attribute trong session
     * @param name tên attribute
     * @return giá trị đọc được hoặc null nếu không tồn tại
     */
    public <T> T get(String name) {
        return (T) session.getAttribute(name);
    }

    /**
     * Thay đổi hoặc tạo mới attribute trong session
     * @param name tên attribute
     * @param value giá trị attribute
     */
    public void add(String name, Object value) {
        session.setAttribute(name, value);
    }

    /**
     * Xóa attribute trong session
     * @param name tên attribute cần xóa
     */
    public void remove(String name) {
        session.removeAttribute(name);
    }
}
