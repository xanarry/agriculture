package com.agriculture.controller;

import com.agriculture.Consts;
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

import java.awt.geom.Area;
import java.util.*;

@Controller
@RequestMapping(value = "/produce-task")
public class produceTaskController {
    @Autowired
    ProduceTaskDao produceTaskDao;
    @Autowired
    AreaBlockDao areaBlockDao;
    @Autowired
    ProduceTaskAreaBlockDao produceTaskAreaBlockDao;
    @Autowired
    PloughDao ploughDao;
    @Autowired
    SowDao sowDao;
    @Autowired
    PruningDao pruningDao;
    @Autowired
    ShuguoRecordDao shuguoRecordDao;
    @Autowired
    PollinationDao pollinationDao;
    @Autowired
    FertilizationDao fertilizationDao;
    @Autowired
    AntiDiseasePestDao antiDiseasePestDao;
    @Autowired
    WeedDao weedDao;
    @Autowired
    IrrigationDao irrigationDao;
    @Autowired
    ProductPickDao productPickDao;
    @Autowired
    ProductPackDao productPackDao;
    @Autowired
    ProductCheckDao productCheckDao;
    @Autowired
    CheckReportDao checkReportDao;
    @Autowired
    SellInfoDao sellInfoDao;
    @Autowired
    ProductIdentifierDao productIdentifierDao;

    @RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
    public String index(ModelMap modelMap) {
        List<ProduceTask> produceTaskList = produceTaskDao.getProduceTaskList(null, null);
        String[] produceAreaBlockList = new String[] {"胥家圣寿","崇义罗桥","天马金马","天马仙鹤","天马长虹","天马童山","胥家石龙","胥家歇马","胥家金虹","胥家纪家","胥家南海","胥家共和","聚源泉水","天马金华村","天马金陵","崇义笆桥","中心红旗","聚源五龙","天马建华","天马法华","天马二郎","蒲阳长林","天马禹王","胥家正林","胥家羊合","胥家圣寿村","胥家羗家","蒲阳双柏村","崇义桂桥","石羊","蒲阳拦厢"};

        modelMap.put("produceTaskList", produceTaskList);
        modelMap.put("produceAreaBlockList", produceAreaBlockList);
        return "produceTask/index";
    }







    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addProduceTask(ProduceTask produceTask, @RequestParam("productionAreaBlock") List<String> blocks) {
        System.out.println(produceTask);
        System.out.println(blocks);

        long timeStamp = new Date().getTime();
        String ID = generateID(timeStamp);
        produceTask.setID(ID);
        produceTask.setCreateTime(timeStamp);
        produceTask.setState("待审核");
        produceTaskDao.addProduceTask(produceTask);

        List<AreaBlock> areaBlockList = areaBlockDao.getAreaBlockList(null, null);

        for (String block : blocks) {
            for (AreaBlock ab : areaBlockList) {
                if (ab.getAreaBlock().equals(block)) {
                    ProduceTaskAreaBlock produceTaskAreaBlock = new ProduceTaskAreaBlock();
                    produceTaskAreaBlock.setProduceTaskID(ID);
                    produceTaskAreaBlock.setAreaBlockID(ab.getID());
                    produceTaskAreaBlock.setAreaBlock(ab.getAreaBlock());
                    produceTaskAreaBlockDao.addProduceTaskAreaBlock(produceTaskAreaBlock);
                }
            }
        }

        return "redirect:/produce-task";
    }








    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String getDetail(@RequestParam("ID") String taskID, ModelMap modelMap) {
        ProduceTask produceTask = produceTaskDao.getProduceTask(taskID);

        //获取该生产任务的生产区
        List<ProduceTaskAreaBlock> selecteAreaBlockList = produceTaskAreaBlockDao.getProduceTaskAreaBlockList(null, null, taskID);

        //获取系统中的所有生产区的map
        Map<Integer, AreaBlock> allAreaBlockMap = areaBlockDao.getAreaBlockMap();


        List<ProductIdentifier> productIdentifierList = productIdentifierDao.getProductIdentifierList(null, null, taskID);

        List<String> selectedAreaBlock = new ArrayList<>();
        List<AreaBlock> selectableAreaBlock = new ArrayList<>();

        for (ProduceTaskAreaBlock selected : selecteAreaBlockList) {
            if (!selected.getProduceTaskID().equals(taskID)) {
                //selectableAreaBlock.add(selected.getAreaBlock());
            } else {
                //已经选择的区域
                selectedAreaBlock.add(selected.getAreaBlock());
                allAreaBlockMap.remove(selected.getAreaBlockID());
            }
        }

        for (Integer key : allAreaBlockMap.keySet()) {
            selectableAreaBlock.add(allAreaBlockMap.get(key));
        }

        modelMap.put("task", produceTask);

        modelMap.put("selectedAreaBlock", selectedAreaBlock);
        modelMap.put("selectableAreaBlock", selectableAreaBlock);
        modelMap.put("productIdentifierList", productIdentifierList);



        return "produceTask/detail";
    }




