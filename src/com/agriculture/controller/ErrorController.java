package com.agriculture.controller;

import com.agriculture.controller.beans.ErrorMessageBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ErrorController {
    @RequestMapping(value = "/error", method = RequestMethod.GET)
    public String error(ErrorMessageBean error, ModelMap modelMap) {
        modelMap.addAttribute("title", error.getTitle());
        modelMap.addAttribute("head", error.getHead());
        modelMap.addAttribute("message", error.getMessage());
        modelMap.addAttribute("url", error.getUrl());
        modelMap.addAttribute("linkText", error.getLinkText());
        return "error";
    }
}
