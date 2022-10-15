package com.fpoly.java5.controller;

import com.fpoly.java5.entity.Product;
import com.fpoly.java5.helper.imgHelper;
import com.fpoly.java5.repo.CategoryRepository;
import com.fpoly.java5.repo.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


@Controller
@RequestMapping("admin")
public class adminController {
    @Autowired
    CategoryRepository categoryDAO;
    @Autowired
    ProductRepository productDAO;

    imgHelper imgHelper = new imgHelper();

    @PostMapping("index/insert")
    public String Inser(Model model, @RequestParam("name") String nameString, @RequestParam("price") Optional<String> priceString, @RequestParam ("description") String descriptionString, @RequestParam("quantity") Optional<String> quantityString, @RequestParam("category_id") String categoryIDString, HttpServletRequest req) throws IOException, ServletException {
        String tenHinhAnh =  imgHelper.uploadImage(req).equals("")?req.getParameter("hinhAnhTonTai"):imgHelper.uploadImage(req);
        List<Optional<String>> list = new ArrayList<>();
//        list.add(categoryIDString);
//        list.add(priceString);

        Product product = new Product();
        productDAO.save(product);
        return "/admin/insert";
    }
}
