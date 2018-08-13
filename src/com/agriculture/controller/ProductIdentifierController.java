package com.agriculture.controller;

import com.agriculture.dataBase.dao.ProductIdentifierDao;
import com.agriculture.dataBase.domain.ProductIdentifier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/product-identifier")
public class ProductIdentifierController {
    @Autowired
    ProductIdentifierDao productIdentifierDao;

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addIdentifier(@RequestParam("produceTaskID") String taskID, @RequestParam("count") Integer count) {
        List<String> identifiers = generateIdentifiers(count);
        for (String identifier:identifiers) {
            ProductIdentifier productIdentifier = new ProductIdentifier();
            productIdentifier.setProduceTaskID(taskID);
            productIdentifier.setIdentifier(identifier);

            productIdentifierDao.addProductIdentifier(productIdentifier);
        }
        return "redirect:/produce-task/detail/?ID=" + taskID;
    }





    private List<String> generateIdentifiers(int count) {
        List<String> identifiers = new ArrayList<>(100);
        long base = new Date().getTime();
        for (int i = 0; i < count; i++) {
            identifiers.add((base + i) + "");
        }
        return identifiers;
    }
}
