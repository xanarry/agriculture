package com.agriculture.dataBase.domain;

public class ProduceTask {
    private String ID;
    private String productName;
    private String productType;
    private String productDetail;
    private String area;
    private String state;
    private String operator;
    private Long createTime;


    public void setID(String ID) {
        this.ID = ID;
    }

    public String getID() {
        return ID;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductType(String productType) {
        this.productType = productType;
    }

    public String getProductType() {
        return productType;
    }

    public void setProductDetail(String productDetail) {
        this.productDetail = productDetail;
    }

    public String getProductDetail() {
        return productDetail;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getArea() {
        return area;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getState() {
        return state;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getOperator() {
        return operator;
    }

    public void setCreateTime(Long createTime) {
        this.createTime = createTime;
    }

    public Long getCreateTime() {
        return createTime;
    }



    public String toString() {
        return "ProduceTask{" + "ID=" + ID + "productName=" + productName + "productType=" + productType + "productDetail=" + productDetail + "area=" + area + "state=" + state + "operator=" + operator + "createTime=" + createTime + "}";
    }
}
