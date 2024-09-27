-- +goose Up
CREATE TYPE order_status_enum AS ENUM ('pending', 'shipped', 'delivered', 'cancelled');
CREATE TYPE payment_status_enum AS ENUM ('paid', 'unpaid');
CREATE TYPE payment_method_enum AS ENUM ('credit_card', 'paypal', 'bank_transfer');

CREATE TABLE IF NOT EXISTS tbl_orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    shipping_address TEXT NOT NULL,
    shipping_city VARCHAR(100),
    shipping_state VARCHAR(100),
    shipping_country VARCHAR(100),
    shipping_postal_code VARCHAR(20),
    order_status order_status_enum DEFAULT 'pending',
    total_amount DECIMAL(10, 2) NOT NULL,
    payment_status payment_status_enum DEFAULT 'unpaid',
    payment_method payment_method_enum,
    tracking_number VARCHAR(255),
    placed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INT,
    updated_by INT,
    deleted_at TIMESTAMP,
    deleted_by INT,
    status BOOLEAN DEFAULT TRUE,
    order_by INT DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES tbl_users(user_id)
);

-- +goose Down
DROP TABLE IF EXISTS tbl_orders;
DROP TYPE IF EXISTS order_status_enum;
DROP TYPE IF EXISTS payment_status_enum;
DROP TYPE IF EXISTS payment_method_enum;
