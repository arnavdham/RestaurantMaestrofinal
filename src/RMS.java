import javax.swing.*;
import screens.RoleSelectionPage;

public class RMS {
    public static void main(String args[]) {

        SwingUtilities.invokeLater(() -> {
            new RoleSelectionPage().setVisible(true);
        });
    }
}
