package com.agriculture.dataBase.domain;

public class SellInfo {
    private int ID;
    private String produceTaskID;
    private String productName;
    private String sellTo;
    private double amount;
    private String unit;
    private String wrapMethod;
    private String conveyMethod;
    private String operator;
    private long sellTime;


    public void setID(int ID) {
        this.ID = ID;
    }

    public int getID() {
        return ID;
    }

    public void setProduceTaskID(String produceTaskID) {
        this.produceTaskID = produceTaskID;
    }

    public String getProduceTaskID() {
        return produceTaskID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public void setSellTo(String sellTo) {
        this.sellTo = sellTo;
    }

    public String getSellTo() {
        return sellTo;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public double getAmount() {
        return amount;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getUnit() {
        return unit;
    }

    public void setWrapMethod(String wrapMethod) {
        this.wrapMethod = wrapMethod;
    }

    public String getWrapMethod() {
        return wrapMethod;
    }

    public void setConveyMethod(String conveyMethod) {
        this.conveyMethod = conveyMethod;
    }

    public String getConveyMethod() {
        return conveyMethod;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getOperator() {
        return operator;
    }

    public void setSellTime(long sellTime) {
        this.sellTime = sellTime;
    }

    public long getSellTime() {
        return sellTime;
    }


    @Override
    public String toString() {
        return "SellInfo{" +
                "ID=" + ID +
                ", produceTaskID='" + produceTaskID + '\'' +
                ", productName='" + productName + '\'' +
                ", sellTo='" + sellTo + '\'' +
                ", amount=" + amount +
                ", unit='" + unit + '\'' +
                ", wrapMethod='" + wrapMethod + '\'' +
                ", conveyMethod='" + conveyMethod + '\'' +
                ", operator='" + operator + '\'' +
                ", sellTime=" + sellTime +
                '}';
    }
}
