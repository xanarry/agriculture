package com.agriculture.controller;

import com.agriculture.dataBase.dao.MaterialRemainDao;
import com.agriculture.dataBase.domain.MaterialRemain;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping(value = "/material")
public class MaterialController {

    @Autowired
    MaterialRemainDao materialRemainDao;

    @RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
    public String index(ModelMap modelMap) {
        List<MaterialRemain> materialRemainList = materialRemainDao.getMaterialRemainList(null, null);
        modelMap.put("materialRemainList", materialRemainList);
        return "material/index";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String getAddPage() {
        return "material/edit";
    }

}
