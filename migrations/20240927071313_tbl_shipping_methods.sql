-- +goose Up
CREATE TABLE IF NOT EXISTS tbl_shipping_methods (
    method_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    delivery_time VARCHAR(50),
    price DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    deleted_at TIMESTAMP,
    deleted_by INT,
    status BOOLEAN DEFAULT TRUE,
    order_by INT DEFAULT 0
);

-- +goose Down
DROP TABLE IF EXISTS tbl_shipping_methods;
