package com.fpoly.java5.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController_Bai2 {

    @RequestMapping("/sanpham")
    public ModelAndView showSanPham(ModelAndView mv){
       mv.setViewName("list_sanpham");
        return mv;
    }
    @RequestMapping("/sanpham/{sp}")
    public ModelAndView showSanPham1(ModelAndView mv,@PathVariable String sp){
       mv.addObject("sp", sp).setViewName("list_sanpham");
        return mv;
    }

}
