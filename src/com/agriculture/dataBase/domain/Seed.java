package com.agriculture.dataBase.domain;

public class Seed {
    private int ID;
    private String NO;
    private String name;
    private String producer;
    private String specification;
    private String unit;
    private String model;
    private String suitFor;
    private String remark;


    public void setID(int ID) {
        this.ID = ID;
    }

    public int getID() {
        return ID;
    }

    public void setNO(String NO) {
        this.NO = NO;
    }

    public String getNO() {
        return NO;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setProducer(String producer) {
        this.producer = producer;
    }

    public String getProducer() {
        return producer;
    }

    public void setSpecification(String specification) {
        this.specification = specification;
    }

    public String getSpecification() {
        return specification;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getUnit() {
        return unit;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getModel() {
        return model;
    }

    public void setSuitFor(String suitFor) {
        this.suitFor = suitFor;
    }

    public String getSuitFor() {
        return suitFor;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getRemark() {
        return remark;
    }



    public String toString() {
        return "Seed{" + "ID=" + ID + "NO=" + NO + "name=" + name + "producer=" + producer + "specification=" + specification + "unit=" + unit + "model=" + model + "suitFor=" + suitFor + "remark=" + remark + "}";
    }
}
