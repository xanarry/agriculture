package test.design;


public class Point implements Comparable<Point> {
    private String name; //点名字
    private String block; //点所属区块
    private String desc; //点的描述

    private double temperature; //温度
    private double smog; //烟雾
    private double congestion; //拥塞

    private double weight; //权重

    private boolean isExit;


    public Point() {}

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBlock() {
        return block;
    }

    public void setBlock(String block) {
        this.block = block;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public double getTemperature() {
        return temperature;
    }

    public void setTemperature(double temperature) {
        this.temperature = temperature;
    }

    public double getSmog() {
        return smog;
    }

    public void setSmog(double smog) {
        this.smog = smog;
    }

    public double getCongestion() {
        return congestion;
    }

    public void setCongestion(double congestion) {
        this.congestion = congestion;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public boolean isExit() {
        return isExit;
    }

    public void setExit(boolean exit) {
        isExit = exit;
    }

    public void calculateWeight() {
        this.weight = (this.temperature + this.smog + this.congestion) / 3.0;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null || getClass() != o.getClass())
            return false;
        Point point = (Point) o;
        return this.name.equals(point.getName());
    }

    @Override
    public String toString() {
        return "[" +
                "name='" + name + '\'' +
                ",block='" + block + '\'' +
                ",desc='" + desc + '\'' +
                ",temperature=" + temperature +
                ",smog=" + smog +
                ",congestion=" + congestion +
                ",weight=" + weight +
                ",isExit=" + isExit +
                ']';
    }

    @Override
    public int compareTo(Point o) {
        return this.name.compareTo(o.getName());
    }
}
