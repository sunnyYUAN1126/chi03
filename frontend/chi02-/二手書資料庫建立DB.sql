-- 建立資料庫
CREATE DATABASE IF NOT EXISTS secondhand_books_db
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE secondhand_books_db;

------------------------------------------------------------
-- 1. 使用者 users
------------------------------------------------------------
CREATE TABLE users (
    user_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    account VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    student_id VARCHAR(50),
    department VARCHAR(100),
    role ENUM('會員', '管理員') DEFAULT '會員',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

------------------------------------------------------------
-- 2. 商品 products（賣家上架的二手書）
------------------------------------------------------------
CREATE TABLE products (
    product_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    seller_id BIGINT NOT NULL,
    book_ISBN VARCHAR(20),
    book_name VARCHAR(255) NOT NULL,
    category ENUM('文學類','社會科學類','商業管理類','理工資訊類','醫學健康類'),
    book_author VARCHAR(255),
    book_publisher VARCHAR(255),
    product_new ENUM('九成','八成','七成','六成','五成','四成','三成','二成','一成'),
    product_class_note ENUM('無','少量筆記','大量筆記'),
    product_note TEXT,
    product_price INT NOT NULL,
    product_stock INT DEFAULT 1,
    shelf_status ENUM('上架','下架') DEFAULT '下架',
    admin_review ENUM('待審核','審核通過','審核不通過') DEFAULT '待審核',
    admin_note TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_products_seller
        FOREIGN KEY (seller_id) REFERENCES users(user_id)
        ON DELETE CASCADE
);

------------------------------------------------------------
-- 3. 商品圖片 product_images
------------------------------------------------------------
CREATE TABLE product_images (
    image_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    product_id BIGINT NOT NULL,
    image_url VARCHAR(500),
    sort_order INT,

    CONSTRAINT fk_images_product
        FOREIGN KEY (product_id) REFERENCES products(product_id)
        ON DELETE CASCADE
);

------------------------------------------------------------
-- 4. 購物車 carts
------------------------------------------------------------
CREATE TABLE carts (
    cart_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    buyer_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_cart_buyer
        FOREIGN KEY (buyer_id) REFERENCES users(user_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_cart_product
        FOREIGN KEY (product_id) REFERENCES products(product_id)
        ON DELETE CASCADE
);

------------------------------------------------------------
-- 5. 訂單 orders
------------------------------------------------------------
CREATE TABLE orders (
    orders_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    buyer_id BIGINT NOT NULL,
    seller_id BIGINT NOT NULL,   -- 新增的欄位
    product_id BIGINT NOT NULL,
    meetup_location ENUM('管院前門','文學院前門','理學院前門','醫學院前門') NOT NULL,
    meetup_date DATE NOT NULL,
    meetup_time ENUM(
        '第一節下課','第二節下課','第三節下課','第四節下課',
        '第五節下課','第六節下課','第七節下課','第八節下課'
    ) NOT NULL,
    status ENUM('取消','待面交','完成') DEFAULT '待面交',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_orders_buyer
        FOREIGN KEY (buyer_id) REFERENCES users(user_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_orders_seller
        FOREIGN KEY (seller_id) REFERENCES users(user_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_orders_product
        FOREIGN KEY (product_id) REFERENCES products(product_id)
        ON DELETE CASCADE
);

