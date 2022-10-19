package com.fpoly.java5.controller.admin;

import com.fpoly.java5.model.entity.Product;
import com.fpoly.java5.service.ProductService;
import com.fpoly.java5.service.UploadService;
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
@RequestMapping("/admin/products")
public class ProductAdminController {
    @Autowired
    ProductService service;
    @Autowired
    UploadService upload;
    final String PRODUCT_INDEX = "admin/product/index";

    @RequestMapping
    public String openProductPage(@ModelAttribute Product product) {
        product.setId("SP" + service.count());
        return PRODUCT_INDEX;
    }

    @RequestMapping("/{id}")
    public String openProduct(Model model, @PathVariable String id) {
        model.addAttribute("product", service.findById(id).orElse(new Product()));
        return PRODUCT_INDEX;
    }

    @RequestMapping("/clear")
    public String clear() {
        return "redirect:/admin/products";
    }

    @PostMapping("/save")
    public String save(@Validated @ModelAttribute("product") Product product,
                       BindingResult result,
                       MultipartFile attach,
                       Model model) throws IOException {
        if (!attach.isEmpty()) product.setImg(upload.saveFile(attach));
        if (!result.hasErrors()) {
            service.save(product);
            model.addAttribute("message", "Lưu sản phẩm thành công !");
            model.addAttribute("products", getProducts());
        } else {
            model.addAttribute("message", "Vui lòng kiểm tra lại thông tin sản phẩm!");
        }
        return PRODUCT_INDEX;
    }

    @PostMapping("/delete")
    public String delete(@ModelAttribute Product product, Model model) {
        try {
            if (service.existsById(product.getId())) {
                service.deleteById(product.getId());
                model.addAttribute("message", "Xoá sản phẩm thành công");
            } else {
                model.addAttribute("message", "Không tìm thấy sản phẩm cần xoá!");
            }
        } catch (Exception e) {
            model.addAttribute("message", e.getMessage());
        }
        return "redirect:/admin/products";
    }

    @ModelAttribute("products")
    public List<Product> getProducts() {
        return service.findAll();
    }
}
