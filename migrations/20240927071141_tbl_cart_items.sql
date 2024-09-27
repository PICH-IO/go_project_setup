-- +goose Up
CREATE TABLE IF NOT EXISTS tbl_cart_items (
    cart_id SERIAL PRIMARY KEY,
    user_id INT,
    product_id INT,
    quantity INT NOT NULL,
    added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INT,
    updated_by INT,
    deleted_at TIMESTAMP,
    deleted_by INT,
    status BOOLEAN DEFAULT TRUE,
    order_by INT DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES tbl_users(user_id),
    FOREIGN KEY (product_id) REFERENCES tbl_products(product_id)
);

-- +goose Down
DROP TABLE IF EXISTS tbl_cart_items;
