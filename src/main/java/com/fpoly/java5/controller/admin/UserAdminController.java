package com.fpoly.java5.controller.admin;

import com.fpoly.java5.model.entity.User;
import com.fpoly.java5.service.UploadService;
import com.fpoly.java5.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/admin/users")
public class UserAdminController {
    @Autowired
    UserService service;
    @Autowired
    UploadService upload;
    final String USER_INDEX = "admin/user/index";

    @RequestMapping
    public String openProductPage(@ModelAttribute User user) {
//        product.setId("SP" + service.count());
        return USER_INDEX;
    }

    @RequestMapping("/{id}")
    public String openProduct(Model model, @PathVariable Integer id) {
        model.addAttribute("product", service.findById(id).orElse(new User()));
        return USER_INDEX;
    }

    @RequestMapping("/clear")
    public String clear() {
        return "redirect:/admin/users";
    }

    @PostMapping("/save")
    public String save(@Validated @ModelAttribute("user") User user,
                       BindingResult result,
                       MultipartFile attach,
                       Model model) throws IOException {
//        if (!attach.isEmpty()) user.set(upload.saveFile(attach));
        if (!result.hasErrors()) {
            service.save(user);
            model.addAttribute("message", "Lưu user thành công !");
            model.addAttribute("users", getUsers());
        } else {
            model.addAttribute("message", "Vui lòng kiểm tra lại thông tin sản phẩm!");
        }
        return USER_INDEX;
    }

    @PostMapping("/delete")
    public String delete(@ModelAttribute User user, Model model) {
        if (service.existsById(user.getId())) {
            service.deleteById(user.getId());
            model.addAttribute("message", "Xoá sản phẩm thành công");
        } else {
            model.addAttribute("message", "Không tìm thấy sản phẩm cần xoá!");
        }
        return "redirect:/admin/products";
    }

    @ModelAttribute("users")
    public List<User> getUsers() {
        return service.findAll();
    }
}
