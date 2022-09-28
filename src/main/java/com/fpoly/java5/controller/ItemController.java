package com.fpoly.java5.controller;

import com.fpoly.java5.repo.ItemDB;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ItemController {
    @RequestMapping("/items/index")
    public String showItems(Model model){
        model.addAttribute("items", ItemDB.ITEMS.values());
        return "item_index";
    }
}
