package com.agriculture.dataBase.domain;

public class PurchaseRecord {
    private int ID;
    private String orderNO;
    private String materialNO;
    private String materialName;
    private String provider;
    private String producer;
    private Double purchaseCount;
    private String unit;
    private String purchaseDate;
    private String produceDate;
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

    public void setMaterialNO(String materialNO) {
        this.materialNO = materialNO;
    }

    public String getMaterialNO() {
        return materialNO;
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

    public String getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(String purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public String getProduceDate() {
        return produceDate;
    }

    public void setProduceDate(String produceDate) {
        this.produceDate = produceDate;
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
        return "PurchaseRecord{" + "ID=" + ID + "orderNO=" + orderNO + "materialNO=" + materialNO + "materialName=" + materialName + "provider=" + provider + "producer=" + producer + "purchaseCount=" + purchaseCount + "unit=" + unit + "purchaseDate=" + purchaseDate + "produceDate=" + produceDate + "produceNO=" + produceNO + "validDate=" + validDate + "validDateUnit=" + validDateUnit + "operator=" + operator + "remark=" + remark + "}";
    }
}
