package com.fpoly.java5.controller;

import com.fpoly.java5.service.SessionService;
import com.fpoly.java5.service.ShoppingCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class ShoppingCartController {
    @Autowired
    ShoppingCartService cartService;
    @Autowired
    SessionService sessionService;
    @RequestMapping("/cart/view")
    public String viewCart(){
        sessionService.add("cartItems", cartService.getItems());
        return "item_index";
    }

    @PostMapping("/cart/add/{id}")
    public String addItem(@PathVariable("id") Integer id){
        cartService.add(id);
        return "redirect:/cart/view";
    }

    @PostMapping("/cart/update")
    public String updateItem(
            @RequestParam("id") Integer id,
            @RequestParam("qty") Integer qty
    ){
        cartService.update(id, qty);
        return "redirect:/cart/view";
    }

    @PostMapping("/cart/remove/{id}")
    public String removeItem(@PathVariable("id") Integer id){
        cartService.remove(id);
        return "redirect:/cart/view";
    }

    @RequestMapping("/cart/clear")
    public String clearCart(){
        cartService.clear();
        return "redirect:/cart/view";
    }





}
