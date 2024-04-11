package screens.waiter;

import javax.swing.*;

import java.awt.*;
import java.awt.event.*;
import java.sql.*;

public class TableInfoPage extends JFrame {

    public TableInfoPage(int table_number, Connection sql_con) {
        super("Table Info");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(400, 300);
        try {

            Statement stmt = sql_con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            // select mi.item_id, mi.item_name, oi.comment, oi.quantity_ordered,
            // oi.item_status from menu_item mi join ordered_item oi using (item_id) where
            // order_id in (select order_id from restaurant_order where order_id in (select
            // order_id from seated_at where table_number=3) and order_status='active');
            ResultSet rs = stmt.executeQuery(
                    "SELECT mi.item_id, mi.item_name, oi.comment, oi.quantity_ordered, oi.item_status FROM menu_item mi JOIN ordered_item oi USING (item_ID) WHERE order_id in (SELECT order_id FROM restaurant_order WHERE order_id IN (SELECT order_id FROM seated_at WHERE table_number="
                            + table_number + " AND order_status='active'))");
            // Panel for current order section
            JPanel currentOrderPanel = new JPanel(new BorderLayout());
            JTextArea orderTextArea = new JTextArea(10, 20);
            orderTextArea.setEditable(false);
            JScrollPane orderScrollPane = new JScrollPane(orderTextArea);
            currentOrderPanel.add(new JLabel("Current Order"), BorderLayout.NORTH);
            currentOrderPanel.add(orderScrollPane, BorderLayout.CENTER);

            // Populate current orders
            updateOrderTextArea(orderTextArea, rs);

            // Add current order panel to the frame
            JPanel actionsPanel = new JPanel(new FlowLayout());
            JButton placeOrderButton = new JButton("Place Order");
            placeOrderButton.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    dispose();
                }
            });
            JButton generateInvoiceButton = new JButton("Generate Invoice");
            actionsPanel.add(placeOrderButton);
            actionsPanel.add(generateInvoiceButton);

            // Add panels to the frame
            add(currentOrderPanel, BorderLayout.CENTER);
            add(actionsPanel, BorderLayout.SOUTH);

            setVisible(true);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    private void updateOrderTextArea(JTextArea orderTextArea, ResultSet rs) throws SQLException {
        orderTextArea.setText("");
        for (; rs.next();) {
            orderTextArea.append(
                    String.format("Item: %s | Status: %s | Quantity: %s | Comment: %s\n", rs.getString("item_name"),
                            rs.getString("item_status"), rs.getString("quantity_ordered"), rs.getString("comment")));
        }

    }

}
