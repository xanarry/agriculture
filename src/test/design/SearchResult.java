package test.design;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class SearchResult {
    //保存到每个点的最短距离
    private Map<String, Double> distanceTo = new TreeMap<>();

    //保存路径上节点的父节点
    private Map<String, List<String>> parentVertex = new TreeMap<>();


    public SearchResult(Map<String, Double> distanceTo, Map<String, List<String>> parentVertex) {
        this.distanceTo = distanceTo;
        this.parentVertex = parentVertex;
    }

    public Map<String, Double> getDistanceTo() {
        return distanceTo;
    }

    public void setDistanceTo(Map<String, Double> distanceTo) {
        this.distanceTo = distanceTo;
    }

    public Map<String, List<String>> getParentVertex() {
        return parentVertex;
    }

    public void setParentVertex(Map<String, List<String>> parentVertex) {
        this.parentVertex = parentVertex;
    }


    public void showResult() {
        System.out.println("==================================");
        for (String vertex : distanceTo.keySet()) {
            System.out.println(vertex + ": " + distanceTo.get(vertex));
        }
        System.out.println();
        for (String vertex : parentVertex.keySet()) {
            System.out.print(vertex + ": " + parentVertex.get(vertex));
            System.out.println();
        }
        System.out.println("==================================");
    }
}
