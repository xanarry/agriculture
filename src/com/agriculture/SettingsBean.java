package com.agriculture;

public class SettingsBean {
    private int pageCount;

    public SettingsBean() {
        this.pageCount = 20;
    }

    public SettingsBean(int pageCount) {
        this.pageCount = pageCount;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }
}
