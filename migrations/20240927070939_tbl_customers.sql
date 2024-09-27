-- +goose Up

-- Create ENUM types for user roles
CREATE TYPE user_role_enum AS ENUM ('admin', 'sub_admin', 'customer');

-- Create the tbl_users table
CREATE TABLE IF NOT EXISTS tbl_users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    role user_role_enum NOT NULL,
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
DROP TABLE IF EXISTS tbl_users;
DROP TYPE IF EXISTS user_role_enum;
