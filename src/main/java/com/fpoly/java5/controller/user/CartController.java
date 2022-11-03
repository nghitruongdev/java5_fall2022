package com.fpoly.java5.controller.user;

import com.fpoly.java5.model.entity.Order;
import com.fpoly.java5.model.entity.OrderDetail;
import com.fpoly.java5.model.entity.Product;
import com.fpoly.java5.model.entity.User;
import com.fpoly.java5.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired
    CartService cart;

    @Autowired
    SessionService session;

    @Autowired
    HttpServletRequest request;
    @Autowired
    OrderService orderService;

    @Autowired
    OrderDetailService detailService;

    @Autowired
    UserService userService;

    @RequestMapping("/view")
    public String viewCart(Model model) {
        return "cart/shopping-cart";
    }

    @RequestMapping("/checkout")
    public String checkout(@ModelAttribute Order order) {
        return "cart/shopping-cart";
    }

    @PostMapping("/checkout")
    public String placeOrder(@ModelAttribute Order order,
                             BindingResult result,
                             Model model) {
        if (!result.hasErrors()) {
            order.setUser((User) session.get("loggedInUser").orElse(null));
            cart.getItems().stream().forEach(order::addOrderDetail);
            orderService.placeAnOrder(order);
            cart.clear();
            return "redirect:/";
        }
        return "redirect:" + getPreviousPage();
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
    public String update(@RequestParam String id, @RequestParam Optional<Integer> quantity, Model model) {
        try {
            int quantityVal = quantity.orElse(0);
            if (quantityVal == 0) cart.remove(id);
            else
                cart.update(id, quantityVal);
        } catch (Exception e) {
            model.addAttribute("message", e.getMessage());
        }
        return "redirect:/cart/view";
    }

    @RequestMapping("/clear")
    public String clear() {
        cart.clear();
        return "redirect:/";
    }

    @RequestMapping("/api/getAll")
    @ResponseBody
    public Collection<Product> saveMap() {
        return cart.getItems();
    }

    @PostMapping(value = "/api/load", consumes = {"application/json"})
    @ResponseBody
    public int load(@RequestBody List<Product> list) {
        cart.addItems(list);
        return cart.getCount();
    }

    private String getPreviousPage() {
        return request.getHeader("Referer");
    }

}
