# ShopMilk - Website Bán Sữa

Dự án này là một ứng dụng Web bán sữa được xây dựng bằng Spring Boot, sử dụng JSP cho giao diện và MySQL làm cơ sở dữ liệu.

## Công nghệ sử dụng
- **Backend:** Java 11, Spring Boot 2.7.18
- **Frontend:** JSP, JSTL, Spring Security Taglibs
- **Cơ sở dữ liệu:** MySQL 8.0
- **Quản lý thư viện:** Maven

## Yêu cầu hệ thống
- JDK 11
- MySQL Server (đã tạo database tên `shopmilk`)
- IDE (IntelliJ IDEA, Eclipse, VS Code,...)

## Cấu hình hệ thống
Trước khi chạy ứng dụng, hãy đảm bảo bạn đã cấu hình cơ sở dữ liệu trong file `src/main/resources/application.properties`:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/shopmilk?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true
spring.datasource.username=root
spring.datasource.password=your_password_here
```

*Lưu ý: Mặc định password đang để trống. Hãy thay đổi `root` và mật khẩu tương ứng với cấu hình MySQL của bạn.*

## Cách chạy dự án

1.  **Mở terminal** tại thư mục gốc của dự án.
2.  **Cài đặt các thư viện** (nếu cần):
    ```bash
    .\mvnw install
    ```
3.  **Chạy ứng dụng**:
    ```bash
    .\mvnw clean spring-boot:run
    ```
4.  **Truy cập ứng dụng**:
    Sau khi ứng dụng khởi chạy thành công, bạn có thể truy cập tại địa chỉ:
    `http://localhost:9090`

## Các tính năng chính
- Xem danh sách sản phẩm sữa.
- Chi tiết sản phẩm.
- Đăng ký/Đăng nhập tài khoản.
- Quản lý giỏ hàng và thanh toán.
- Bảo mật với Spring Security.

## Cấu trúc thư mục quan trọng
- `src/main/java`: Mã nguồn Java (Controllers, Services, Repositories, Entities).
- `src/main/resources/application.properties`: File cấu hình ứng dụng.
- `src/main/webapp/WEB-INF/jsp`: Thư mục chứa các file giao diện JSP.