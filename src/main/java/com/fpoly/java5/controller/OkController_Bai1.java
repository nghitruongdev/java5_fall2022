package com.fpoly.java5.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
//@RequestMapping("/ok")
public class OkController_Bai1 {

    @RequestMapping("/ok")
    public ModelAndView ok(ModelAndView mv){
        mv
                .addObject("message", "Opened from URL Links!")
                .setViewName("ok_form");
        return mv;
    }

    @PostMapping("/ctrl/ok")
    public ModelAndView ok1(ModelAndView mv){
        mv
                .addObject("message", "Button OK 1 is clicked")
                .setViewName("ok_form");
        return mv;
    }

    @GetMapping("/ctrl/ok")
    public ModelAndView ok2(ModelAndView mv){
        mv
                .addObject("message", "Button OK 2 is clicked")
                .setViewName("ok_form");
        return mv;
    }

    @PostMapping("/ctrl/ok3")
    public ModelAndView ok3(ModelAndView mv){
        mv
                .addObject("message", "Button OK 3 is clicked")
                .setViewName("ok_form");
        return mv;
    }



}
