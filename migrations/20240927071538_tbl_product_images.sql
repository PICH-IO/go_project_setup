-- +goose Up
CREATE TABLE IF NOT EXISTS tbl_product_images (
    image_id SERIAL PRIMARY KEY,
    product_id INT,
    image_url TEXT NOT NULL,
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES tbl_products(product_id) ON DELETE CASCADE
);

-- +goose Down
DROP TABLE IF EXISTS tbl_product_images;
