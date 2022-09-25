package com.fpoly.java5.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ResultController_Bai5 {

    @RequestMapping("/a")
    public String m1(Model model){
        model.addAttribute("message_a", "This is come from /a");
        return "result_bai5";
    }

    @RequestMapping("/b")
    public String m2(Model model){
        model.addAttribute("message_b", "This is come from /b");
        return "forward:/a";
    }

    @RequestMapping("/c")
    public String m3(RedirectAttributes params, Model model){
        model.addAttribute("message_c", "This is message model come from /c");
        params.addAttribute("message", "This is redirect attributes come from /c");
        return "redirect:/a";
    }

    @RequestMapping("/d")
    @ResponseBody
    public String m4(Model model){
        return "<h1>I come from /d,<br> and this is a Response body btw.</h1>";
    }



}
