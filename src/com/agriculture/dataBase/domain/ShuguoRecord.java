package com.agriculture.dataBase.domain;

public class ShuguoRecord {
    private Integer ID;
    private String produceTaskID;
    private String cropName;
    private String method;
    private String operator;
    private String operateDate;

    public ShuguoRecord() {
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

    public String getCropName() {
        return cropName;
    }

    public void setCropName(String cropName) {
        this.cropName = cropName;
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
        return "ShuguoRecord{" +
                "ID=" + ID +
                ", produceTaskID='" + produceTaskID + '\'' +
                ", cropName='" + cropName + '\'' +
                ", method='" + method + '\'' +
                ", operator='" + operator + '\'' +
                ", operateDate=" + operateDate +
                '}';
    }
}
