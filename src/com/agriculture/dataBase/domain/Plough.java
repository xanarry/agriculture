package com.agriculture.dataBase.domain;

public class Plough {
    private int ID;
    private String produceTaskID;
    private String method;
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

    public String toString() {
        return "Plough{" + "ID=" + ID + "produceTaskID=" + produceTaskID + "method=" + method + "operator=" + operator + "operateDate=" + operateDate + "}";
    }
}
