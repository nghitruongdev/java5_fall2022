package com.fpoly.java5.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;
import java.util.Optional;

@Service
public class ParamService {
    @Autowired
    HttpServletRequest request;

    @Autowired
    ServletContext context;

    private Optional<String> getParam(String name) {
        Objects.requireNonNull(name);
        return Optional.ofNullable(request.getParameter(name)).filter(s -> !s.isEmpty());
    }

    /**
     * Đọc chuỗi giá trị của tham số
     * @param name         tên tham số
     * @param defaultValue giá trị mặc định
     * @return giá trị tham số hoặc giá trị mặc định nếu không tồn tại
     */
    public String getString(String name, String defaultValue) {
        Objects.requireNonNull(defaultValue);
        return getParam(name).orElse(defaultValue);
    }

    /**
     * Đọc số nguyên giá trị của tham số
     * @param name         tên tham số
     * @param defaultValue giá trị mặc định
     * @return giá trị tham số hoặc giá trị mặc định nếu không tồn tại
     */
    public int getInt(String name, int defaultValue) {
        Objects.requireNonNull(defaultValue);
        return getParam(name).map(Integer::parseInt).orElse(defaultValue);
    }

    /**
     * Đọc số thực giá trị của tham số
     * @param name         tên tham số
     * @param defaultValue giá trị mặc định
     * @return giá trị tham số hoặc giá trị mặc định nếu không tồn tại
     */
    public double getDouble(String name, double defaultValue) {
        Objects.requireNonNull(defaultValue);
        return getParam(name).map(Double::parseDouble).orElse(defaultValue);
    }

    /**
     * Đọc giá trị boolean của tham số
     * @param name         tên tham số
     * @param defaultValue giá trị mặc định
     * @return giá trị tham số hoặc giá trị mặc định nếu không tồn tại
     */
    public boolean getBoolean(String name, boolean defaultValue) {
        Objects.requireNonNull(defaultValue);
        return getParam(name).map(Boolean::parseBoolean).orElse(defaultValue);
    }

    /**
     * Đọc giá trị thời gian của tham số
     * @param name    tên tham số
     * @param pattern là định dạng thời gian
     * @return giá trị tham số hoặc null nếu không tồn tại
     * @throws RuntimeException lỗi sai định dạng
     */
    public Date getDate(String name, String pattern) throws RuntimeException {
        DateFormat df = new SimpleDateFormat(pattern);
        return getParam(name).map(date -> {
            try {
                return df.parse(date);
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }
        }).orElse(null);
    }

    /**
     * Lưu file upload vào thư mục
     * @param file       chứa file upload từ client
     * @param folderPath đường dẫn tính từ webroot
     * @return đối tượng chứa file đã lưu hoặc null nếu không có file upload
     * @throws RuntimeException lỗi lưu file
     */
    public File save(MultipartFile file, String folderPath) throws IOException {
        String fileName = file.getOriginalFilename();
        Path path = Paths.get(context.getRealPath(folderPath), fileName);
        if (Files.notExists(path.getParent())) Files.createDirectories(path.getParent());
        file.transferTo(path);
        return path.toFile();
    }
}
