package com.fpoly.java5.controller;

import com.fpoly.java5.service.SessionService;
import com.fpoly.java5.service.ShoppingCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class ShoppingCartController {
    @Autowired
    ShoppingCartService cartService;
    @Autowired
    SessionService sessionService;

    @RequestMapping("/cart/view")
    public String viewCart(Model model) {
//        sessionService.add("cart", cartService);
        return "shopping-cart";
    }

    @PostMapping("/cart/add/{id}")
    public String addItem(@PathVariable("id") Integer id, Model model) {
        String message;
        try {
            cartService.add(id);
            message = "Đã thêm sản phẩm vào giỏ hàng";
        } catch (Exception e) {
            message = e.getMessage();
        }
        model.addAttribute("message", message);
        return "index";
    }

    @PostMapping("/cart/update")
    public String updateItem(
            @RequestParam("id") Integer id,
            @RequestParam(value = "qty", defaultValue = "1") Integer qty,
            Model model) {
        String message;
        try {
            cartService.update(id, qty);
            message = "Đã cập nhật số lượng sản phẩm";
        } catch (Exception e) {
            message = e.getMessage();
        }
        model.addAttribute("message", message);
        return "forward:/cart/view";
    }

    @PostMapping("/cart/remove/{id}")
    public String removeItem(@PathVariable("id") Integer id, Model model) {
        cartService.remove(id);
        model.addAttribute("message", "Đã xoá sản phẩm khỏi giỏ hàng");
        return "forward:/cart/view";
    }

    @RequestMapping("/cart/clear")
    public String clearCart() {
        cartService.clear();
        return "index";
    }


}
