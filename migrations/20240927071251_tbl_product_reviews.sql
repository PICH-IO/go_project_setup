-- +goose Up
CREATE TABLE IF NOT EXISTS tbl_product_reviews (
    review_id SERIAL PRIMARY KEY,
    user_id INT,
    product_id INT,
    rating INT CHECK(rating BETWEEN 1 AND 5),
    review_text TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    deleted_at TIMESTAMP,
    deleted_by INT,
    status BOOLEAN DEFAULT TRUE,
    order_by INT DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES tbl_users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES tbl_products(product_id) ON DELETE CASCADE
);

-- +goose Down
DROP TABLE IF EXISTS tbl_product_reviews;
