package com.agriculture.dataBase.domain;

public class ProduceAreaBlock {
    private int ID;
    private String produceTaskID;
    private String areaBlock;


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

    public void setAreaBlock(String areaBlock) {
        this.areaBlock = areaBlock;
    }

    public String getAreaBlock() {
        return areaBlock;
    }



    public String toString() {
        return "ProduceAreaBlock{" + "ID=" + ID + "produceTaskID=" + produceTaskID + "areaBlock=" + areaBlock + "}";
    }
}
