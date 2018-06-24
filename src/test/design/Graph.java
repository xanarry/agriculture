package test.design;

import java.util.List;
import java.util.Map;

public class Graph {
    /*保存邻接表*/
    private Map<String, List<String>> adjacentTable;
    private Map<String, Point> vertexDetail;

    public Graph() { }

    public Graph(Map<String, List<String>> adjacentTable, Map<String, Point> vertexDetail) {
        this.adjacentTable = adjacentTable;
        this.vertexDetail = vertexDetail;
    }

    public Map<String, List<String>> getAdjacentTable() {
        return adjacentTable;
    }

    public void setAdjacentTable(Map<String, List<String>> adjacentTable) {
        this.adjacentTable = adjacentTable;
    }

    public Map<String, Point> getVertexDetail() {
        return vertexDetail;
    }

    public void setVertexDetail(Map<String, Point> vertexDetail) {
        this.vertexDetail = vertexDetail;
    }
}
