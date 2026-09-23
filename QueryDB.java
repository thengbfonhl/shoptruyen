import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class QueryDB {
    public static void main(String[] args) {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopmilk?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true", "root", "");
            Statement stmt = conn.createStatement();
            
            // Get schema
            ResultSet rs = stmt.executeQuery("SHOW COLUMNS FROM product");
            System.out.println("--- PRODUCT SCHEMA ---");
            while (rs.next()) {
                System.out.println(rs.getString("Field") + " - " + rs.getString("Type") + " - " + rs.getString("Null"));
            }
            
            // Get data for id 1
            rs = stmt.executeQuery("SELECT * FROM product WHERE id = 1");
            System.out.println("--- PRODUCT 1 DATA ---");
            if (rs.next()) {
                System.out.println("name: " + rs.getString("name"));
                System.out.println("price: " + rs.getString("price"));
                System.out.println("quantity: " + rs.getString("quantity"));
                System.out.println("image: " + rs.getString("image"));
            }
            
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
