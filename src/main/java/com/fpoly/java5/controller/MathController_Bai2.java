package com.fpoly.java5.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MathController_Bai2 {

    @GetMapping("/pheptinh/form")
    public ModelAndView pheptinh(ModelAndView mv) {
        mv.setViewName("pheptinh_form");
        return mv;
    }


    @GetMapping("/pheptinh")
    public ModelAndView pheptinh2(
            @RequestParam double num1,
            @RequestParam double num2,
            @RequestParam String pheptinh, ModelAndView mv) {
        mv.addObject("num1", num1).addObject("num2", num2).addObject("pheptinh", pheptinh);
        switch (pheptinh) {
            case "+":
                mv.addObject("result",num1 + num2 );
                break;
            case "-":
                mv.addObject("result", num1 - num2);
                break;
            case "*":
                mv.addObject("result", num1 * num2);
                break;
            case "/":
                try{
                    mv.addObject("result", num1 / num2);
                }catch(Exception e){
                    mv.addObject("result", e.getMessage());
                }
                break;
            default:
                mv.setViewName("redirect:/pheptinh/form");
                return mv;

        }

        mv.setViewName("pheptinh_form");
        return mv;
    }
}
