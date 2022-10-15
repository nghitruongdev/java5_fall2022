package com.fpoly.java5.helper;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

public class imgHelper {
    public String uploadImage(HttpServletRequest req) throws IOException, ServletException {
        // đường dẫn thư mục tính từ gốc của website
        File dir = new File(req.getServletContext().getRealPath("/images/sp"));
        if (!dir.exists()) { // tạo nếu chưa tồn tại
            dir.mkdirs();
        }
        // lưu các file upload vào thư mục sp
        Part photo = req.getPart("hinhAnh"); // file hình
        String filePath = photo.getSubmittedFileName();
        Path p = Paths.get(filePath); // creates a Path object
        String tenHinhAnh = p.getFileName().toString();
        File photoFile = new File(dir, filePath);
        if (!photoFile.exists()) {
            photo.write(photoFile.getAbsolutePath());
        }
        return tenHinhAnh;
    }
}
