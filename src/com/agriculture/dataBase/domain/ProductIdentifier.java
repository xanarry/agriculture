package com.agriculture.dataBase.domain;

public class ProductIdentifier {
    private String produceTaskID;
    private String identifier;


    public ProductIdentifier() {}

    public void setProduceTaskID(String produceTaskID) {
        this.produceTaskID = produceTaskID;
    }

    public String getProduceTaskID() {
        return produceTaskID;
    }

    public void setIdentifier(String identifier) {
        this.identifier = identifier;
    }

    public String getIdentifier() {
        return identifier;
    }



    public String toString() {
        return "ProductIdentifier {"
             + "produceTaskID=" + produceTaskID + ","
             + "identifier=" + identifier + ","
             + "}";
    }
}
