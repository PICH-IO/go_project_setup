-- +goose Up
CREATE TABLE IF NOT EXISTS tbl_payments (
    payment_id SERIAL PRIMARY KEY,
    order_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    payment_method payment_method_enum NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    transaction_id VARCHAR(255) UNIQUE,
    payment_status VARCHAR(255) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    deleted_at TIMESTAMP,
    deleted_by INT,
    status BOOLEAN DEFAULT TRUE,
    order_by INT DEFAULT 0,
    FOREIGN KEY (order_id) REFERENCES tbl_orders(order_id) ON DELETE CASCADE
);

-- +goose Down
DROP TABLE IF EXISTS tbl_payments;
