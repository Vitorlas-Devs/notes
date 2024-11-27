import java.sql.*;

import javax.swing.SwingUtilities;

import db.DbViewer;

public class Main {
  private static final String JDBC_URL = "jdbc:derby:data/testdb;create=true";

  public static void main(String[] args) {
    try {
      System.setProperty("derby.system.home", "3/3 Progtech/11");
      Class.forName("org.apache.derby.jdbc.EmbeddedDriver");

      try (Connection conn = DriverManager.getConnection(JDBC_URL)) {
        createTable(conn);

        insertData(conn, "John Doe", 25);
        insertData(conn, "Jane Smith", 30);

        queryData(conn);
      }
    } catch (Exception e) {
      e.printStackTrace();
    }

    SwingUtilities.invokeLater(() -> {
        new DbViewer(JDBC_URL).setVisible(true);
    });
  }

  private static void createTable(Connection conn) throws SQLException {
    String sql = "CREATE TABLE users (" +
        "id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY," +
        "name VARCHAR(255)," +
        "age INTEGER)";

    try (Statement stmt = conn.createStatement()) {
      stmt.execute(sql);
    } catch (SQLException e) {
      if (!e.getSQLState().equals("X0Y32")) // Ignore "Table already exists"
        throw e;
    }
  }

  private static void insertData(Connection conn, String name, int age) throws SQLException {
    String sql = "INSERT INTO users (name, age) VALUES (?, ?)";
    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
      pstmt.setString(1, name);
      pstmt.setInt(2, age);
      pstmt.executeUpdate();
    }
  }

  private static void queryData(Connection conn) throws SQLException {
    String sql = "SELECT * FROM users";
    try (Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql)) {
      while (rs.next()) {
        System.out.printf("ID: %d, Name: %s, Age: %d%n",
            rs.getInt("id"),
            rs.getString("name"),
            rs.getInt("age"));
      }
    }
  }
}
