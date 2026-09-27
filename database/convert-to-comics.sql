-- Convert the existing demo catalog; preserve IDs, stock and order references.
SET NAMES utf8mb4;
START TRANSACTION;
UPDATE category SET name='Truyện phiêu lưu' WHERE id=1;
UPDATE category SET name='Truyện ninja' WHERE id=2;
UPDATE product SET name='One Piece - Tập 1', price=30000, image='static/images/comics/one-piece-1.jpg', description='Tác giả: Eiichiro Oda. Tập mở đầu hành trình chinh phục biển cả của Luffy. Ảnh bìa minh họa bản tiếng Anh do VIZ phát hành.' WHERE id=1 AND name LIKE '%GrowPLUS%';
UPDATE product SET name='Naruto - Tập 1', price=30000, image='static/images/comics/naruto-1.jpg', description='Tác giả: Masashi Kishimoto. Cùng Naruto bắt đầu hành trình trở thành ninja. Ảnh bìa minh họa bản tiếng Anh do VIZ phát hành.' WHERE id=2 AND name LIKE '%GrowPLUS%';
UPDATE product SET name='One Piece - Tập 2', price=30000, image='static/images/comics/one-piece-2.jpg', description='Tác giả: Eiichiro Oda. Tiếp tục chuyến phiêu lưu cùng Luffy và những người bạn. Ảnh bìa minh họa bản tiếng Anh do VIZ phát hành.' WHERE id=3 AND name LIKE '%GrowPLUS%';
UPDATE product SET name='One Piece - Tập 3', price=30000, image='static/images/comics/one-piece-3.jpg', description='Tác giả: Eiichiro Oda. Một tập tiếp theo dành cho tủ truyện One Piece của bạn. Ảnh bìa minh họa bản tiếng Anh do VIZ phát hành.' WHERE id=6 AND name LIKE '%GrowPLUS%';
UPDATE product SET name='One Piece - Tập 4', price=30000, image='static/images/comics/one-piece-4.jpg', description='Tác giả: Eiichiro Oda. Theo chân băng hải tặc trong những cuộc gặp gỡ mới. Ảnh bìa minh họa bản tiếng Anh do VIZ phát hành.' WHERE id=7 AND name LIKE '%GrowPLUS%';
COMMIT;
