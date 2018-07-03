package com.agriculture.dataBase.domain;

public class Pollination {
    private Integer ID;
    private String produceTaskID;
    private String method;
    private String operator;
    private String operateDate;


    public Pollination() {
    }

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public String getProduceTaskID() {
        return produceTaskID;
    }

    public void setProduceTaskID(String produceTaskID) {
        this.produceTaskID = produceTaskID;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getOperateDate() {
        return operateDate;
    }

    public void setOperateDate(String operateDate) {
        this.operateDate = operateDate;
    }

    @Override
    public String toString() {
        return "Pollination{" +
                "ID=" + ID +
                ", produceTaskID='" + produceTaskID + '\'' +
                ", method='" + method + '\'' +
                ", operator='" + operator + '\'' +
                ", operateDate=" + operateDate +
                '}';
    }
}
