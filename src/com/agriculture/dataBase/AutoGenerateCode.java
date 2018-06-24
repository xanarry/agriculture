package com.agriculture.dataBase;


import java.io.*;
import java.lang.reflect.Field;
import java.util.*;

class Table {
    String tableName;
    String primaryKey;
    String primarkeyType;
    boolean autoIncrement;
    List<Variable> variables;

    Table(String tableName, String primaryKey, String primarkeyType, boolean autoIncrement, List<Variable> variables) {
        this.tableName = tableName;
        this.primaryKey = primaryKey;
        this.primarkeyType = primarkeyType;
        this.autoIncrement = autoIncrement;
        this.variables = variables;
    }
}


class Variable {
    String type;
    String fieldName;

    Variable(String type, String fieldName) {
        this.type = type;
        this.fieldName = fieldName;
    }

    public String toString() {
        return String.format("{%s,%s}", type, fieldName);
    }

    public String toFiledCode() {
        return String.format("    private %s %s;", type, fieldName);
    }

    public String getter() {
        return String.format("    public %s get%s() {\n        return %s;\n    }\n", type, Character.toUpperCase(fieldName.charAt(0)) + fieldName.substring(1), fieldName);
    }

    public String setter() {
        return String.format("    public void set%s(%s %s) {\n        this.%s = %s;\n    }", Character.toUpperCase(fieldName.charAt(0)) + fieldName.substring(1), type, fieldName, fieldName, fieldName);
    }
}

public class AutoGenerateCode {
    private static String readFile(String path) throws IOException {
        StringBuilder contentBuf = new StringBuilder("");
        BufferedReader reader = new BufferedReader(new FileReader(path));
        String buf = "";
        while ((buf = reader.readLine()) != null) {
            contentBuf.append(buf);
            contentBuf.append("\n");
        }
        reader.close();
        return contentBuf.toString();
    }

    private static void writeFile(String content, String path) throws IOException {
        FileOutputStream fos = new FileOutputStream(path);
        FileDescriptor fd = fos.getFD();
        fos.write(content.getBytes());
        fos.flush();
        fd.sync();
    }


