package com.agriculture.dataBase.domain;

public class MaterialUseRecord {
    private int ID;
    private String produceTaskID;
    private String materialID;
    private String materialName;
    private String product;
    private String area;
    private String materialType;
    private String produceTaskItem;
    private double useAmount;
    private String unit;
    private long userDate;
    private String remark;


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

    public void setProduct(String product) {
        this.product = product;
    }

    public String getProduct() {
        return product;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getArea() {
        return area;
    }

    public void setMaterialType(String materialType) {
        this.materialType = materialType;
    }

    public String getMaterialType() {
        return materialType;
    }

    public void setProduceTaskItem(String produceTaskItem) {
        this.produceTaskItem = produceTaskItem;
    }

    public String getProduceTaskItem() {
        return produceTaskItem;
    }

    public void setUseAmount(double useAmount) {
        this.useAmount = useAmount;
    }

    public double getUseAmount() {
        return useAmount;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getUnit() {
        return unit;
    }

    public void setUserDate(long userDate) {
        this.userDate = userDate;
    }

    public long getUserDate() {
        return userDate;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getRemark() {
        return remark;
    }



    public String toString() {
        return "MaterialUseRecord{" + "ID=" + ID + "produceTaskID=" + produceTaskID + "materialID=" + materialID + "materialName=" + materialName + "product=" + product + "area=" + area + "materialType=" + materialType + "produceTaskItem=" + produceTaskItem + "useAmount=" + useAmount + "unit=" + unit + "userDate=" + userDate + "remark=" + remark + "}";
    }
}
