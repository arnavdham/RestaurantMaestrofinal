package screens;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class LoginWindow extends JFrame {

    private JTextField usernameField;
    private JPasswordField passwordField;
    private String role;

    public LoginWindow(String role) {
        this.role = role;
        setTitle("Login - " + role);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(300, 200);
        setLocationRelativeTo(null);// Center the window
        setResizable(false);

        // Create main panel with BorderLayout
        JPanel mainPanel = new JPanel(new BorderLayout());

        // Create panel for login fields with GridLayout
        JPanel loginPanel = new JPanel(new GridLayout(3, 2));

        JLabel usernameLabel = new JLabel("Username:");
        usernameLabel.setBorder(BorderFactory.createEmptyBorder(10, 40, 0, 10));
        usernameField = new JTextField();
        usernameField.setPreferredSize(new Dimension(150, 15)); // Set preferred size
        usernameField.setBorder(BorderFactory.createEmptyBorder(10, 0, 0, 40));
        usernameField.setBorder(BorderFactory.createLineBorder(Color.black, 1));

        JLabel passwordLabel = new JLabel("Password:");
        passwordLabel.setBorder(BorderFactory.createEmptyBorder(10, 40, 0, 10));
        passwordField = new JPasswordField();
        passwordField.setPreferredSize(new Dimension(150, 15)); // Set preferred size
        passwordField.setBorder(BorderFactory.createLineBorder(Color.black, 1));

        loginPanel.add(usernameLabel);
        loginPanel.add(usernameField);
        // loginPanel.add(Box.createVerticalStrut(20));
        loginPanel.add(passwordLabel);
        loginPanel.add(passwordField);

        // Add login panel to main panel (centered)
        mainPanel.add(loginPanel, BorderLayout.CENTER);

        // Create panel for login button with FlowLayout (centered)
        JPanel buttonPanel = new JPanel(new FlowLayout(FlowLayout.CENTER));
        JButton loginButton = new JButton("Login");

        loginButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                String username = usernameField.getText();
                String password = String.valueOf(passwordField.getPassword());

                // Perform login validation (dummy validation for demo)
                if (username.equals("admin") && password.equals("admin")) {
                    dispose(); // Close the login window
                    // Open the main system with respective role
                    System.out.println("DONE!");
                } else {
                    JOptionPane.showMessageDialog(LoginWindow.this, "Invalid username or password", "Error",
                            JOptionPane.ERROR_MESSAGE);
                }
            }
        });

        buttonPanel.add(loginButton);

        // Add button panel to main panel (south position)
        mainPanel.add(buttonPanel, BorderLayout.AFTER_LAST_LINE);

        getContentPane().add(mainPanel);
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            new LoginWindow("waiter").setVisible(true);
        });
    }
}
