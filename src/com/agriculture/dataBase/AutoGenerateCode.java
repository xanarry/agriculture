package com.agriculture.database;
import javax.print.DocFlavor;
import java.io.*;
import java.lang.reflect.Field;
import java.util.*;
class PrimaryKey {
    String primaryKey;
    String PrimaryKeyType;
    public PrimaryKey(String primaryKeyType, String primaryKey) {
        this.primaryKey = primaryKey;
        PrimaryKeyType = primaryKeyType;
    }
}
class Table {
    String tableName;
    List<PrimaryKey> primaryKeys;
    boolean autoIncrement;
    List<Variable> variables;
    public Table(String tableName, List<PrimaryKey> primaryKeys, boolean autoIncrement, List<Variable> variables) {
        this.tableName = tableName;
        this.primaryKeys = primaryKeys;
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
    public static void generateDao(String daoDir, List<PrimaryKey> primaryKeys, Class clz) {
        String className = clz.getSimpleName();
        String varName = Character.toLowerCase(className.charAt(0)) + className.substring(1);
        List<String> strPrimaryKeys = new ArrayList<>();
        for (PrimaryKey pk : primaryKeys) {
            strPrimaryKeys.add(String.format("@Param(\"%s\") %s %s", pk.primaryKey, pk.PrimaryKeyType, pk.primaryKey));
        }
        try {
            String daoCode = readFile(daoDir + "/TemplateDao.txt");
            daoCode = daoCode
                    .replaceAll("\\{className\\}", className)
                    .replaceAll("\\{varName\\}", varName)
                    .replaceAll("\\{primaryKey\\}", String.join(", ", strPrimaryKeys));
            writeFile(daoCode, daoDir + "/" + className + "Dao.java");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public static boolean isPrimaryKey(List<PrimaryKey> primaryKeys, String variable) {
        for (PrimaryKey pk : primaryKeys) {
            if (pk.primaryKey.equals(variable)) {
                return true;
            }
        }
        return false;
    }
    public static void generateMapper(String mapperDir, Class clz, String tableName, List<PrimaryKey> primaryKeys, String generateKey) {
        Field[] fields = clz.getDeclaredFields();
        List<String> fieldsName = new ArrayList<>(fields.length);
        List<String> valueStrs = new ArrayList<>(fields.length);
        List<String> updates = new ArrayList<>(fields.length);
        String className = clz.getSimpleName();
        String varName = Character.toLowerCase(className.charAt(0)) + className.substring(1);
        //keyProperty="{varName}.{primaryKey}" keyColumn="{primaryKey}" useGeneratedKeys="{generateKey}"
        //keyProperty="%s.%s" keyColumn="%s" useGeneratedKeys="%s"
        String autocrement = "";
        if (generateKey.equals("true")) {
            autocrement = String.format("keyProperty=\"%s.%s\" keyColumn=\"%s\" useGeneratedKeys=\"%s\"",
                    varName,
                    primaryKeys.get(0).primaryKey,
                    primaryKeys.get(0).primaryKey,
                    generateKey);
        }
        List<String> deleteConditions = new ArrayList<>();
        List<String> updateConditions = new ArrayList<>();
        //`` = #{{varName}.{primaryKey}}
        for (PrimaryKey pk : primaryKeys) {
            deleteConditions.add(String.format("`%s`=#{%s}", pk.primaryKey, pk.primaryKey));
            updateConditions.add(String.format("`%s`=#{%s.%s}", pk.primaryKey, varName, pk.primaryKey));
        }
        for (int i = 0; i < fields.length; i++) {
            String k = "`" + fields[i].getName() + "`";
            String v = "#{" + varName + "." + fields[i].getName() + "}";
            //check if is primary key
            if (isPrimaryKey(primaryKeys, fields[i].getName())) {
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
                    .replaceAll("\\{autocrement\\}", autocrement)
                    .replaceAll("\\{deleteCondition\\}", String.join(" and ", deleteConditions))
                    .replaceAll("\\{updateCondition\\}", String.join(" and ", updateConditions))
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
        List<PrimaryKey> primaryKeys = null;
        boolean autoIncrement = false;
        Map<String, Table> tables = new HashMap<>();
        String buf = "";
        while ((buf = reader.readLine()) != null) {
            if (buf.toLowerCase().startsWith("create table")) {
                String[] strs = buf.split("\\s+");
                //System.out.println(String.join("|", strs));
                tableName = strs[strs.length - 2];
                String[] words = tableName.replaceFirst("t_", "").split("_");
                for (String w : words) {
                    className += Character.toUpperCase(w.charAt(0)) + w.substring(1);
                }
                variables = new ArrayList<>();
                primaryKeys = new ArrayList<>();
            } else if (!buf.trim().toLowerCase().startsWith("primary key")) {
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
                        primaryKeys.add(new PrimaryKey(type, fieldName));
                        if (buf.toLowerCase().contains("auto_increment")) {
                            autoIncrement = true;
                        }
                    }
                }
                if (buf.toLowerCase().trim().startsWith(")")) {
                    Table table = new Table(tableName, primaryKeys, autoIncrement, variables);
                    tables.put(className, table);
                    variables = new ArrayList<>();
                    className = "";
                    primaryKeys = new ArrayList<>();
                    autoIncrement = false;
                    tableName = "";
                }
            } else if (buf.trim().toUpperCase().startsWith("PRIMARY KEY")) {
                System.out.println("===============" + buf);
                int indexOfStart = buf.indexOf("(");
                int indexOfLast = buf.indexOf(")", indexOfStart);
                //PRIMARY KEY (`employeeID`, `date`) /*不同员工ID与不同的日期作为主键*/
                String pks[] = buf.substring(indexOfStart + 1, indexOfLast).replaceAll("`", "").replaceAll(",", "").split("\\s+");
                for (String pk : pks) {
                    System.out.println(pk);
                    for (int i = 0; i < variables.size(); i++) {
                        if (variables.get(i).fieldName.equals(pk)) {
                            primaryKeys.add(new PrimaryKey(variables.get(i).type, pk));
                        }
                    }
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
            String construct = "    public " + className + "() {}";
            String objectString = "    public String toString() {\n        return \"" + className + " {\"\n             + ";
            ArrayList<String> singleToString = new ArrayList<>();
            for (Variable v : variables) {
                fileds += v.toFiledCode() + "\n";
                getterSetter += v.setter() + "\n\n" + v.getter() + "\n";
                singleToString.add(String.format("\"%s=\" + %s + \",\"\n            ", v.fieldName, v.fieldName));
            }
            objectString = objectString + String.join(" + ", singleToString) + " + \"}\";\n    }";
            String code = fileds + "\n\n" + construct + "\n\n" + getterSetter + "\n\n" + objectString;
            code = template.replaceAll("\\{className\\}", className).replaceAll("\\{code\\}", code);
            writeFile(code, domainDir + "/" + className + ".java");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public static void fullGen(String sqlPath, String domainDir, String daoDir, String mapperDir) {
        Map<String, Table> tables = null;
        try {
            tables = loadTable(sqlPath);
        } catch (IOException e) {
            e.printStackTrace();
        }
        for (String k : tables.keySet()) {
            Table table = tables.get(k);
            System.out.println(k + " " + table.primaryKeys + " " + table.autoIncrement);
            generateDomain(domainDir, k, table.variables);
            System.out.println("generate domain file: " + k);
            Class clz = null;
            try {
                clz = Class.forName("com.agriculture.dataBase.domain." + k);
            } catch (ClassNotFoundException e) {
                System.out.println("class Not found");
            }
            if (clz != null) {
                generateDao(daoDir, table.primaryKeys, clz);
                System.out.println("generate dao    file: " + k);
                generateMapper(mapperDir, clz, table.tableName, table.primaryKeys, table.autoIncrement ? "true" : "false");
                System.out.println("generate mapper file: " + k);
            }
        }
    }
    public static void nonDomainGen(String daoDir, String mapperDir) {
        /*Object[][] toDoList = new Object[][]{
        };
        for (Object[] objects : toDoList) {
            Class clz            = (Class)  objects[0];
            String primarkeyType = (String) objects[1];
            String primaryKey    = (String) objects[2];
            String generateKey   = (String) objects[3];
            String tableName     = (String) objects[4];
            generateDao(daoDir, primaryKey, primarkeyType, clz);
            generateMapper(mapperDir, clz, tableName, primaryKey, generateKey);
        }*/
    }

    public static void main(String[] argv) {
        String platform = System.getProperty("os.name");
        String baseDir = "";
        if (platform.toLowerCase().startsWith("windows")) {
            baseDir = "E:/Workspace/IdeaProjects/agriculture/src/com/agriculture/dataBase/";
        } else {
            baseDir = "/home/xanarry/Workspace/IdeaProjects/agriculture/src/com/agriculture/database/";
        }
        String domainDir = baseDir + "domain";
        String daoDir = baseDir + "dao";
        String mapperDir = baseDir + "mapper";
        String sqlPath = baseDir + "tmp.sql";
        if ("full".equals("full")) {
            fullGen(sqlPath, domainDir, daoDir, mapperDir);
        } else {
            nonDomainGen(daoDir, mapperDir);
        }
    }
}