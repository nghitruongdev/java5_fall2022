package com.fpoly.java5.controller;

import com.fpoly.java5.domain.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class StudentController {
    @Autowired
    ServletContext context;

    @RequestMapping("/student/form")
    public String form(@ModelAttribute("student") Student st) {
        return "student_form";
    }


    @PostMapping("/student/save")
    public String save(Model model,
                       @Validated @ModelAttribute("student") Student st,
                       BindingResult result,
                       @RequestPart("attach") MultipartFile attach) throws IOException {
        if (!attach.isEmpty()) {
           String img =  saveFile( attach);
           st.setImg(img);
        }

        if (result.hasErrors()) {
            model.addAttribute("message", "Vui lòng kiểm tra lại thông tin nhập");
        } else {
            model.addAttribute("message", "Xin chúc mừng! Cập nhật thông tin thành công.");
        }
        return "student_form";
    }

    @ModelAttribute("hobbies")
    public Map<String, String> getHobbies() {
        Map<String, String> map = new HashMap<>();
        map.put("T", "Travelling");
        map.put("R", "Reading");
        map.put("L", "Loving");
        return map;
    }

    @ModelAttribute("genders")
    public Map<Boolean, String> getGenders() {
        Map<Boolean, String> map = new HashMap<>();
        map.put(true, "Male");
        map.put(false, "Female");
        return map;
    }

    @ModelAttribute("faculties")
    public List<String> getFaculties() {
        return Arrays.asList(
                "Công Nghệ Thông Tin",
                "Du Lịch Nhà Hàng Khách Sạn",
                "Lập Trình Máy Tính",
                "Ứng Dụng Phần Mềm");
    }

    private String saveFile( MultipartFile attach) throws IOException {
        String fileName = attach.getOriginalFilename();
        Path path = Paths.get(context.getRealPath("upload" + File.separator + fileName));
        if (!Files.exists(path.getParent())) {
            Files.createDirectory(path.getParent());
        }
        attach.transferTo(path);
        return File.separator + "upload" + File.separator + fileName;
    }

}
