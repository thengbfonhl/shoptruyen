import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class FixDB {
    public static void main(String[] args) {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopmilk?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true", "root", "");
            Statement stmt = conn.createStatement();
            stmt.executeUpdate("ALTER TABLE `order` MODIFY COLUMN status INT(11) NOT NULL DEFAULT 0");
            System.out.println("Database altered successfully.");
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
