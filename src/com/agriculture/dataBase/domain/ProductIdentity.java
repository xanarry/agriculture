package com.agriculture.dataBase.domain;

public class ProductIdentity {
    private String produceTaskID;
    private String productIdentity;


    public ProductIdentity() {}

    public void setProduceTaskID(String produceTaskID) {
        this.produceTaskID = produceTaskID;
    }

    public String getProduceTaskID() {
        return produceTaskID;
    }

    public void setProductIdentity(String productIdentity) {
        this.productIdentity = productIdentity;
    }

    public String getProductIdentity() {
        return productIdentity;
    }



    public String toString() {
        return "ProductIdentity {"
             + "produceTaskID=" + produceTaskID + ","
             + "productIdentity=" + productIdentity + ","
             + "}";
    }
}
