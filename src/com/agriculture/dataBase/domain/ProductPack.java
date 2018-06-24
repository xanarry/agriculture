package com.agriculture.dataBase.domain;

public class ProductPack {
    private int ID;
    private String produceTaskID;
    private String productName;
    private String packingNO;
    private Integer packingCount;
    private String material;
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

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductName() {
        return productName;
    }

    public void setPackingNO(String packingNO) {
        this.packingNO = packingNO;
    }

    public String getPackingNO() {
        return packingNO;
    }

    public void setPackingCount(Integer packingCount) {
        this.packingCount = packingCount;
    }

    public Integer getPackingCount() {
        return packingCount;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getMaterial() {
        return material;
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
        return "ProductPack{" + "ID=" + ID + "produceTaskID=" + produceTaskID + "productName=" + productName + "packingNO=" + packingNO + "packingCount=" + packingCount + "material=" + material + "operator=" + operator + "operateTime=" + operateTime + "}";
    }
}
