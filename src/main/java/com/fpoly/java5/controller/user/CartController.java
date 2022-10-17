package com.fpoly.java5.controller.user;

import com.fpoly.java5.service.CartService;
import com.fpoly.java5.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.NoSuchElementException;
import java.util.Optional;

@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired
    CartService cart;

    @Autowired
    SessionService session;

    @Autowired
    HttpServletRequest request;

    @RequestMapping("/view")
    public String viewCart(Model model) {
        return "cart/shopping-cart";
    }

    @RequestMapping("/add/{id}")
    public String add(@PathVariable String id) {
        try {
            cart.add(id);
        } catch (NoSuchElementException e) {
        }
        return "redirect:" + getPreviousPage();
    }

    @PostMapping("/remove/{id}")
    public String remove(@PathVariable String id) {
        cart.remove(id);
        return "redirect:/cart/view";
    }

    @PostMapping("/update")
    public String update(@RequestParam String id, @RequestParam Optional<Integer> quantity) {
        cart.update(id, quantity.get());
        return "redirect:/cart/view";
    }

    @RequestMapping("/clear")
    public String clear() {
        cart.clear();
        return "redirect:/";
    }

    private String getPreviousPage() {
        return request.getHeader("Referer");
    }
}
