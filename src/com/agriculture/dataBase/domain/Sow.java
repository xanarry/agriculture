package com.agriculture.dataBase.domain;

public class Sow {
    private Integer ID;
    private String produceTaskID;
    private String seed;
    private String source;
    private String handle;
    private Double amountPerMu;
    private Double sowingDensity;
    private String sowingMethod;
    private Long sowingDate;
    private Long colonizationTime;
    private String colonizationInfo;
    private String operator;

    public Sow() {
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

    public String getSeed() {
        return seed;
    }

    public void setSeed(String seed) {
        this.seed = seed;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getHandle() {
        return handle;
    }

    public void setHandle(String handle) {
        this.handle = handle;
    }

    public Double getAmountPerMu() {
        return amountPerMu;
    }

    public void setAmountPerMu(Double amountPerMu) {
        this.amountPerMu = amountPerMu;
    }

    public Double getSowingDensity() {
        return sowingDensity;
    }

    public void setSowingDensity(Double sowingDensity) {
        this.sowingDensity = sowingDensity;
    }

    public String getSowingMethod() {
        return sowingMethod;
    }

    public void setSowingMethod(String sowingMethod) {
        this.sowingMethod = sowingMethod;
    }

    public Long getSowingDate() {
        return sowingDate;
    }

    public void setSowingDate(Long sowingDate) {
        this.sowingDate = sowingDate;
    }

    public Long getColonizationTime() {
        return colonizationTime;
    }

    public void setColonizationTime(Long colonizationTime) {
        this.colonizationTime = colonizationTime;
    }

    public String getColonizationInfo() {
        return colonizationInfo;
    }

    public void setColonizationInfo(String colonizationInfo) {
        this.colonizationInfo = colonizationInfo;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    @Override
    public String toString() {
        return "Sow{" +
                "ID=" + ID +
                ", produceTaskID='" + produceTaskID + '\'' +
                ", seed='" + seed + '\'' +
                ", source='" + source + '\'' +
                ", handle='" + handle + '\'' +
                ", amountPerMu=" + amountPerMu +
                ", sowingDensity=" + sowingDensity +
                ", sowingMethod='" + sowingMethod + '\'' +
                ", sowingDate=" + sowingDate +
                ", colonizationTime=" + colonizationTime +
                ", colonizationInfo='" + colonizationInfo + '\'' +
                ", operator='" + operator + '\'' +
                '}';
    }
}
