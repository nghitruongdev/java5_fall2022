package com.fpoly.java5.controller;

import com.fpoly.java5.entity.Product;
import com.fpoly.java5.repo.ProductRepository;
import com.fpoly.java5.service.SessionService;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    ProductRepository repo;

    @Autowired
    SessionService session;

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
        int pageNumber = checkPageNumber(page.orElse(0), pageSize);

        Pageable pageable = Pageable.ofSize(pageSize).withPage(pageNumber);
        Page<Product> products = repo.findAll(pageable);
        model.addAttribute("items", products.getContent());
        model.addAttribute("page", products);
        return "product/index";
    }

    @RequestMapping("/search")
    public String search(Model model,
                         @RequestParam("min") Optional<Double> min,
                         @RequestParam("max") Optional<Double> max) {
        double minValue = min.orElse(Double.MIN_VALUE);
        double maxValue = max.orElse(Double.MAX_VALUE);
//        List<Product> items = repo.findByPrice(minValue, maxValue);
        List<Product> items = repo.findByPriceBetween(minValue, maxValue);
        model.addAttribute("items", items);
        model.addAttribute("min", minValue);
        model.addAttribute("max", maxValue);
        return "product/index";
    }

    @RequestMapping("/search-and-page")
    public String searchAndPage(Model model,
                                @RequestParam("keyword") Optional<String> keyword,
                                @RequestParam("page") Optional<Integer> page) {
        String keywordValue = keyword.orElse(session.getOrDefault("keyword", ""));
        session.add("keyword", keywordValue);
        int pageSize = 5;
        int pageNumber = checkPageNumber(page.orElse(0), pageSize);
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        Page<Product> pages = repo.findByKeyword('%' + keywordValue + '%', pageable);
        model.addAttribute("items", pages.getContent());
        model.addAttribute("page", pages);
        return "/product/index";
    }

    private int checkPageNumber(int pageNumber, int pageSize) {
        Long totalCount = repo.count();
        int totalPage = (int) (totalCount / pageSize) +
                (totalCount % pageSize == 0 ? 0 : 1);
        int lastPage = totalPage - 1;
        return pageNumber < 0 ?
                0 :
                pageNumber <= lastPage ? pageNumber : lastPage;
    }
}
