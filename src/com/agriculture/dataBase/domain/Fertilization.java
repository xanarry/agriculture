package com.agriculture.dataBase.domain;

public class Fertilization {
    private Integer ID;
    private String produceTaskID;
    private Integer fertilizerID;
    private String fertilizerName;
    private String method;
    private Double useAmount;
    private String operator;
    private Long operateTime;


    public Fertilization() {
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

    public Integer getFertilizerID() {
        return fertilizerID;
    }

    public void setFertilizerID(Integer fertilizerID) {
        this.fertilizerID = fertilizerID;
    }

    public String getFertilizerName() {
        return fertilizerName;
    }

    public void setFertilizerName(String fertilizerName) {
        this.fertilizerName = fertilizerName;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public Double getUseAmount() {
        return useAmount;
    }

    public void setUseAmount(Double useAmount) {
        this.useAmount = useAmount;
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

    public String toString() {
        return "Fertilization{" + "ID=" + ID + "produceTaskID=" + produceTaskID + "fertilizerID=" + fertilizerID + "fertilizerName=" + fertilizerName + "method=" + method + "useAmount=" + useAmount + "operator=" + operator + "operateTime=" + operateTime + "}";
    }
}
