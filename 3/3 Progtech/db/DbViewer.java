import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.sql.*;
import com.formdev.flatlaf.FlatLightLaf;
import javax.swing.UIManager;

public class DbViewer extends JFrame {
  private JTable table;
  private DefaultTableModel tableModel;
  private final String jdbcUrl;

  static {
    try {
      UIManager.setLookAndFeel(new FlatLightLaf());
    } catch (Exception e) {
      System.err.println("Failed to initialize FlatLaf");
    }
  }

  public DbViewer(String jdbcUrl) {
    this.jdbcUrl = jdbcUrl;
    setTitle("Derby Database Viewer");
    setSize(600, 400);
    setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

    tableModel = new DefaultTableModel();
    table = new JTable(tableModel);

    JButton refreshButton = new JButton("Refresh Data");
    refreshButton.addActionListener(e -> refreshData());

    setLayout(new BorderLayout());
    add(new JScrollPane(table), BorderLayout.CENTER);
    add(refreshButton, BorderLayout.NORTH);

    refreshData();
  }

  private void refreshData() {
    try {
      Connection conn = DriverManager.getConnection(jdbcUrl);
      Statement stmt = conn.createStatement();
      ResultSet rs = stmt.executeQuery("SELECT * FROM users");

      ResultSetMetaData metaData = rs.getMetaData();
      int columnCount = metaData.getColumnCount();

      tableModel.setRowCount(0);
      tableModel.setColumnCount(0);

      for (int i = 1; i <= columnCount; i++) {
        tableModel.addColumn(metaData.getColumnName(i));
      }

      while (rs.next()) {
        Object[] row = new Object[columnCount];
        for (int i = 1; i <= columnCount; i++) {
          row[i - 1] = rs.getObject(i);
        }
        tableModel.addRow(row);
      }

      rs.close();
      stmt.close();
      conn.close();
    } catch (SQLException e) {
      e.printStackTrace();
      JOptionPane.showMessageDialog(this, "Error loading data: " + e.getMessage());
    }
  }
}
