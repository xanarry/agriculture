package test.design;

import sun.security.provider.certpath.Vertex;

import java.util.*;

public class GraphUtil {

    private class Vertex implements Comparable<Vertex>{
        private String name;
        private double weight;
        public Vertex() {}
        public Vertex(String name, double weight) {
            this.name = name;
            this.weight = weight;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public double getWeight() {
            return weight;
        }

        public void setWeight(double weight) {
            this.weight = weight;
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            Vertex v = (Vertex) o;
            return weight== v.getWeight() && name.equals(v.getName());
        }

        @Override
        public int compareTo(Vertex o) {
            return Double.compare(weight, o.getWeight());
        }

        @Override
        public String toString() {
            return "["+ name + "," + weight + ']';
        }
    }


    //保存图的信息
    private Graph graph;


    public GraphUtil(Graph graph) {
        this.graph = graph;
    }

    public Graph getGraph() {
        return graph;
    }

    public void setGraph(Graph graph) {
        this.graph = graph;
    }




    //保存到每个点的最短距离
    private Map<String, Double> distanceTo;

    //保存路径上节点的父节点
    private Map<String, List<String>> parentVertex;

    //保存搜索路径
    private List<List<String>> pathes;

    private void dijkstra(String startPoint) {
        //保存到每个点的最短距离
        distanceTo = new TreeMap<>();

        //保存路径上节点的父节点
        parentVertex = new TreeMap<>();

        if (!graph.getVertexDetail().containsKey(startPoint)) {
            System.out.println("输入的起点不存在!");
            return;
        }

        //优先级队列
        PriorityQueue<Vertex> priorityQueue = new PriorityQueue<>(100);

        //初始化路径值与父节点信息
        for (String key : graph.getVertexDetail().keySet()) {
            if (!key.equals(startPoint)) {
                distanceTo.put(key, Double.POSITIVE_INFINITY);
                priorityQueue.add(new Vertex(key, Double.POSITIVE_INFINITY));
            }
            parentVertex.put(key, new ArrayList<>());
        }

        //设置起点信息
        distanceTo.put(startPoint, 0d);
        priorityQueue.add(new Vertex(startPoint, 0));

        //开始路径算法
        while (priorityQueue.size() > 0 && priorityQueue.peek().getWeight() != Double.POSITIVE_INFINITY) {
            Vertex curVertex = priorityQueue.poll();

            /*
            System.out.println("cur start point: " + curVertex);
            if (curVertex.getName().equals("C") || curVertex.getName().equals("I")) {
                for (Object v : priorityQueue.toArray()) {
                    System.out.print(v);
                }
                System.out.println();
            }*/

            for (String adjacent : graph.getAdjacentTable().get(curVertex.name)) {

                //搜索过程中忽略已经不能通过的点
                if (graph.getVertexDetail().get(adjacent).getWeight() == 5) {
                    continue;
                }

                double newWeight = curVertex.weight + graph.getVertexDetail().get(adjacent).getWeight();
                if (newWeight <= distanceTo.get(adjacent)) {
                    //更新父节点信息
                    if (newWeight < distanceTo.get(adjacent)) {
                        //如果有更短的路径, 将已经有的全部删除, 只保留更短的
                       // System.out.println("更短 " + adjacent + "'s parent: " + curVertex.getName());
                        parentVertex.get(adjacent).clear();
                    }
                    //保存所有长度相同的路径
                    parentVertex.get(adjacent).add(curVertex.name);
                   // System.out.println("相同 " + adjacent + "'s parent: " + curVertex.getName());

                    //更新优先级队列中定点的权值
                    priorityQueue.remove(new Vertex(adjacent, distanceTo.get(adjacent)));
                    priorityQueue.add(new Vertex(adjacent, newWeight));

                    //更新路径数值
                    distanceTo.put(adjacent, newWeight);
                }
            }
        }
    }


    public SearchResult doDijkstra(String startPoint) {
        dijkstra(startPoint);
        return new SearchResult(distanceTo, parentVertex);
    }



    public void constructPath(String dist, List<String> path) {
        //System.out.println("to: " + dist);
        path.add(0, dist);
        List<String> ps = parentVertex.get(dist);
        if (ps == null || ps.size() == 0) {
            pathes.add(path);
            return;
        }

        for (String p : ps) {
            constructPath(p, new ArrayList<>(path));
        }
    }



    public List<List<String>> getPathes(String dist) {
        pathes = new ArrayList<>();
        List<String> path = new ArrayList<>();
        constructPath(dist, path);
        return pathes;
    }



    private void dfs(String vertex) {
        //DFS搜索隔断区域
        if (graph.getVertexDetail().get(vertex).getWeight() == 5) {
            return;
        }
        finded.add(vertex);
        for (String adjacent : graph.getAdjacentTable().get(vertex)) {
            if (!finded.contains(adjacent)) {
                dfs(adjacent);
            }
        }
    }

    private Set<String> finded;

    public Set<String> searchIsolateBlock(String cutPoint, String directPoint) {
        finded = new TreeSet<>();
        //插入分割点, 防治搜索范围越界
        finded.add(cutPoint);
        dfs(directPoint);

        //搜索结束后移除分割点, 边界不算到阻塞区域
        finded.remove(cutPoint);

        //检查阻塞的封闭区域中是否有出口
        for (String v : finded) {
            if (graph.getVertexDetail().get(v).isExit()) {
                return null;
            }
        }
        if (finded.size() > 0) {
            return finded;
        }
        return null;
    }


    public void outputGraph() {
        for (String p : graph.getVertexDetail().keySet()) {
            System.out.println(p + ": " + graph.getVertexDetail().get(p));
        }

        for (String p : graph.getAdjacentTable().keySet()) {
            System.out.print(p + ": ");
            for (String adjp : graph.getAdjacentTable().get(p)) {
                System.out.print(adjp + " ");
            }
            System.out.println();
        }
    }



}
