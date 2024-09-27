-- +goose Up
CREATE TABLE IF NOT EXISTS tbl_order_details (
    order_detail_id SERIAL PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    discount DECIMAL(5, 2) DEFAULT 0,
    total_price DECIMAL(10, 2) GENERATED ALWAYS AS (quantity * unit_price - discount) STORED,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    deleted_at TIMESTAMP,
    deleted_by INT,
    status BOOLEAN DEFAULT TRUE,
    order_by INT DEFAULT 0,
    FOREIGN KEY (order_id) REFERENCES tbl_orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES tbl_products(product_id) ON DELETE SET NULL
);

-- +goose Down
DROP TABLE IF EXISTS tbl_order_details;
