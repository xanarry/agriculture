package com.agriculture.dataBase.domain;

public class ProduceTaskAreaBlock {
    private String  produceTaskID; //生产任务ID
    private Integer areaBlockID; //生产区ID
    private String  areaBlock; //生产区名


    public ProduceTaskAreaBlock() {}

    public void setProduceTaskID(String produceTaskID) {
        this.produceTaskID = produceTaskID;
    }

    public String getProduceTaskID() {
        return produceTaskID;
    }

    public void setAreaBlockID(Integer areaBlockID) {
        this.areaBlockID = areaBlockID;
    }

    public Integer getAreaBlockID() {
        return areaBlockID;
    }


    public String getAreaBlock() {
        return areaBlock;
    }

    public void setAreaBlock(String areaBlock) {
        this.areaBlock = areaBlock;
    }

    @Override
    public String toString() {
        return "ProduceTaskAreaBlock{" +
                "produceTaskID='" + produceTaskID + '\'' +
                ", areaBlockID=" + areaBlockID +
                ", areaBlock='" + areaBlock + '\'' +
                '}';
    }
}
