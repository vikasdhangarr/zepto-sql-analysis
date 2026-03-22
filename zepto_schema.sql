DROP TABLE IF EXISTS zepto;

CREATE TABLE zepto (
    sku_id SERIAL PRIMARY KEY,
    category VARCHAR(120) NOT NULL,
    name VARCHAR(150) NOT NULL,
    mrp NUMERIC(8,2) CHECK (mrp >= 0),
    discountPercent NUMERIC(5,2) CHECK (discountPercent >= 0 AND discountPercent <= 100),
    availableQuantity INTEGER CHECK (availableQuantity >= 0),
    discountedSellingPrice NUMERIC(8,2) CHECK (discountedSellingPrice >= 0),
    weightInGms INTEGER CHECK (weightInGms > 0),
    outOfStock BOOLEAN DEFAULT FALSE,
    quantity INTEGER CHECK (quantity > 0)
);
