-- +goose Up
CREATE TABLE IF NOT EXISTS tbl_user_roles (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
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
DROP TABLE IF EXISTS tbl_user_roles;
