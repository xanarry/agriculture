package com.agriculture.dataBase.domain;

public class AreaBlock {
    private Integer ID;
    private String areaBlock;
    private String remark;
    private Double area;
    private Double longitude;
    private Double latitude;


    public AreaBlock() {}

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public Integer getID() {
        return ID;
    }

    public void setAreaBlock(String areaBlock) {
        this.areaBlock = areaBlock;
    }

    public String getAreaBlock() {
        return areaBlock;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getRemark() {
        return remark;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }

    public Double getLongitude() {
        return longitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    public Double getLatitude() {
        return latitude;
    }

    public Double getArea() {
        return area;
    }

    public void setArea(Double area) {
        this.area = area;
    }

    @Override
    public String toString() {
        return "AreaBlock{" +
                "ID=" + ID +
                ", areaBlock='" + areaBlock + '\'' +
                ", remark='" + remark + '\'' +
                ", area=" + area +
                ", longitude=" + longitude +
                ", latitude=" + latitude +
                '}';
    }
}
