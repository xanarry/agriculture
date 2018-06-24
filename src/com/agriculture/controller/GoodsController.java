package com.agriculture.controller;

import com.agriculture.dataBase.dao.UnitDao;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/goods")
public class GoodsController {
    /*
    @Autowired
    GoodsDao goodsDao;

    @Autowired
    UnitDao unitDao;

    @RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
    public String getIndex(ModelMap modelMap) {
        modelMap.put("count", goodsDao.getCount());
        modelMap.put("goodsList", goodsDao.getGoodsList(0, 10));
        modelMap.put("unitList", unitDao.getUnitList(null, null));
        return "goods/index";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(@ModelAttribute Goods goods) {
        System.out.println(goods);
        goodsDao.addGoods(goods);
        return "redirect:/goods";
    }


    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(Goods goods) {
        System.out.println(goods);
        goodsDao.updateGoods(goods);
        return "redirect:/goods";
    }


    @RequestMapping(value = "/json", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public String getJson(Integer goodsID) {
        Goods goods = goodsDao.getGoods(goodsID);
        Gson gson = new Gson();
        return  gson.toJson(goods);
    }
*/
}
