package com.agriculture.dataBase.domain;

public class MaterialRemain {
    private String materialID;
    private String materialName;
    private String materialType;
    private double amount;
    private String specification;
    private String unit;
    private String model;


    public void setMaterialID(String materialID) {
        this.materialID = materialID;
    }

    public String getMaterialID() {
        return materialID;
    }

    public void setMaterialName(String materialName) {
        this.materialName = materialName;
    }

    public String getMaterialName() {
        return materialName;
    }

    public void setMaterialType(String materialType) {
        this.materialType = materialType;
    }

    public String getMaterialType() {
        return materialType;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public double getAmount() {
        return amount;
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



    public String toString() {
        return "MaterialRemain{" + "materialID=" + materialID + "materialName=" + materialName + "materialType=" + materialType + "amount=" + amount + "specification=" + specification + "unit=" + unit + "model=" + model + "}";
    }
}
