package com.fpoly.java5.controller.user;

import com.fpoly.java5.entity.Product;
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

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Controller
public class ProductController {
    private static final int PAGE_SIZE = 1;
    @Autowired
    ProductService productService;

    @Autowired
    ProductRepository repo;

    @RequestMapping("/products")
    public String index(Model model, @RequestParam("page")Optional<Integer> page) {
        long totalElements = productService.count();
        int pageNumber = getPageNumber(page, totalElements);
        Pageable pageable = PageRequest.of(pageNumber, PAGE_SIZE);
        Page<Product> products = productService.findAll(pageable);
        model.addAttribute("products", products.getContent());
        model.addAttribute("pages", getPages(products));
        model.addAttribute("page", products);
        return "product/index";

    }

    @RequestMapping("/products/{id}")
    public String byCategory(Model model, @PathVariable String id, @RequestParam("page") Optional<Integer> page) {
        long totalElements = productService.countByCategoryId(id);
        int pageNumber = getPageNumber(page, totalElements);
        Pageable pageable = PageRequest.of(pageNumber, PAGE_SIZE);
        Page<Product> products = productService.findByCategoryId(id, pageable);
        model.addAttribute("products", products.getContent());
        model.addAttribute("pages", getPages(products));
        model.addAttribute("page", products);
        return "product/index";
    }

    private int[] getPages(Page page) {
        int current = page.getNumber() + 1;
        if (page.getTotalPages() > 3) {
            if (page.isFirst())
                return new int[]{current, current + 1, current + 2};
            else if (page.isLast())
                return new int[]{current - 2, current - 1, current};
            else return new int[]{current - 1, current, current + 1};
        }
        int[] array = new int[page.getTotalPages()];
        for (int i = 1; i <= page.getTotalPages(); i++) {
            array[i] = i;
        }
        return array;
    }

    private int getPageNumber(Optional<Integer> page, long totalElements) {
        int totalPages = (int) Math.ceil(totalElements * 1d / PAGE_SIZE);
        int pageNumber = page.orElse(1);

        return pageNumber <= 0 ? 0 :
                pageNumber > totalPages ?
                        totalPages - 1 : pageNumber - 1;
    }

}
