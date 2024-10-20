package com.quangthuc.thucbqpc08717_asm_java_3.DAO;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import java.sql.*;

public class DataDAO {
    private static String jdbcUrl = "jdbc:sqlserver://localhost:1433;databaseName=sales_phone;encrypt=true;trustServerCertificate=true;";
    private static String username = "sa";
    private static String password = "quangthucdz@0310";
    private static HikariDataSource dataSource;

    static {
        // Cấu hình HikariCP
        HikariConfig config = new HikariConfig();
        config.setJdbcUrl("jdbc:sqlserver://localhost:1433;databaseName=sales_phone;encrypt=true;trustServerCertificate=true;");
        config.setUsername("sa");
        config.setPassword("quangthucdz@0310");
        config.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        config.setMaximumPoolSize(10);

        // Tạo DataSource
        dataSource = new HikariDataSource(config);
    }

    public static Connection getConnectionData() throws SQLException {
        return dataSource.getConnection();
    }

    public static Connection getConnection(){
        Connection connection = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(jdbcUrl, username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    };

    public static PreparedStatement getStmt(String sql, Object... args) throws SQLException {
        PreparedStatement pstmt = null;
        if (sql.trim().startsWith("{")) {
            pstmt = getConnection().prepareCall(sql);
        } else {
            pstmt = getConnection().prepareStatement(sql);
        }
        for (int i = 0; i < args.length; i++) {
            pstmt.setObject(i + 1, args[i]);
        }
        return pstmt;
    }

    public static PreparedStatement getStmtInsert(String sql, Object... args) throws SQLException {
        PreparedStatement stmt = getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        for (int i = 0; i < args.length; i++) {
            if (args[i] == null) {
                stmt.setNull(i + 1, java.sql.Types.NULL);
            } else if (args[i] instanceof Integer) {
                stmt.setInt(i + 1, (Integer) args[i]);
            } else if (args[i] instanceof Long) {
                stmt.setLong(i + 1, (Long) args[i]);
            } else if (args[i] instanceof String) {
                stmt.setString(i + 1, (String) args[i]);
            } else if (args[i] instanceof Boolean) {
                stmt.setBoolean(i + 1, (Boolean) args[i]);
            } else if (args[i] instanceof java.util.Date) {
                stmt.setTimestamp(i + 1, new java.sql.Timestamp(((java.util.Date) args[i]).getTime()));
            } else {
                stmt.setObject(i + 1, args[i]); // Dùng setObject cho các kiểu khác
            }
        }
        return stmt;
    }

    public static void update(String sql, Object... args) {
        try {
            PreparedStatement stmt = DataDAO.getStmt(sql, args);
            try {
                stmt.executeUpdate();
            } finally {
                stmt.getConnection().close();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void updateGetIdGenerated(String sql, Object... args) {
        int generatedId = -1;
        try {
            PreparedStatement stmt = DataDAO.getStmtInsert(sql, args, Statement.RETURN_GENERATED_KEYS);

            int rowsAffected = stmt.executeUpdate();
            System.out.println("Rows affected: " + rowsAffected);

            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                generatedId = rs.getInt(1);
                System.out.println("Generated Id: " + generatedId);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public static ResultSet query(String sql, Object... args) {
        try {
            PreparedStatement stmt = DataDAO.getStmt(sql, args);
            return stmt.executeQuery();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static Object value(String sql, Object... args) {
        try {
            ResultSet rs = DataDAO.query(sql, args);
            if (rs.next()) {
                return rs.getObject(0);
            }
            rs.getStatement().getConnection().close();
            return null;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
