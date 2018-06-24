package test.design;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;


public class Main {
    private static Graph loadGraphFromFile(String fileName) {
        Map<String, List<String>> adjacentTable = new TreeMap<>();
        Map<String, Point> vertexDetail = new TreeMap<>();


        File f = new File(fileName);
        BufferedReader reader = null;
        try {
            reader = new BufferedReader(new FileReader(f));
            String content = null;
            while ((content = reader.readLine()) != null) {

                //System.out.println(content);

                if (content.startsWith("#")) {
                    continue;
                }
                String pointDetails[] = content.split("\\ +");

                //for (String t : pointDetails)System.out.print(t + ",");System.out.println();

                Point point = new Point();
                point.setName(pointDetails[0]);
                point.setBlock(pointDetails[1]);
                point.setExit(pointDetails[2].equals("1"));

                point.setTemperature(Double.parseDouble(pointDetails[3]));
                point.setSmog(Double.parseDouble(pointDetails[4]));
                point.setCongestion(Double.parseDouble(pointDetails[5]));

                point.calculateWeight();

                vertexDetail.put(point.getName(), point);


                if (!adjacentTable.containsKey(point.getName())) {
                    List<String> adjacentPoint = new ArrayList<>(Arrays.asList(pointDetails).subList(6, pointDetails.length));
                    adjacentTable.put(point.getName(), adjacentPoint);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return new Graph(adjacentTable, vertexDetail);
    }





    public static void main(String[] argv) {
        Graph graph = loadGraphFromFile("/home/xanarry/Workspace/IdeaProjects/agriculture/src/test/design/points.txt");

        GraphUtil graphUtil= new GraphUtil(graph);
        graphUtil.outputGraph();

        System.out.println("do dijkstra");
        SearchResult result =  graphUtil.doDijkstra("P");
        result.showResult();

        System.out.println("pathes");
        for (String p : graph.getVertexDetail().keySet()) {
            if (graph.getVertexDetail().get(p).isExit()) {
                List<List<String>> pathes = graphUtil.getPathes(p);
                showPathes(pathes);
            }
        }

        System.out.println("\nsearch block");
        for (String p: graph.getVertexDetail().keySet()) {
            if (graph.getVertexDetail().get(p).getWeight() == 5) {

                String cutPoint = p;
                for (String direct : graph.getAdjacentTable().get(cutPoint)) {
                    //System.out.println(cutPoint + "->" + direct);
                    Set<String> block = graphUtil.searchIsolateBlock(cutPoint, direct);
                    if (block != null) {
                        System.out.println(block);
                    }

                }
            }
        }

    }


    private static void showPathes(List<List<String>> pathes) {
        for (List<String> path : pathes) {
            for (int i  = 0; i < path.size() - 1; i++) {
                System.out.print(path.get(i) + "->");
            }
            System.out.print(path.get(path.size() -1));
            System.out.println();
        }

    }

}
