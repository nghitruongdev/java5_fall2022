package com.fpoly.java5.controller.user;

import com.fpoly.java5.service.CartService;
import com.fpoly.java5.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.NoSuchElementException;

@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired
    CartService cart;

    @Autowired
    SessionService session;

    @Autowired
    HttpServletRequest request;

    @RequestMapping("/add/{id}")
    public String add(@PathVariable String id) {
        try{
            cart.add(id);
        }catch (NoSuchElementException e) {}
        return "redirect:" + getPreviousPage();
    }

    @RequestMapping("/remove/{id}")
    public String remove(@PathVariable String id) {
        cart.remove(id);
        return "redirect:" + getPreviousPage();
    }

    private String getPreviousPage() {
        return request.getHeader("Referer");
    }
}
