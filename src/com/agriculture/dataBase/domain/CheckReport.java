package com.agriculture.dataBase.domain;

public class CheckReport {
    private Integer ID;
    private String produceTaskID;
    private String sampleID;
    private String sampleName;
    private String institution;
    private String checkType;
    private String accordingTo;
    private String result;
    private String operator;
    private String operateDate;




    public void setProduceTaskID(String produceTaskID) {
        this.produceTaskID = produceTaskID;
    }

    public String getProduceTaskID() {
        return produceTaskID;
    }

    public void setSampleID(String sampleID) {
        this.sampleID = sampleID;
    }

    public String getSampleID() {
        return sampleID;
    }

    public void setSampleName(String sampleName) {
        this.sampleName = sampleName;
    }

    public String getSampleName() {
        return sampleName;
    }

    public void setInstitution(String institution) {
        this.institution = institution;
    }

    public String getInstitution() {
        return institution;
    }

    public void setCheckType(String checkType) {
        this.checkType = checkType;
    }

    public String getCheckType() {
        return checkType;
    }

    public void setAccordingTo(String accordingTo) {
        this.accordingTo = accordingTo;
    }

    public String getAccordingTo() {
        return accordingTo;
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

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public String getOperateDate() {
        return operateDate;
    }

    public void setOperateDate(String operateDate) {
        this.operateDate = operateDate;
    }

    public String toString() {
        return "CheckReport{" + "ID=" + ID + "produceTaskID=" + produceTaskID + "sampleID=" + sampleID + "sampleName=" + sampleName + "institution=" + institution + "checkType=" + checkType + "accordingTo=" + accordingTo + "result=" + result + "operator=" + operator + "operateDate=" + operateDate + "}";
    }
}
