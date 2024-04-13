package screens.waiter;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.sql.*;

public class TableListPage extends JFrame {
    // Simulating table occupancy status

    public TableListPage(int waiter_id, Connection sql_con) {
        super("Table Interface");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);// Center the window
        setSize(250, 300);
        setResizable(false);

        JPanel panel = new JPanel(new FlowLayout(FlowLayout.CENTER, 10, 10));
        panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS)); // Vertical layout

        try {
            Statement stmt = sql_con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs;
            rs = stmt.executeQuery(
                    "SELECT * FROM restaurant_table WHERE table_number IN (SELECT table_number FROM assign_to WHERE employee_id = "
                            + waiter_id + ")");
            // Creating buttons for each table
            for (; rs.next();) {
                int tableNumber = rs.getInt("table_number");
                String tableStatus = rs.getString("table_status");
                JButton tableButton = new JButton("Table " + tableNumber);
                tableButton.setPreferredSize(new Dimension(150, 40)); // Fixed button size
                tableButton.setOpaque(true);
                if (tableStatus.equalsIgnoreCase("occupied")) {
                    tableButton.setBackground(Color.RED); // Occupied
                    tableButton.addActionListener(new ActionListener() {
                        @Override
                        public void actionPerformed(ActionEvent e) {
                            dispose();
                            new TableInfoPage(tableNumber, sql_con).setVisible(true);
                        }
                    });
                } else if (tableStatus.equalsIgnoreCase("available")) {
                    tableButton.setBackground(Color.GREEN); // Not occupied
                    tableButton.addActionListener(new ActionListener() {
                        @Override
                        public void actionPerformed(ActionEvent e) {
                            dispose();
                            new TableInfoPage(tableNumber, sql_con).setVisible(true);
                        }
                    });
                } else if (tableStatus.equalsIgnoreCase("reserved")) {
                    tableButton.setBackground(Color.BLUE);
                    tableButton.addActionListener(new ActionListener() {
                        @Override
                        public void actionPerformed(ActionEvent e) {
                            dispose();
                            new TableInfoPage(tableNumber, sql_con).setVisible(true);
                        }
                    });
                }
                panel.add(tableButton);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        JScrollPane scrollPane = new JScrollPane(panel); // Add the panel to a scroll pane
        scrollPane.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED);

        add(scrollPane);
        setVisible(true);
    }
}
