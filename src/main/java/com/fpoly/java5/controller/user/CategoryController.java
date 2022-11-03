package com.fpoly.java5.controller.user;

import com.fpoly.java5.model.entity.Product;
import com.fpoly.java5.repo.ProductRepository;
import com.fpoly.java5.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
public class CategoryController {
    private static final int PAGE_SIZE = 6;
    @Autowired
    ProductService productService;

    @Autowired
    ProductRepository repo;

    @RequestMapping("/categories/all")
    public String index(Model model, @RequestParam("page") Optional<Integer> page) {
        long totalElements = productService.count();
        Pageable pageable = getPageable(page, totalElements);
        Page<Product> products = productService.findAll(pageable);
        addAttribute(model, products);
        return "product/index";
    }

    @RequestMapping("/categories/{categoryId}")
    public String byCategory(Model model, @PathVariable String categoryId, @RequestParam("page") Optional<Integer> page) {
        long totalElements = productService.countByCategoryId(categoryId);
        Pageable pageable = getPageable(page, totalElements);
        Page<Product> products = productService.findByCategoryId(categoryId, pageable);
        addAttribute(model, products);
        return "product/index";
    }

    private Pageable getPageable(Optional<Integer> page, long totalElements) {
        int pageNumber = getPageNumber(page, totalElements);
        return PageRequest.of(pageNumber, PAGE_SIZE);
    }

    private void addAttribute(Model model, Page page) {
        model.addAttribute("products", page.getContent());
        model.addAttribute("page", page);
        if (page.getTotalPages() > 0)
            addPages(model, page);
    }

    private void addPages(Model model, Page page) {
        int current = page.getNumber();
        int lastPage = page.getTotalPages() - 1;
        int total = 5;

        int begin = current - 2 >= 0 ? current - 2 : 0;
        int end = begin + total - 1;
        end = end > lastPage ? lastPage : end;
        begin = end - total + 1;
        begin = begin >= 0 ? begin : 0;
        model.addAttribute("begin", begin);
        model.addAttribute("end", end);
        model.addAttribute("pages", new int[page.getTotalPages()]);
    }

    private int getPageNumber(Optional<Integer> page, long totalElements) {
        int totalPages = (int) Math.ceil(totalElements * 1d / PAGE_SIZE);
        int pageNumber = page.orElse(1);

        return totalPages == 0 || pageNumber <= 0 ? 0 :
                pageNumber > totalPages ?
                        totalPages - 1 : pageNumber - 1;
    }
}
