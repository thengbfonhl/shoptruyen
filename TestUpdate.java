import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class TestUpdate {
    public static void main(String[] args) {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopmilk?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true", "root", "");
            PreparedStatement stmt = conn.prepareStatement(
                "UPDATE product SET name=?, price=?, quantity=?, cate_id=?, image=? WHERE id=?"
            );
            stmt.setString(1, "Thaanggg");
            stmt.setLong(2, 233333);
            stmt.setInt(3, 22);
            stmt.setInt(4, 2);
            stmt.setString(5, "static/images/phone/robot.png");
            stmt.setInt(6, 1);
            
            stmt.executeUpdate();
            System.out.println("Update successful!");
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
