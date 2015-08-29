package com.nfwork.demo.tool;

import com.nfwork.dbfound.core.Context;
import com.nfwork.dbfound.core.DBFoundConfig;
import freemarker.template.Configuration;
import freemarker.template.Template;

import java.io.OutputStreamWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class GenerateModel {

    public static String tablename = "sys_user";
    public static String pk = "user_id";

    public static void main(String[] args) throws SQLException {
        Table table = getTable();
        for (Column column : table.getColumnlist()) {
            column.setType(getDataType(column.getDataType()));
        }
        generateModel(table);
    }

    public static void generateModel(Table table) {
        try {
            Configuration cfg = FreemarkFactory.getConfig();
            Template template = cfg.getTemplate("model.ftl");
            Map<String, Object> root = new HashMap<String, Object>();
            root.put("table", table);
            Column pkcColumn = null;
            for (Column column : table.getColumnlist()) {
                if (column.getColumnName().equals(pk)) {
                    pkcColumn = column;
                    break;
                }
            }
            table.getColumnlist().remove(pkcColumn);
            root.put("pk", pkcColumn);
            template.process(root, new OutputStreamWriter(System.out));
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void model(Table table) {
        List<Column> columns = table.getColumnlist();
        StringBuilder str = new StringBuilder();

        str.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
        str
                .append("<model xmlns=\"http://dbfound.googlecode.com/model\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://dbfound.googlecode.com/model https://dbfound.googlecode.com/svn/tags/v2/model.xsd\">\n\t");
        str.append("<query>\n\t\t");
        str.append("<sql><![CDATA[\n\t\t\t");
        str.append("select * from " + table.getTableName() + "\n\t\t\t");
        str.append("#WHERE_CLAUSE#\n\t\t");
        str.append("]]></sql>\n\t");
        str.append("</query>\n");
        str.append("\n\t");

        str.append("<execute name=\"add\">\n\t\t");
        for (Column column : columns) {
            str.append("<param name=\"" + column.getColumnName()
                    + "\" dataType=\"" + getDataType(column.getDataType())
                    + "\" />\n\t\t");
        }
        str.append("<executeSql><![CDATA[\n\t\t\t");
        str.append("insert into " + table.getTableName() + "() \n\t\t\t");
        str.append("values() \n\t\t");
        str.append("]]></executeSql>\n\t");
        str.append("</execute>\n");
        str.append("\n\t");

        str.append("<execute name=\"update\">\n\t\t");
        for (Column column : columns) {
            str.append("<param name=\"" + column.getColumnName()
                    + "\" dataType=\"" + getDataType(column.getDataType())
                    + "\" />\n\t\t");
        }
        str.append("<executeSql><![CDATA[\n\t\t\t");
        str.append("insert into " + table.getTableName() + "() \n\t\t\t");
        str.append("values() \n\t\t");
        str.append("]]></executeSql>\n\t");
        str.append("</execute>\n");
        str.append("\n\t");

        int key = 0;
        for (Column column : columns) {
            if (column.getColumnName().equals(pk)) {
                key = column.getDataType();
                break;
            }
        }

        str.append("<execute name=\"delete\">\n\t\t");
        str.append("<param name=\"" + pk + "\" dataType=\"" + getDataType(key)
                + "\" />\n\t\t");
        str.append("<executeSql><![CDATA[\n\t\t\t");
        str.append("delete from " + table.getTableName() + "where " + pk
                + " = ${@" + pk + "} \n\t\t");
        str.append("]]></executeSql>\n\t");
        str.append("</execute>\n");

        str.append("</model>");

        System.out.println(str);
    }

    public static String getDataType(int key) {
        switch (key) {
            case Types.VARCHAR:
                return "varchar";
            case Types.INTEGER:
                return "number";
            case Types.DOUBLE:
                return "number";
            case Types.FLOAT:
                return "number";
            case Types.DECIMAL:
                return "number";
            case Types.NUMERIC:
                return "number";
            case Types.VARBINARY:
                return "number";
            case Types.BIGINT:
                return "number";
            case Types.REAL:
                return "number";
            default:
                return "varchar";
        }
    }

    public static Table getTable() {
        DBFoundConfig.init("${@projectRoot}/WEB-INF/dbfound-conf.xml");
        Context context = new Context();
        try {
            Connection connection = context.getConn();

            DatabaseMetaData dbmetadata = connection.getMetaData();
            ResultSet rs = dbmetadata.getTables(null, null, tablename,
                    new String[]{"TABLE"});

            List<Table> tablelist = new ArrayList<Table>();
            while (rs.next()) {
                Table table = new Table();
                table.setTableName(rs.getString("TABLE_NAME"));
                table.setRemarks(rs.getString("REMARKS"));
                tablelist.add(table);
            }
            rs.close();

            Table table = (Table) tablelist.get(0);
            rs = dbmetadata.getColumns(null, null, table.getTableName(), null);

            List<Column> columnlist = new ArrayList<Column>();
            while (rs.next()) {
                Column column = new Column();
                column.setColumnName(rs.getString("COLUMN_NAME"));
                column.setDataType(rs.getInt("DATA_TYPE"));
                column.setRemarks(rs.getString("REMARKS"));
                column.setColumnSize(rs.getInt("COLUMN_SIZE"));
                column.setNullAble(rs.getString("IS_NULLABLE"));
                column.setDefaultValue(rs.getString("COLUMN_DEF"));
                column.setAutoIncrement(rs.getString("IS_AUTOINCREMENT"));
                columnlist.add(column);
            }
            table.setColumnlist(columnlist);
            return table;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            context.closeConns();
        }
        return null;
    }

}
