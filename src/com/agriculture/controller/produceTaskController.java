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

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/produce-task")
public class produceTaskController {
    @Autowired
    ProduceTaskDao produceTaskDao;
    @Autowired
    ProduceAreaBlockDao produceAreaBlockDao;
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


        for (String block : blocks) {
            ProduceAreaBlock produceAreaBlock = new ProduceAreaBlock();
            produceAreaBlock.setAreaBlock(block);
            produceAreaBlock.setProduceTaskID(ID);
            produceAreaBlockDao.addProduceAreaBlock(produceAreaBlock);
        }

        return "redirect:/produce-task";
    }

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String getDetail(@RequestParam("ID") String taskID, ModelMap modelMap) {
        ProduceTask produceTask = produceTaskDao.getProduceTask(taskID);
        List<ProduceAreaBlock> areaBlockList = produceAreaBlockDao.getProduceAreaBlockList(null, null, taskID);
        List<Plough> ploughList = ploughDao.getPloughList(null, null, taskID);
        List<Sow> sowList = sowDao.getSowList(null, null, taskID);
        List<Pruning> pruningList = pruningDao.getPruningList(null, null, taskID);
        List<ShuguoRecord> shuguoRecordList = shuguoRecordDao.getShuguoRecordList(null, null, taskID);
        List<Pollination> pollinationList = pollinationDao.getPollinationList(null, null, taskID);
        List<Fertilization> fertilizationList = fertilizationDao.getFertilizationList(null, null);
        List<AntiDiseasePest> antiDiseasePestList = antiDiseasePestDao.getAntiDiseasePestList(null, null, taskID);
        List<Weed> weedList = weedDao.getWeedList(null, null, taskID);
        List<Irrigation> irrigationList = irrigationDao.getIrrigationList(null, null, taskID);
        List<ProductPick> productPickList = productPickDao.getProductPickList(null, null, taskID);
        List<ProductPack> productPackList = productPackDao.getProductPackList(null, null, taskID);
        List<ProductCheck> productCheckList = productCheckDao.getProductCheckList(null, null, taskID);
        List<CheckReport> checkReportList = checkReportDao.getCheckReportList(null, null, taskID);
        List<SellInfo> sellInfoList = sellInfoDao.getSellInfoList(null, null, taskID);

        List<String> selectedAreaBlock = new ArrayList<>();
        List<String> selectableAreaBlock = new ArrayList<>();

        for (ProduceAreaBlock ab : areaBlockList) {
            if (!ab.getProduceTaskID().equals(taskID)) {
                selectableAreaBlock.add(ab.getAreaBlock());
            } else {
                selectedAreaBlock.add(ab.getAreaBlock());
            }
        }

        modelMap.put("task", produceTask);

        modelMap.put("selectedAreaBlock", selectedAreaBlock);
        modelMap.put("selectableAreaBlock", selectableAreaBlock);

        //modelMap.put("areaBlockList", areaBlockList);

        modelMap.put("ploughList", ploughList);
        modelMap.put("sowList", sowList);
        modelMap.put("pruningList", pruningList);
        modelMap.put("shuguoRecordList", shuguoRecordList);
        modelMap.put("pollinationList", pollinationList);
        modelMap.put("fertilizationList", fertilizationList);
        modelMap.put("antiDiseasePestList", antiDiseasePestList);
        modelMap.put("weedList", weedList);
        modelMap.put("irrigationList", irrigationList);
        modelMap.put("productPickList", productPickList);
        modelMap.put("productPackList", productPackList);
        modelMap.put("productCheckList", productCheckList);
        modelMap.put("checkReportList", checkReportList);
        modelMap.put("sellInfoList", sellInfoList);

        return "produceTask/taskDetail";
    }


    @RequestMapping(value = "/addAreaBlock", method = RequestMethod.POST)
    private String addAreaBlock(@RequestParam("produceTaskID") String produceTaskID, @RequestParam(name = "selectedAreaBlock", required = false) String selectedAreaBlock, @RequestParam(name = "inputAreaBlock", required = false) String inputAreaBlock) {
        ProduceAreaBlock produceAreaBlock = new ProduceAreaBlock();
        produceAreaBlock.setProduceTaskID(produceTaskID);
        produceAreaBlock.setAreaBlock(null);


        if (selectedAreaBlock != null && selectedAreaBlock.trim().length() > 0) {
            produceAreaBlock.setAreaBlock(selectedAreaBlock);
        } else if (inputAreaBlock != null && inputAreaBlock.trim().length() > 0) {
            produceAreaBlock.setAreaBlock(inputAreaBlock);
        }

        if (produceAreaBlock.getAreaBlock() != null) {
            produceAreaBlockDao.addProduceAreaBlock(produceAreaBlock);
        }
        return "redirect:/produce-task/detaiproduceTaskIDl?ID=" + produceTaskID;
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

    @RequestMapping(value = "/addPlough", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    private String addPlough(Plough plough) {
        System.out.println(plough);
        ploughDao.addPlough(plough);
        return  Consts.SUCCESS;
    }

    @RequestMapping(value = "/addSow", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    private String addSow(Sow sow) {
        System.out.println(sow);
        sowDao.addSow(sow);
        return  Consts.SUCCESS;
    }

    @RequestMapping(value = "/addPruning", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    private String addPruning(Pruning pruning) {
        System.out.println(pruning);
        pruningDao.addPruning(pruning);
        return  Consts.SUCCESS;
    }

    @RequestMapping(value = "/addShuguoRecord", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    private String addShuguoRecord(ShuguoRecord shuguoRecord) {
        System.out.println(shuguoRecord);
        shuguoRecord.setCropName(produceTaskDao.getProduceTask(shuguoRecord.getProduceTaskID()).getProductName());
        shuguoRecordDao.addShuguoRecord(shuguoRecord);
        return  Consts.SUCCESS;
    }

    @RequestMapping(value = "/addPollination", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    private String addPollination(Pollination pollination) {
        System.out.println(pollination);
        pollinationDao.addPollination(pollination);
        return  Consts.SUCCESS;
    }

    @RequestMapping(value = "/addAntiDiseasePest", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    private String addAntiDiseasePest(AntiDiseasePest antiDiseasePest) {
        System.out.println(antiDiseasePest);
        antiDiseasePestDao.addAntiDiseasePest(antiDiseasePest);
        return  Consts.SUCCESS;
    }


    @RequestMapping(value = "/addWeed", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    private String addWeed(Weed weed) {
        System.out.println(weed);
        weedDao.addWeed(weed);
        return  Consts.SUCCESS;
    }



    @RequestMapping(value = "/addIrrigation", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    private String addIrrigation(Irrigation irrigation) {
        System.out.println(irrigation);
        irrigationDao.addIrrigation(irrigation);
        return  Consts.SUCCESS;
    }



    @RequestMapping(value = "/addProductPick", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    private String addProductPick(ProductPick productPick) {
        System.out.println(productPick);
        productPickDao.addProductPick(productPick);
        return  Consts.SUCCESS;
    }


    @RequestMapping(value = "/addProductPack", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    private String addProductPack(ProductPack productPack) {
        System.out.println(productPack);
        productPackDao.addProductPack(productPack);
        return  Consts.SUCCESS;
    }

    @RequestMapping(value = "/addProductCheck", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    private String addProductCheck(ProductCheck productCheck) {
        System.out.println(productCheck);
        productCheckDao.addProductCheck(productCheck);
        return  Consts.SUCCESS;
    }

    @RequestMapping(value = "/addCheckReport", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    private String addCheckReport(CheckReport checkReport) {
        System.out.println(checkReport);
        checkReportDao.addCheckReport(checkReport);
        return  Consts.SUCCESS;
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