    public static void generateDao(String daoDir, String primaryKey, String primaryKeyType, Class clz) {
        String className = clz.getSimpleName();
        String varName = Character.toLowerCase(className.charAt(0)) + className.substring(1);
        try {
            String daoCode = readFile(daoDir + "/TemplateDao.txt");
            daoCode = daoCode
                    .replaceAll("\\{className\\}", className)
                    .replaceAll("\\{varName\\}", varName)
                    .replaceAll("\\{primaryKey\\}", primaryKey)
                    .replaceAll("\\{primaryKeyType\\}", primaryKeyType);
            writeFile(daoCode, daoDir + "/" + className + "Dao.java");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void generateMapper(String mapperDir, Class clz, String tableName, String primaryKey, String generateKey) {
        Field[] fields = clz.getDeclaredFields();
        List<String> fieldsName = new ArrayList<>(fields.length);
        List<String> valueStrs = new ArrayList<>(fields.length);
        List<String> updates = new ArrayList<>(fields.length);


        String className = clz.getSimpleName();
        String varName = Character.toLowerCase(className.charAt(0)) + className.substring(1);
        primaryKey = (primaryKey == null || primaryKey.length() == 0) ? "ID" : primaryKey;
        generateKey = (generateKey == null || generateKey.length() == 0) ? "true" : generateKey;


        for (int i = 0; i < fields.length; i++) {
            String k = "`" + fields[i].getName() + "`";
            String v = "#{" + varName + "." + fields[i].getName() + "}";

            //check if is primary key
            if (fields[i].getName().toLowerCase().equals(primaryKey.toLowerCase())) {
                //is primary key
                if (generateKey.equals("false")) {
                    fieldsName.add(k);
                    valueStrs.add(v);
                }
            } else {
                //is not primary key
                fieldsName.add(k);
                valueStrs.add(v);
                updates.add(k + " = " + v);
            }
        }


        String properties = String.join(",\n", fieldsName);
        String values = String.join(",\n", valueStrs);
        String updateString = String.join(",\n", updates);

        /*
        System.out.println(className); System.out.println(varName); System.out.println(primaryKey);System.out.println(generateKey);
        System.out.println(properties);System.out.println(values);
        System.out.println(updateString);
        */

        try {
            String mapper = readFile(mapperDir + "/templateMapper.txt");
            mapper = mapper
                    .replaceAll("\\{className\\}", className)
                    .replaceAll("\\{varName\\}", varName)
                    .replaceAll("\\{primaryKey\\}", primaryKey)
                    .replaceAll("\\{generateKey\\}", generateKey)
                    .replaceAll("\\{properties\\}", properties)
                    .replaceAll("\\{values\\}", values)
                    .replaceAll("\\{tableName\\}", tableName)
                    .replaceAll("\\{updateString\\}", updateString);
            //System.out.println(mapper);
            writeFile(mapper, mapperDir + "/" + className + "Mapper.xml");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private static Map<String, Table> loadTable(String sqlPath) throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader(sqlPath));
        List<Variable> variables = null;
        String className = "";
        String tableName = "";
        String primaryKey = "";
        String primaryKeyType = "";
        boolean autoIncrement = false;


        Map<String, Table> tables = new HashMap<>();

        String buf = "";
        while ((buf = reader.readLine()) != null) {
            if (buf.toLowerCase().startsWith("create table")) {
                tableName = buf.split("\\s+")[2];
                String[] words = tableName.replaceFirst("t_", "").split("_");
                for (String w : words) {
                    className += Character.toUpperCase(w.charAt(0)) + w.substring(1);
                }
                variables = new ArrayList<>();
            } else {
                if (className.length() > 0 && !buf.toLowerCase().trim().startsWith(")")) {

                    String[] filed = buf.trim().split("\\s+");
                    //System.out.println(buf);
                    //System.out.println("=====================");
                    //for (String t : filed) { System.out.print(t + ","); }System.out.println();
                    //System.out.println("=====================");
                    String fieldName = filed[0].replaceAll("`", "").trim();
                    String type = "String";
                    if (filed[1].toLowerCase().startsWith("int")) {
                        type = "Integer";
                    } else if (filed[1].toLowerCase().startsWith("double") || filed[1].toLowerCase().startsWith("float")) {
                        type = "Double";
                    } else if (filed[1].toLowerCase().startsWith("bigint")) {
                        type = "Long";
                    }
                    variables.add(new Variable(type, fieldName));
                    if (buf.toLowerCase().contains("primary key")) {
                        primaryKey = fieldName;
                        primaryKeyType = type;
                        if (buf.toLowerCase().contains("auto_increment")) {
                            autoIncrement = true;
                        }
                    }
                }

                if (buf.toLowerCase().trim().startsWith(")")) {
                    Table table = new Table(tableName, primaryKey, primaryKeyType, autoIncrement, variables);
                    tables.put(className, table);
                    variables = new ArrayList<>();
                    className = "";
                    primaryKey = "";
                    primaryKeyType = "";
                    autoIncrement = false;
                    tableName = "";
                }
            }
        }
        reader.close();
        return tables;
    }


    public static void generateDomain(String domainDir, String className, List<Variable> variables) {
        try {
            String template = readFile(domainDir + "/templateDomain.txt");
            String fileds = "";
            String getterSetter = "";
            String objectString = "    public String toString() {\n        return \"" + className + "{\" + ";
            ArrayList<String> singleToString = new ArrayList<>();
            for (Variable v : variables) {
                fileds += v.toFiledCode() + "\n";
                getterSetter += v.setter() + "\n\n" + v.getter() + "\n";
                singleToString.add(String.format("\"%s=\" + %s", v.fieldName, v.fieldName));
            }

            objectString = objectString + String.join(" + ", singleToString) + " + \"}\";\n    }";
            String code = fileds + "\n\n" + getterSetter + "\n\n" + objectString;
            code = template.replaceAll("\\{className\\}", className).replaceAll("\\{code\\}", code);
            writeFile(code, domainDir + "/" + className + ".java");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public static void main(String[] argv) {
        String domainDir = "/home/xanarry/Workspace/IdeaProjects/agriculture/src/com/agriculture/dataBase/domain";
        String daoDir = "/home/xanarry/Workspace/IdeaProjects/agriculture/src/com/agriculture/dataBase/dao";
        String mapperDir = "/home/xanarry/Workspace/IdeaProjects/agriculture/src/com/agriculture/dataBase/mapper";

        Map<String, Table> tables = null;
        try {
            tables = loadTable("/home/xanarry/Workspace/IdeaProjects/agriculture/src/com/agriculture/dataBase/sql.txt");
        } catch (IOException e) {
            e.printStackTrace();
        }

        for (String k : tables.keySet()) {
            Table table = tables.get(k);
            System.out.println(k + " " + table.primarkeyType + " " + table.primaryKey + " " + table.autoIncrement);
            generateDomain(domainDir, k, table.variables);
            System.out.println("generate domain file: " + k);


            Class clz = null;
                try {
                    clz = Class.forName("com.agriculture.dataBase.domain." + k);
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            if (clz != null) {
                generateDao(daoDir, table.primaryKey, table.primarkeyType, clz);
                System.out.println("generate dao    file: " + k);
                generateMapper(mapperDir, clz, table.tableName, table.primaryKey, table.autoIncrement ? "true" : "false");
                System.out.println("generate mapper file: " + k);
            }

        }
        Scanner scanner = new Scanner(System.in);
        scanner.nextLine();
    }

}
