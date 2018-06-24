package test.design;


import java.io.*;
import java.util.*;

class Node implements Comparable<Node> {
    private String name;
    private int    len;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getLen() {
        return len;
    }

    public void setLen(int len) {
        this.len = len;
    }

    public Node() { }

    public Node(String name, int len) {
        this.name = name;
        this.len = len;
    }

    @Override
    public String toString() {
        return "[" + name +"," + len + "]";
    }

    @Override
    public int compareTo(Node o) {
        return this.getLen() - o.getLen();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Node node = (Node) o;
        return len == node.len && Objects.equals(name, node.name);
    }

}

public class Path {

    public static Map<String, List<String>> parent = new TreeMap<>();

    private static Map<String, List<Node>> inputGraph() {
        Map<String, List<Node>> graph = new TreeMap<>();

        System.out.println("input adjust table");
        Scanner scanner = new Scanner(System.in);
        while (true) {
            String startPoint = null;
            System.out.print("input start p: ");
            startPoint = scanner.nextLine();
            if (startPoint.equals("quit")) {
                break;
            }
            System.out.println("input adjust p");
            List<Node> list = new ArrayList<>();
            while (true) {
                System.out.print("input name and len:");
                String inputs[] = scanner.nextLine().split(" ");
                if (inputs[0].equals("ok")) {
                    break;
                }
                list.add(new Node(inputs[0], Integer.parseInt(inputs[1])));
            }
            graph.put(startPoint, list);
        }
        return graph;
    }


    private static Map<String, List<Node>> inputGraph(String fileName) {
        Map<String, List<Node>> graph = new TreeMap<>();
        File f = new File(fileName);
        BufferedReader reader = null;
        try {
            reader = new BufferedReader(new FileReader(f));
            String content = null;
            while ((content = reader.readLine()) != null) {
                System.out.println(content);
                String uvw[] = content.split(" ");
                if (!graph.containsKey(uvw[0])) {
                    List<Node> nodeList = new ArrayList<>();
                    nodeList.add(new Node(uvw[1], Integer.parseInt(uvw[2])));
                    graph.put(uvw[0], nodeList);
                } else {
                    graph.get(uvw[0]).add(new Node(uvw[1], Integer.parseInt(uvw[2])));
                }

                if (!graph.containsKey(uvw[1])) {
                    List<Node> nodeList = new ArrayList<>();
                    nodeList.add(new Node(uvw[0], Integer.parseInt(uvw[2])));
                    graph.put(uvw[1], nodeList);
                } else {
                    graph.get(uvw[1]).add(new Node(uvw[0], Integer.parseInt(uvw[2])));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return graph;
    }


    private static void showGraph(Map<String, List<Node>> graph) {
        Set<String> keys = graph.keySet();
        for (String k : keys) {
            System.out.print(k + ": ");
            for (Node node : graph.get(k)) {
                System.out.print(node);
            }
            System.out.println();
        }
    }


    private static Map<String, Integer> searchPath(Map<String, List<Node>> graph, String startPoint) {
        TreeMap<String, Integer> distanceTo = new TreeMap<>();
        PriorityQueue<Node> priorityQueue = new PriorityQueue<>(100);

        for (String key : graph.keySet()) {
            if (!key.equals(startPoint)) {
                distanceTo.put(key, Integer.MAX_VALUE);
                priorityQueue.add(new Node(key, Integer.MAX_VALUE));
            }
        }


        distanceTo.put(startPoint, 0);
        priorityQueue.add(new Node(startPoint, 0));

        while (priorityQueue.size() > 0) {
            Node tmp = priorityQueue.poll();
            for (Node node : graph.get(tmp.getName())) {
                if (tmp.getLen() + node.getLen() <= distanceTo.get(node.getName())) {
                    if (tmp.getLen() + node.getLen() < distanceTo.get(node.getName())) {
                        parent.get(node.getName()).clear();
                    }
                    parent.get(node.getName()).add(tmp.getName());

                    priorityQueue.remove(new Node(node.getName(), distanceTo.get(node.getName())));
                    priorityQueue.add(new Node(node.getName(), tmp.getLen() + node.getLen()));

                    distanceTo.put(node.getName(), tmp.getLen() + node.getLen());
                }
            }
        }
        return distanceTo;
    }

    private static ArrayList<List<String>> paths = new ArrayList<>(100);




    public static void constructPath(String dist, List<String> path) {
        //System.out.println("to: " + dist);
        path.add(0, dist);
        List<String> ps = parent.get(dist);
        if (ps == null || ps.size() == 0) {
            paths.add(path);
            return;
        }

        for (String p : ps) {
            constructPath(p, new ArrayList<>(path));
        }
    }

    public static void main(String[] argv) {
        Map<String, List<Node>> graph = inputGraph("/home/xanarry/Workspace/IdeaProjects/agriculture/src/test/design/input.txt");
        showGraph(graph);
        for (String k : graph.keySet()) {
            parent.put(k, new ArrayList<>());
        }

        Map<String, Integer> distanceTo = searchPath(graph, "A");


        System.out.println();
        for (String k : distanceTo.keySet()) {
            System.out.println(k + ": " + distanceTo.get(k) + " ");
        }

        System.out.println();
        for (String k : parent.keySet()) {
            System.out.println(k + ": " + parent.get(k) + " ");
        }

        System.out.println("=================");

        constructPath("F", new ArrayList<>());
        for (List<String> path : paths) {
            for (String s : path) {
                System.out.print(s + " ");
            }
            System.out.println();
        }



    }
}

/*
A
B 1
D 5
OK
B
A 1
D 2
C 3
E 4
OK
C
B 3
D 1
E 5
F 3
OK
D
A 5
B 2
C 1
E 2
OK
E
B 4
C 5
D 2
F 4
OK
F
C 3
E 4
OK
quit



*/