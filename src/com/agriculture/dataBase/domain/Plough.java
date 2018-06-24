package com.agriculture.dataBase.domain;

public class Plough {
    private int ID;
    private String produceTaskID;
    private String method;
    private String operator;
    private Long operateTime;


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

    public void setOperateTime(Long operateTime) {
        this.operateTime = operateTime;
    }

    public Long getOperateTime() {
        return operateTime;
    }



    public String toString() {
        return "Plough{" + "ID=" + ID + "produceTaskID=" + produceTaskID + "method=" + method + "operator=" + operator + "operateTime=" + operateTime + "}";
    }
}
