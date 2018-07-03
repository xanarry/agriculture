package com.agriculture.dataBase.domain;

public class Irrigation {
    private int ID;
    private String produceTaskID;
    private String method;
    private String otherWay;
    private String waterSource;
    private String operator;
    private String operateDate;


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

    public void setMethod(String method) {
        this.method = method;
    }

    public String getMethod() {
        return method;
    }

    public void setOtherWay(String otherWay) {
        this.otherWay = otherWay;
    }

    public String getOtherWay() {
        return otherWay;
    }

    public void setWaterSource(String waterSource) {
        this.waterSource = waterSource;
    }

    public String getWaterSource() {
        return waterSource;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getOperator() {
        return operator;
    }


    public String getOperateDate() {
        return operateDate;
    }

    public void setOperateDate(String operateDate) {
        this.operateDate = operateDate;
    }

    @Override
    public String toString() {
        return "Irrigation{" +
                "ID=" + ID +
                ", produceTaskID='" + produceTaskID + '\'' +
                ", method='" + method + '\'' +
                ", otherWay='" + otherWay + '\'' +
                ", waterSource='" + waterSource + '\'' +
                ", operator='" + operator + '\'' +
                ", operateDate='" + operateDate + '\'' +
                '}';
    }
}
