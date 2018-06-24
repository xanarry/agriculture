package com.agriculture.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {
    @RequestMapping(method = RequestMethod.GET, value = {"/", "/index"})
    public String getIndex(ModelMap model) {
        System.out.println("GET /");
        model.addAttribute("index", "index");
        return "index";
    }

}
