package com.agriculture.dataBase.domain;

public class ProductPick {
    private int ID;
    private String produceTaskID;
    private String method;
    private String operator;
    private Integer pickCount;
    private String unit;
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

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getOperator() {
        return operator;
    }

    public Integer getPickCount() {
        return pickCount;
    }

    public void setPickCount(Integer pickCount) {
        this.pickCount = pickCount;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getUnit() {
        return unit;
    }

    public void setOperateDate(String operateDate) {
        this.operateDate = operateDate;
    }

    public String getOperateDate() {
        return operateDate;
    }



    public String toString() {
        return "ProductPick{" + "ID=" + ID + "produceTaskID=" + produceTaskID + "method=" + method + "operator=" + operator + "pickCount=" + pickCount + "unit=" + unit + "operateDate=" + operateDate + "}";
    }
}
