package com.fpoly.java5.controller;

import com.fpoly.java5.entity.Product;
import com.fpoly.java5.repo.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    ProductRepository repo;

    @RequestMapping("/index")
    public String index(Model model) {
        model.addAttribute("items", repo.findAll());
        return "product/index";
    }

    @RequestMapping("/sort")
    public String sort(Model model,
                       @RequestParam("field") Optional<String> field) {
        String fieldName = field.orElse("id");
        model.addAttribute("field", fieldName);
        Sort sort = Sort.by(Sort.Direction.DESC, fieldName);
        model.addAttribute("items", repo.findAll(sort));
        return "product/index";
    }

    @RequestMapping("/page")
    public String page(Model model,
                       @RequestParam("p") Optional<Integer> page) {
        int pageSize = 5;
        Long totalCount = repo.count();
        int totalPage = (int) (totalCount / pageSize) +
                (totalCount % pageSize == 0 ? 0 : 1);
        int lastPage = totalPage - 1;
        int pageNumber = page.orElse(0);
        pageNumber = pageNumber < 0 ?
                0 :
                pageNumber <= lastPage ? pageNumber : lastPage;

        Pageable pageable = Pageable.ofSize(pageSize).withPage(pageNumber);
        Page<Product> products = repo.findAll(pageable);
        model.addAttribute("items", products.getContent());
        model.addAttribute("page", products);
        model.addAttribute("pageNumber", totalPage);
        return "product/index";
    }


}
