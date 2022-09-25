package com.fpoly.java5.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ParamController_Bai2 {
    @RequestMapping("/param/form")
    public ModelAndView openForm(ModelAndView mv){
        mv.setViewName("param_form");
        return mv;
    }
    @GetMapping("/param/form/{var}")
    public ModelAndView openForm1(
            @PathVariable String var,
            @RequestParam String par,
            ModelAndView mv){
        mv.addObject("var", var)
                .addObject("par", par)
                .setViewName("param_form");
        return mv;
    }
}
