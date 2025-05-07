-- Gardening Inventory Management 
-- Step 1: Create the Database
CREATE DATABASE gardening_inventory;

-- Step 2: Use the Database
USE gardening_inventory;

-- Step 3: Create the Tables
-- Table: Category
CREATE TABLE Category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

-- Table: Supplier
CREATE TABLE Supplier (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100),
    phone VARCHAR(20)
);

-- Table: Location
CREATE TABLE Location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location_name VARCHAR(100) NOT NULL UNIQUE
);

-- Table: Plant
CREATE TABLE Plant (
    plant_id INT AUTO_INCREMENT PRIMARY KEY,
    plant_name VARCHAR(100) NOT NULL,
    category_id INT,
    supplier_id INT,
    location_id INT,
    quantity INT NOT NULL,
    price DECIMAL(6,2),
    FOREIGN KEY (category_id) REFERENCES Category(category_id),
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id),
    FOREIGN KEY (location_id) REFERENCES Location(location_id)
);

-- Table: StockOrder
CREATE TABLE StockOrder (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT NOT NULL,
    order_date DATE NOT NULL,
    expected_delivery DATE,
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);

-- Table: OrderDetail (Many-to-Many between StockOrder and Plant)
CREATE TABLE OrderDetail (
    order_id INT,
    plant_id INT,
    quantity_ordered INT NOT NULL,
    PRIMARY KEY (order_id, plant_id),
    FOREIGN KEY (order_id) REFERENCES StockOrder(order_id),
    FOREIGN KEY (plant_id) REFERENCES Plant(plant_id)
);
