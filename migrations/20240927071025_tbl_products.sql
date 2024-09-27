-- +goose Up
CREATE TABLE IF NOT EXISTS tbl_products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    category_id INT,
    brand VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    deleted_at TIMESTAMP,
    deleted_by INT,
    status BOOLEAN DEFAULT TRUE,
    order_by INT DEFAULT 0,
    FOREIGN KEY (category_id) REFERENCES tbl_categories(category_id)
);

-- +goose Down
DROP TABLE IF EXISTS tbl_products;
