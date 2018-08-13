package com.agriculture.controller;

import com.agriculture.Consts;
import com.agriculture.dataBase.dao.AreaBlockDao;
import com.agriculture.dataBase.domain.AreaBlock;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

@Controller
@RequestMapping(value = "/area-block")
public class AreaBlockController {
    @Autowired
    AreaBlockDao areaBlockDao;

    @RequestMapping(value = {"", "'/"}, method = RequestMethod.GET)
    private String index(AreaBlock areaBlock) {
        return "areaBlock/index";
    }

    @RequestMapping(value = "/index-of-add", method = RequestMethod.GET)
    private String getIndexOfAdd(AreaBlock areaBlock) {
        return "areaBlock/addAreaBlock";
    }


    @RequestMapping(value = "/add", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    private String addAreaBlock(@RequestBody List<AreaBlock> areaBlockList) {
        List<AreaBlock> existedAreaBlock = areaBlockDao.getAreaBlockList(null, null);
        HashSet<String> nameSet = new HashSet<>();
        for (AreaBlock ab : existedAreaBlock) {
            nameSet.add(ab.getAreaBlock());
        }

        List<String> conflictAreaBlock = new ArrayList<>(10);
        for (AreaBlock ab : areaBlockList) {
            ab.setRemark("待添加");
            ab.setArea(0.00000000000000000);
            if (nameSet.contains(ab.getAreaBlock())) {
                conflictAreaBlock.add(ab.getAreaBlock());
            } else {
                areaBlockDao.addAreaBlock(ab);
            }
        }
        if (conflictAreaBlock.size() == 0) {
            return String.format("{\"result\": \"%s\"}", Consts.SUCCESS);
        } else {
            return String.format("{\"result\": \"[%s]已经存在, 没有保存到数据库\"}", String.join(",", conflictAreaBlock));
        }
    }

    @RequestMapping(value = "/points", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    private String getPoints(String taskID) {
        List<AreaBlock> areaBlockList = areaBlockDao.getAreaBlockList(null, null);
        return new Gson().toJson(areaBlockList);
    }


    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    private String deletePoints(Integer areaBlockID) {
        areaBlockDao.deleteAreaBlock(areaBlockID);
        return "redirect:/area-block";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    private String deletePoints(AreaBlock areaBlock) {
        AreaBlock old = areaBlockDao.getAreaBlock(areaBlock.getID());
        areaBlock.setLongitude(old.getLongitude());
        areaBlock.setLatitude(old.getLatitude());
        areaBlockDao.updateAreaBlock(areaBlock);
        return "redirect:/area-block";
    }
}
