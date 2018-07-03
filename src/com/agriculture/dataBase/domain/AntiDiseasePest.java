package com.agriculture.dataBase.domain;

public class AntiDiseasePest {
    private Integer ID;
    private String produceTaskID;
    private String dpName;
    private String harmLevel;
    private String method;
    private String aimTo;
    private Integer pesticideID;
    private String pesticideName;
    private String operator;
    private String operateDate;

    public AntiDiseasePest() {
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

    public String getDpName() {
        return dpName;
    }

    public void setDpName(String dpName) {
        this.dpName = dpName;
    }

    public String getHarmLevel() {
        return harmLevel;
    }

    public void setHarmLevel(String harmLevel) {
        this.harmLevel = harmLevel;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getAimTo() {
        return aimTo;
    }

    public void setAimTo(String aimTo) {
        this.aimTo = aimTo;
    }

    public Integer getPesticideID() {
        return pesticideID;
    }

    public void setPesticideID(Integer pesticideID) {
        this.pesticideID = pesticideID;
    }

    public String getPesticideName() {
        return pesticideName;
    }

    public void setPesticideName(String pesticideName) {
        this.pesticideName = pesticideName;
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
        return "AntiDiseasePest{" +
                "ID=" + ID +
                ", produceTaskID='" + produceTaskID + '\'' +
                ", dpName='" + dpName + '\'' +
                ", harmLevel='" + harmLevel + '\'' +
                ", method='" + method + '\'' +
                ", aimTo='" + aimTo + '\'' +
                ", pesticideID=" + pesticideID +
                ", pesticideName='" + pesticideName + '\'' +
                ", operator='" + operator + '\'' +
                ", operateDate=" +  +
                '}';
    }
}
