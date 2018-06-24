package com.agriculture.util;


import com.agriculture.Consts;
import com.agriculture.controller.beans.PageBean;

public class Util {
    public static PageBean getPagination(int recordCount, int currentPage, String baseURL) {
        PageBean pageBean = new PageBean();
        int maxPageVal = recordCount / Consts.PAGE_COUNT;
        if (recordCount % Consts.PAGE_COUNT != 0) {
            maxPageVal++; //整数页还有预项, 增加一页
        }
        pageBean.setMaxPageVal(maxPageVal);
        pageBean.setCurrentPage(currentPage);
        pageBean.setRecordCount(recordCount);
        pageBean.setCountPerPage(Consts.PAGE_COUNT);
        pageBean.setBaseURL(baseURL);
        return pageBean;
    }

}
