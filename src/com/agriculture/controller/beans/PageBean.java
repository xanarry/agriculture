package com.agriculture.controller.beans;

public class PageBean {
    private int currentPage;//当前页码
    private int countPerPage;//每页记录数
    private int maxPageVal;//最大页数
    private int recordCount;//记录总数
    private String baseURL;//基跳转链接

    public PageBean() {}

    public PageBean(int currentPage, int countPerPage, int maxPageVal, int recordCount, String baseURL) {
        this.currentPage = currentPage;
        this.countPerPage = countPerPage;
        this.maxPageVal = maxPageVal;
        this.recordCount = recordCount;
        this.baseURL = baseURL;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getCountPerPage() {
        return countPerPage;
    }

    public void setCountPerPage(int countPerPage) {
        this.countPerPage = countPerPage;
    }

    public int getMaxPageVal() {
        return maxPageVal;
    }

    public void setMaxPageVal(int maxPageVal) {
        this.maxPageVal = maxPageVal;
    }

    public int getRecordCount() {
        return recordCount;
    }

    public void setRecordCount(int recordCount) {
        this.recordCount = recordCount;
    }

    public String getBaseURL() {
        return baseURL;
    }

    public void setBaseURL(String baseURL) {
        this.baseURL = baseURL;
    }

    @Override
    public String toString() {
        return "pageBean{" +
                "currentPage=" + currentPage +
                ", countPerPage=" + countPerPage +
                ", maxPageVal=" + maxPageVal +
                ", recordCount=" + recordCount +
                ", baseURL='" + baseURL + '\'' +
                '}';
    }
}