    @RequestMapping(value = "/updateTaskState", method = RequestMethod.POST)
    private String updateTaskState(@RequestParam("produceTaskID") String produceTaskID, @RequestParam(name = "state") String state) {
        if (state != null && state.trim().length() > 0) {
            ProduceTask task = produceTaskDao.getProduceTask(produceTaskID);
            task.setState(state);
            produceTaskDao.updateProduceTask(task);
        }
        return "redirect:/produce-task/detail?ID=" + produceTaskID;
    }







    @RequestMapping(value = "/plough", method = RequestMethod.GET)
    private String plough(@RequestParam("ID") String taskID, ModelMap modelMap) {
        List<Plough> ploughList = ploughDao.getPloughList(null, null, taskID);
        modelMap.put("ploughList", ploughList);
        return  "produceTask/plough";
    }



    @RequestMapping(value = "/addPlough", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    private String addPlough(Plough plough) {
        System.out.println(plough);
        ploughDao.addPlough(plough);
        return  Consts.SUCCESS;
    }






    @RequestMapping(value = "/sow", method = RequestMethod.GET)
    private String sow(@RequestParam("ID") String taskID, ModelMap modelMap) {
        List<Sow> sowList = sowDao.getSowList(null, null, taskID);
        modelMap.put("sowList", sowList);
        return  "produceTask/sow";
    }



    @RequestMapping(value = "/addSow", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    private String addSow(Sow sow) {
        System.out.println(sow);
        sowDao.addSow(sow);
        return  Consts.SUCCESS;
    }





    @RequestMapping(value = "/pruning", method = RequestMethod.GET)
    private String pruning(@RequestParam("ID") String taskID, ModelMap modelMap) {
        List<Pruning> pruningList = pruningDao.getPruningList(null, null, taskID);
        modelMap.put("pruningList", pruningList);
        return  "produceTask/pruning";
    }


    @RequestMapping(value = "/addPruning", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    private String addPruning(Pruning pruning) {
        System.out.println(pruning);
        pruningDao.addPruning(pruning);
        return  Consts.SUCCESS;
    }







    @RequestMapping(value = "/shuguo-record", method = RequestMethod.GET)
    private String shuguoRecord(@RequestParam("ID") String taskID, ModelMap modelMap) {
        List<ShuguoRecord> shuguoRecordList = shuguoRecordDao.getShuguoRecordList(null, null, taskID);
        modelMap.put("shuguoRecordList", shuguoRecordList);
        return  "produceTask/shuguoRecord";
    }


    @RequestMapping(value = "/addShuguoRecord", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    private String addShuguoRecord(ShuguoRecord shuguoRecord) {
        System.out.println(shuguoRecord);
        shuguoRecord.setCropName(produceTaskDao.getProduceTask(shuguoRecord.getProduceTaskID()).getProductName());
        shuguoRecordDao.addShuguoRecord(shuguoRecord);
        return  Consts.SUCCESS;
    }





    @RequestMapping(value = "/pollination", method = RequestMethod.GET)
    private String pollination(@RequestParam("ID") String taskID, ModelMap modelMap) {
        List<Pollination> pollinationList = pollinationDao.getPollinationList(null, null, taskID);
        modelMap.put("pollinationList", pollinationList);
        return  "produceTask/pollination";
    }
    
    @RequestMapping(value = "/addPollination", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    private String addPollination(Pollination pollination) {
        System.out.println(pollination);
        pollinationDao.addPollination(pollination);
        return  Consts.SUCCESS;
    }





    @RequestMapping(value = "/fertilization", method = RequestMethod.GET)
    private String fertilization(@RequestParam("ID") String taskID, ModelMap modelMap) {
        List<Fertilization> fertilizationList = fertilizationDao.getFertilizationList(null, null, taskID);
        modelMap.put("fertilizationList", fertilizationList);
        return  "produceTask/fertilization";
    }

    @RequestMapping(value = "/addFertilization", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    private String addPollination(Fertilization fertilization) {
        System.out.println(fertilization);
        fertilizationDao.addFertilization(fertilization);
        return  Consts.SUCCESS;
    }





    @RequestMapping(value = "/anti-disease-pest", method = RequestMethod.GET)
    private String antiDiseasePest(@RequestParam("ID") String taskID, ModelMap modelMap) {
        List<AntiDiseasePest> antiDiseasePestList = antiDiseasePestDao.getAntiDiseasePestList(null, null, taskID);
        modelMap.put("antiDiseasePestList", antiDiseasePestList);
        return  "produceTask/antiDiseasePest";
    }


    @RequestMapping(value = "/addAntiDiseasePest", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    private String addAntiDiseasePest(AntiDiseasePest antiDiseasePest) {
        System.out.println(antiDiseasePest);
        antiDiseasePestDao.addAntiDiseasePest(antiDiseasePest);
        return  Consts.SUCCESS;
    }






    @RequestMapping(value = "/weed", method = RequestMethod.GET)
    private String weed(@RequestParam("ID") String taskID, ModelMap modelMap) {
        List<Weed> weedList = weedDao.getWeedList(null, null, taskID);
        modelMap.put("weedList", weedList);
        return  "produceTask/weed";
    }


    @RequestMapping(value = "/addWeed", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    private String addWeed(Weed weed) {
        System.out.println(weed);
        weedDao.addWeed(weed);
        return  Consts.SUCCESS;
    }





    @RequestMapping(value = "/irrigation", method = RequestMethod.GET)
    private String irrigation(@RequestParam("ID") String taskID, ModelMap modelMap) {
        List<Irrigation> irrigationList = irrigationDao.getIrrigationList(null, null, taskID);
        modelMap.put("irrigationList", irrigationList);
        return  "produceTask/irrigation";
    }


    @RequestMapping(value = "/addIrrigation", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    private String addIrrigation(Irrigation irrigation) {
        System.out.println(irrigation);
        irrigationDao.addIrrigation(irrigation);
        return  Consts.SUCCESS;
    }





    @RequestMapping(value = "/product-pick", method = RequestMethod.GET)
    private String productPick(@RequestParam("ID") String taskID, ModelMap modelMap) {
        List<ProductPick> productPickList = productPickDao.getProductPickList(null, null, taskID);
        modelMap.put("productPickList", productPickList);
        return  "produceTask/productPick";
    }

    @RequestMapping(value = "/addProductPick", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    private String addProductPick(ProductPick productPick) {
        System.out.println(productPick);
        productPickDao.addProductPick(productPick);
        return  Consts.SUCCESS;
    }







    @RequestMapping(value = "/product-pack", method = RequestMethod.GET)
    private String productPack(@RequestParam("ID") String taskID, ModelMap modelMap) {
        List<ProductPack> productPackList = productPackDao.getProductPackList(null, null, taskID);
        modelMap.put("productPackList", productPackList);
        return  "produceTask/productPack";
    }


    @RequestMapping(value = "/addProductPack", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    private String addProductPack(ProductPack productPack) {
        System.out.println(productPack);
        productPackDao.addProductPack(productPack);
        return  Consts.SUCCESS;
    }






    @RequestMapping(value = "/product-check", method = RequestMethod.GET)
    private String productCheck(@RequestParam("ID") String taskID, ModelMap modelMap) {
        List<ProductCheck> productCheckList = productCheckDao.getProductCheckList(null, null, taskID);
        modelMap.put("productCheckList", productCheckList);
        return  "produceTask/productCheck";
    }

    @RequestMapping(value = "/addProductCheck", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    private String addProductCheck(ProductCheck productCheck) {
        System.out.println(productCheck);
        productCheckDao.addProductCheck(productCheck);
        return  Consts.SUCCESS;
    }





    @RequestMapping(value = "/check-report", method = RequestMethod.GET)
    private String checkReport(@RequestParam("ID") String taskID, ModelMap modelMap) {
        List<CheckReport> checkReportList = checkReportDao.getCheckReportList(null, null, taskID);
        modelMap.put("checkReportList", checkReportList);
        return  "produceTask/checkReport";
    }

    @RequestMapping(value = "/addCheckReport", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    private String addCheckReport(CheckReport checkReport) {
        System.out.println(checkReport);
        checkReportDao.addCheckReport(checkReport);
        return  Consts.SUCCESS;
    }





    @RequestMapping(value = "/sell-info", method = RequestMethod.GET)
    private String sellInfo(@RequestParam("ID") String taskID, ModelMap modelMap) {
        List<SellInfo> sellInfoList = sellInfoDao.getSellInfoList(null, null, taskID);
        modelMap.put("sellInfoList", sellInfoList);
        return  "produceTask/sellInfo";
    }


    @RequestMapping(value = "/addSellInfo", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    private String addSellInfo(SellInfo sellInfo) {
        System.out.println(sellInfo);
        sellInfoDao.addSellInfo(sellInfo);
        return  Consts.SUCCESS;
    }







































    private String generateID(long timeStamp) {
        Calendar calendar = Calendar.getInstance();
        int y = calendar.get(Calendar.YEAR);            // 2016
        int m = calendar.get(Calendar.MONTH) + 1;           // 6
        int d = calendar.get(Calendar.DAY_OF_MONTH);    // 6
        String date = String.format("%04d%02d%02d", y, m, d);
        String timeStampStr = timeStamp + "";
        return date + '-' + timeStampStr.substring(timeStampStr.length() - 5);
    }
}
