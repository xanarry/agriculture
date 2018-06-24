package com.agriculture.dataBase.domain;

public class PurchaseRecord {
    private int ID;
    private String orderNO;
    private String materialID;
    private String materialName;
    private String provider;
    private String producer;
    private Double purchaseCount;
    private String unit;
    private Long purchaseTime;
    private Long produceTime;
    private String produceNO;
    private String validDate;
    private String validDateUnit;
    private String operator;
    private String remark;


    public void setID(int ID) {
        this.ID = ID;
    }

    public int getID() {
        return ID;
    }

    public void setOrderNO(String orderNO) {
        this.orderNO = orderNO;
    }

    public String getOrderNO() {
        return orderNO;
    }

    public void setMaterialID(String materialID) {
        this.materialID = materialID;
    }

    public String getMaterialID() {
        return materialID;
    }

    public void setMaterialName(String materialName) {
        this.materialName = materialName;
    }

    public String getMaterialName() {
        return materialName;
    }

    public void setProvider(String provider) {
        this.provider = provider;
    }

    public String getProvider() {
        return provider;
    }

    public void setProducer(String producer) {
        this.producer = producer;
    }

    public String getProducer() {
        return producer;
    }

    public void setPurchaseCount(Double purchaseCount) {
        this.purchaseCount = purchaseCount;
    }

    public Double getPurchaseCount() {
        return purchaseCount;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getUnit() {
        return unit;
    }

    public void setPurchaseTime(Long purchaseTime) {
        this.purchaseTime = purchaseTime;
    }

    public Long getPurchaseTime() {
        return purchaseTime;
    }

    public void setProduceTime(Long produceTime) {
        this.produceTime = produceTime;
    }

    public Long getProduceTime() {
        return produceTime;
    }

    public void setProduceNO(String produceNO) {
        this.produceNO = produceNO;
    }

    public String getProduceNO() {
        return produceNO;
    }

    public void setValidDate(String validDate) {
        this.validDate = validDate;
    }

    public String getValidDate() {
        return validDate;
    }

    public void setValidDateUnit(String validDateUnit) {
        this.validDateUnit = validDateUnit;
    }

    public String getValidDateUnit() {
        return validDateUnit;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getOperator() {
        return operator;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getRemark() {
        return remark;
    }



    public String toString() {
        return "PurchaseRecord{" + "ID=" + ID + "orderNO=" + orderNO + "materialID=" + materialID + "materialName=" + materialName + "provider=" + provider + "producer=" + producer + "purchaseCount=" + purchaseCount + "unit=" + unit + "purchaseTime=" + purchaseTime + "produceTime=" + produceTime + "produceNO=" + produceNO + "validDate=" + validDate + "validDateUnit=" + validDateUnit + "operator=" + operator + "remark=" + remark + "}";
    }
}
