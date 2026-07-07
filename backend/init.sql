-- File khởi tạo dữ liệu giả cho bảng stories trong blog.db
-- Chỉ tạo cấu trúc bảng và dữ liệu mẫu, không tạo database trực tiếp.

CREATE TABLE IF NOT EXISTS stories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    thumbnail TEXT NOT NULL,
    title TEXT NOT NULL,
    path_page TEXT NOT NULL,
    publish_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
