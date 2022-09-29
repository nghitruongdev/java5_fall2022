package com.fpoly.java5.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.Objects;

@Service
public class CookieService {
    @Autowired
    HttpServletRequest request;
    @Autowired
    HttpServletResponse response;

    /**
     * Đọc cookie từ request
     *
     * @param name tên cookie cần đọc
     * @return đối tượng cookie đọc được hoặc null nếu không tồn tại
     */
    public Cookie get(String name) {
        Objects.requireNonNull(name);
        Cookie[] cookies = Objects.requireNonNullElse(request.getCookies(), new Cookie[]{});
        return Arrays.asList(cookies)
                .stream()
                .filter(c -> name.equalsIgnoreCase(c.getName()))
                .findFirst().orElse(null);
    }

    /**
     * Đọc giá trị của cookie từ request
     *
     * @param name tên cookie cần đọc
     * @return chuỗi giá trị đọc được hoặc rỗng nếu không tồn tại
     */
    public String getValue(String name) {
        Cookie c = get(name);
        return c != null ? c.getValue() : null;
    }

    /**
     * Tạo và gửi cookie về client
     *
     * @param name  tên cookie
     * @param value giá trị cookie
     * @param hours thời hạn (giờ)
     * @return đối tượng cookie đã tạo
     */
    public Cookie add(String name, String value, int hours) {
        final int MINUTE = 60, SECOND = 60;
        Cookie c = new Cookie(name, value);
        c.setMaxAge(hours * MINUTE * SECOND);
        c.setPath("/");
        response.addCookie(c);
        return c;
    }

    /**
     * Xóa cookie khỏi client
     *
     * @param name tên cookie cần xóa
     */
    public void remove(String name) {
        add(name, null, 0);
    }
}
