package com.agriculture.dataBase.domain;

public class Unit {
    private int ID;
    private String name;
    private short atomic;

    public Unit() {
    }

    public Unit(int ID, String name) {
        this.ID = ID;
        this.name = name;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public short getAtomic() {
        return atomic;
    }

    public void setAtomic(short atomic) {
        this.atomic = atomic;
    }

    @Override
    public String toString() {
        return "Unit{" +
                "ID=" + ID +
                ", name='" + name + '\'' +
                ", atomic=" + atomic +
                '}';
    }
}
