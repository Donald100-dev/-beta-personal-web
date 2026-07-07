-- File khởi tạo dữ liệu giả cho bảng stories trong blog.db
-- Chỉ tạo cấu trúc bảng và dữ liệu mẫu, không tạo database trực tiếp.

CREATE TABLE IF NOT EXISTS stories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    thumbnail TEXT NOT NULL,
    title TEXT NOT NULL,
    path_page TEXT NOT NULL,
    publish_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Mock data
BEGIN;

INSERT INTO stories (thumbnail, title, path_page) VALUES
('https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=800&q=80', 'Khởi đầu một mùa hè mới', 'https://example.com/stories/mua-he-moi'),
('https://images.unsplash.com/photo-1494526585095-c41746248156?auto=format&fit=crop&w=800&q=80', 'Những góc phố buổi sáng', 'https://example.com/stories/goc-pho-sang'),
('https://images.unsplash.com/photo-1517694712202-14dd9538aa97?auto=format&fit=crop&w=800&q=80', 'Cà phê và sáng tạo', 'https://example.com/stories/ca-phe-sang-tao'),
('https://images.unsplash.com/photo-1506126613408-eca07ce68773?auto=format&fit=crop&w=800&q=80', 'Đọc sách trong mưa', 'https://example.com/stories/doc-sach-mua'),
('https://images.unsplash.com/photo-1499856871958-5b9627545d1a?auto=format&fit=crop&w=800&q=80', 'Bí quyết sống chậm', 'https://example.com/stories/song-cham'),
('https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?auto=format&fit=crop&w=800&q=80', 'Đèo cao và nắng đẹp', 'https://example.com/stories/deo-cao'),
('https://images.unsplash.com/photo-1524758631624-e2822e304c36?auto=format&fit=crop&w=800&q=80', 'Màu sắc của thành phố', 'https://example.com/stories/mau-sac-thanh-pho'),
('https://images.unsplash.com/photo-1495745966610-2a67f2297e5e?auto=format&fit=crop&w=800&q=80', 'Một ngày bình yên', 'https://example.com/stories/ngay-binh-yen'),
('https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=800&q=80', 'Nhịp sống đô thị', 'https://example.com/stories/nhip-song-do-thi'),
('https://images.unsplash.com/photo-1480714378408-67cf0d13bc1b?auto=format&fit=crop&w=800&q=80', 'Sáng sớm tại bờ hồ', 'https://example.com/stories/sang-so-bo-ho'),
('https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?auto=format&fit=crop&w=800&q=80', 'Con đường về nhà', 'https://example.com/stories/con-duong-ve-nha'),
('https://images.unsplash.com/photo-1473448912268-2022ce9509d8?auto=format&fit=crop&w=800&q=80', 'Mùa thu chậm rãi', 'https://example.com/stories/mua-thu-cham-rai'),
('https://images.unsplash.com/photo-1441974231531-c6227db76b6e?auto=format&fit=crop&w=800&q=80', 'Rừng xanh và tiếng chim', 'https://example.com/stories/rung-xanh'),
('https://images.unsplash.com/photo-1501785888041-af3ef285b470?auto=format&fit=crop&w=800&q=80', 'Bãi biển cuối tuần', 'https://example.com/stories/bai-bien-cuoi-tuan'),
('https://images.unsplash.com/photo-1500534623283-312aade485b7?auto=format&fit=crop&w=800&q=80', 'Đêm phố đầy sao', 'https://example.com/stories/dem-pho-day-sao'),
('https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=800&q=80', 'Lối đi bên bờ sông', 'https://example.com/stories/loi-di-bo-song'),
('https://images.unsplash.com/photo-1465101046530-73398c7f28ca?auto=format&fit=crop&w=800&q=80', 'Nghỉ ngơi giữa thiên nhiên', 'https://example.com/stories/nghi-ngoi-thien-nhien'),
('https://images.unsplash.com/photo-1500534314209-a25ddb2bd429?auto=format&fit=crop&w=800&q=80', 'Tiếng nhạc buổi chiều', 'https://example.com/stories/tieng-nhac-chieu'),
('https://images.unsplash.com/photo-1493246507139-91e8fad9978e?auto=format&fit=crop&w=800&q=80', 'Chiến thắng nhỏ của ngày', 'https://example.com/stories/chien-thang-nho'),
('https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=800&q=80', 'Bầu trời xanh sau cơn mưa', 'https://example.com/stories/bau-troi-xanh'),
('https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80', 'Vạn vật thức dậy', 'https://example.com/stories/van-vat-thuc-day'),
('https://images.unsplash.com/photo-1516483638261-f4dbaf036963?auto=format&fit=crop&w=800&q=80', 'Những câu chuyện bên ly trà', 'https://example.com/stories/cau-chuyen-ly-tra'),
('https://images.unsplash.com/photo-1494548162494-384bba4ab999?auto=format&fit=crop&w=800&q=80', 'Buổi chiều thư giãn', 'https://example.com/stories/buoi-chieu-thu-gian'),
('https://images.unsplash.com/photo-1519681393784-d120267933ba?auto=format&fit=crop&w=800&q=80', 'Bước chân trên đồi cao', 'https://example.com/stories/buoc-chan-doi-cao'),
('https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=800&q=80', 'Dòng thời gian của ký ức', 'https://example.com/stories/dong-thoi-gian-ky-uc'),
('https://images.unsplash.com/photo-1493558103817-58b2924bce98?auto=format&fit=crop&w=800&q=80', 'Một góc nhìn mới', 'https://example.com/stories/go-canh-nhin-moi'),
('https://images.unsplash.com/photo-1518623489648-a173ef7824f3?auto=format&fit=crop&w=800&q=80', 'Sương sớm trên đồng', 'https://example.com/stories/suong-som-dong'),
('https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=800&q=80', 'Mùa yêu thương trở lại', 'https://example.com/stories/mua-yeu-thuong'),
('https://images.unsplash.com/photo-1527631746610-bca00a040d60?auto=format&fit=crop&w=800&q=80', 'Đường về miền đất mới', 'https://example.com/stories/duong-ve-mien-dat-moi');

COMMIT;
