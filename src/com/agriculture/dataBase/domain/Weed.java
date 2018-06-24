package com.agriculture.dataBase.domain;

public class Weed {
    private Integer ID;
    private String produceTaskID;
    private String weedName;
    private String method;
    private String operator;
    private Long operateTime;


    @Override
    public String toString() {
        return "Weed{" +
                "ID=" + ID +
                ", produceTaskID='" + produceTaskID + '\'' +
                ", weedName='" + weedName + '\'' +
                ", method='" + method + '\'' +
                ", operator='" + operator + '\'' +
                ", operateTime=" + operateTime +
                '}';
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

    public String getWeedName() {
        return weedName;
    }

    public void setWeedName(String weedName) {
        this.weedName = weedName;
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

    public Long getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(Long operateTime) {
        this.operateTime = operateTime;
    }

    public Weed() {
    }
}
