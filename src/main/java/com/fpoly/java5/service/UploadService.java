package com.fpoly.java5.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Service
public class UploadService {
    @Autowired
    ServletContext context;

    public String saveFile(MultipartFile attach) throws IOException {
        String fileName = attach.getOriginalFilename();
        Path path = Paths.get(context.getRealPath("upload"), fileName);
        if (!Files.exists(path.getParent())) {
            Files.createDirectories(path.getParent());
        }
        attach.transferTo(path);
        return fileName;
    }
}
