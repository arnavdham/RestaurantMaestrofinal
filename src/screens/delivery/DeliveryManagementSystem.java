package screens.delivery;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

public class DeliveryManagementSystem extends JFrame {
    private ArrayList<Delivery> deliveries;

    public DeliveryManagementSystem() {
        super("Delivery Management System");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(800, 600);
        getContentPane().setBackground(new Color(240, 240, 240)); // Set background color

        deliveries = new ArrayList<>();

        // Adding more mock data
        for (int i = 1; i <= 20; i++) {
            deliveries.add(new Delivery("Order " + i, "123 Main St, City", "Pending"));
        }

        JPanel mainPanel = new JPanel();
        mainPanel.setLayout(new GridLayout(deliveries.size(), 1));
        mainPanel.setBackground(new Color(240, 240, 240)); // Set background color

        for (Delivery delivery : deliveries) {
            JPanel deliveryPanel = createDeliveryPanel(delivery);
            mainPanel.add(deliveryPanel);
        }

        JScrollPane scrollPane = new JScrollPane(mainPanel);
        scrollPane.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_ALWAYS);
        scrollPane.getViewport().setBackground(new Color(240, 240, 240)); // Set background color for viewport

        add(scrollPane);
        setVisible(true);
    }

    private JPanel createDeliveryPanel(Delivery delivery) {
        JPanel panel = new JPanel();
        panel.setBorder(BorderFactory.createLineBorder(new Color(100, 100, 100), 2)); // Add border
        panel.setLayout(new GridLayout(4, 1));
        panel.setBackground(Color.white); // Set background color

        JLabel orderLabel = new JLabel("Order: " + delivery.getOrder());
        JLabel addressLabel = new JLabel("Address: " + delivery.getAddress());
        JLabel statusLabel = new JLabel("Status: " + delivery.getStatus());
        JButton deliveredButton = new JButton("Delivered");

        deliveredButton.setBackground(new Color(50, 150, 50)); // Set button background color
        deliveredButton.setForeground(Color.white); // Set button text color
        deliveredButton.setFocusPainted(false); // Remove focus border

        deliveredButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                // Change panel color to green when delivered button is pressed
                panel.setBackground(new Color(50, 200, 50));

                // Handle "Delivered" button action here
                JOptionPane.showMessageDialog(panel, "Marked as Delivered: " + delivery.getOrder(),
                        "Delivery Status", JOptionPane.INFORMATION_MESSAGE);
                // You can implement further logic here, like updating the status in the
                // system/database.
            }
        });

        panel.add(orderLabel);
        panel.add(addressLabel);
        panel.add(statusLabel);
        panel.add(deliveredButton);

        return panel;
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                new DeliveryManagementSystem();
            }
        });
    }
}

class Delivery {
    private String order;
    private String address;
    private String status;

    public Delivery(String order, String address, String status) {
        this.order = order;
        this.address = address;
        this.status = status;
    }

    public String getOrder() {
        return order;
    }

    public String getAddress() {
        return address;
    }

    public String getStatus() {
        return status;
    }
}
