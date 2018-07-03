package com.agriculture.controller;

import com.agriculture.Consts;
import com.agriculture.controller.beans.ErrorMessageBean;
import com.agriculture.dataBase.dao.*;
import com.agriculture.dataBase.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Controller
@RequestMapping(value = "/material")
public class MaterialController {

    @Autowired
    MaterialRemainDao materialRemainDao;

    @Autowired
    PesticideDao pesticideDao;

    @Autowired
    FertilizerDao fertilizerDao;

    @Autowired
    SeedDao seedDao;

    @Autowired
    VeterinaryDrugDao veterinaryDrugDao;

    @Autowired
    ForageDao forageDao;



    @Autowired
    PurchaseRecordDao purchaseRecordDao;

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


    @RequestMapping(value = "/stock", method = RequestMethod.GET)
    public String materialStock(ModelMap modelMap) {
        List<PurchaseRecord> purchaseRecordList = purchaseRecordDao.getPurchaseRecordList(null, null);
        modelMap.put("purchaseRecordList", purchaseRecordList);
        return "material/stock";
    }


    @RequestMapping(value = "/use-record", method = RequestMethod.GET)
    public String materialUserRecord(ModelMap modelMap) {
        List<PurchaseRecord> purchaseRecordList = purchaseRecordDao.getPurchaseRecordList(null, null);
        modelMap.put("purchaseRecordList", purchaseRecordList);
        return "material/useRecord";
    }








    @RequestMapping(value = "/purchase", method = RequestMethod.GET)
    public String getPurcaseRecordPage(ModelMap modelMap) {
        List<PurchaseRecord> purchaseRecordList = purchaseRecordDao.getPurchaseRecordList(null, null);
        modelMap.put("purchaseRecordList", purchaseRecordList);
        return "material/purchase";
    }


    @ResponseBody
    @RequestMapping(value = "/purchase/add/complete", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public String getCompleteHint(@RequestParam("query") String keyword) {
        System.out.println(keyword);
        List<MaterialRemain> materialRemainList = materialRemainDao.getMaterialRemainList(null, null);
        Iterator<MaterialRemain> iter = materialRemainList.iterator();


        List<String> values = new ArrayList<>();
        while (iter.hasNext()) {
            MaterialRemain tmp = iter.next();
            if (tmp.getMaterialNO().trim().startsWith(keyword)) {
                values.add("\"" + tmp.getMaterialNO() + " " + tmp.getMaterialName() + "\"");
            }
        }
        return String.format("{\"query\": \"Unit\",\"suggestions\": [%s]}", String.join(",",  values));
    }
    

    @RequestMapping(value = "/purchase/add", method = RequestMethod.POST)
    public String addPurchaseRecord(PurchaseRecord purchaseRecord) {
        System.out.println(purchaseRecord);
        if (materialRemainDao.getMaterialRemain(purchaseRecord.getMaterialNO()) == null) {
            ErrorMessageBean bean = new ErrorMessageBean();
            bean.setTitle("错误");
            bean.setHeader("错误");
            bean.setMessage("投入品编号不存在, 请检查!");
            bean.setUrl("/material/purchase");
            bean.setLinkText("返回");
            return "redirect:/error?" + bean.toURLParamDecode();
        } else {
            purchaseRecordDao.addPurchaseRecord(purchaseRecord);
            return "redirect:/material/purchase";
        }
    }


    @RequestMapping(value = "/pesticide/add", method = RequestMethod.POST)
    @ResponseBody
    public String addPesticide(Pesticide pesticide) {
        System.out.println(pesticide);

        MaterialRemain mr = new MaterialRemain();
        mr.setMaterialNO(pesticide.getNO());
        mr.setMaterialName(pesticide.getName());
        mr.setAmount(0);
        mr.setMaterialType("农药");
        mr.setModel(pesticide.getModel());
        mr.setSpecification(pesticide.getSpecification());
        mr.setUnit(pesticide.getUnit());



        materialRemainDao.addMaterialRemain(mr);
        pesticideDao.addPesticide(pesticide);
        return Consts.SUCCESS;
    }


    @ResponseBody
    @RequestMapping(value = "/fertilizer/add", method = RequestMethod.POST)
    public String addFertilizer(Fertilizer fertilizer) {
        System.out.println(fertilizer);

        MaterialRemain mr = new MaterialRemain();
        mr.setMaterialNO(fertilizer.getNO());
        mr.setMaterialName(fertilizer.getName());
        mr.setAmount(0);
        mr.setMaterialType("农药");
        mr.setModel(fertilizer.getModel());
        mr.setSpecification(fertilizer.getSpecification());
        mr.setUnit(fertilizer.getUnit());



        materialRemainDao.addMaterialRemain(mr);
        fertilizerDao.addFertilizer(fertilizer);
        return Consts.SUCCESS;
    }


    @ResponseBody
    @RequestMapping(value = "/seed/add", method = RequestMethod.POST)
    public String addSeed(Seed seed) {
        System.out.println(seed);

        MaterialRemain mr = new MaterialRemain();
        mr.setMaterialNO(seed.getNO());
        mr.setMaterialName(seed.getName());
        mr.setAmount(0);
        mr.setMaterialType("农药");
        mr.setModel(seed.getModel());
        mr.setSpecification(seed.getSpecification());
        mr.setUnit(seed.getUnit());



        materialRemainDao.addMaterialRemain(mr);
        seedDao.addSeed(seed);
        return Consts.SUCCESS;
    }


    @ResponseBody
    @RequestMapping(value = "/veterinary-drug/add", method = RequestMethod.POST)
    public String addVeterinaryDrug(VeterinaryDrug veterinaryDrug) {
        System.out.println(veterinaryDrug);

        MaterialRemain mr = new MaterialRemain();
        mr.setMaterialNO(veterinaryDrug.getNO());
        mr.setMaterialName(veterinaryDrug.getName());
        mr.setAmount(0);
        mr.setMaterialType("农药");
        mr.setModel(veterinaryDrug.getModel());
        mr.setSpecification(veterinaryDrug.getSpecification());
        mr.setUnit(veterinaryDrug.getUnit());



        materialRemainDao.addMaterialRemain(mr);
        veterinaryDrugDao.addVeterinaryDrug(veterinaryDrug);
        return Consts.SUCCESS;
    }

    @ResponseBody
    @RequestMapping(value = "/forage/add", method = RequestMethod.POST)
    public String addForage(Forage forage) {
        System.out.println(forage);
        MaterialRemain mr = new MaterialRemain();
        mr.setMaterialNO(forage.getNO());
        mr.setMaterialName(forage.getName());
        mr.setAmount(0);
        mr.setMaterialType("农药");
        mr.setModel(forage.getModel());
        mr.setSpecification(forage.getSpecification());
        mr.setUnit(forage.getUnit());



        materialRemainDao.addMaterialRemain(mr);
        forageDao.addForage(forage);
        return Consts.SUCCESS;
    }


}
