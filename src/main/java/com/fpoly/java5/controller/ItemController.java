package com.fpoly.java5.controller;

import com.fpoly.java5.entity.Item;
import com.fpoly.java5.service.IShoppingCartService;
import com.fpoly.java5.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ItemController {

    @Autowired
    IShoppingCartService cartService;

    @Autowired
    SessionService sessionService;
    @RequestMapping("/items/index")
    public String showItems(){
        sessionService.add("items", Item.ITEM_DB.values());
        return "item_index";
    }

}
