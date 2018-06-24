package com.agriculture.dataBase.domain;

public class ProductCheck {
    private int ID;
    private String produceTaskID;
    private String item;
    private String result;
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

    public void setItem(String item) {
        this.item = item;
    }

    public String getItem() {
        return item;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getResult() {
        return result;
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
        return "ProductCheck{" + "ID=" + ID + "produceTaskID=" + produceTaskID + "item=" + item + "result=" + result + "operator=" + operator + "operateTime=" + operateTime + "}";
    }
}
