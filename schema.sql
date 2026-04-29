 Online Food Ordering System



CREATE DATABASE FoodOrderingDB;
USE FoodOrderingDB;

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address TEXT
);

CREATE TABLE Restaurants (
    restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    location VARCHAR(100),
    rating DECIMAL(2,1)
);

CREATE TABLE Menu (
    menu_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT,
    item_name VARCHAR(100),
    price DECIMAL(10,2),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    order_date DATETIME,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    menu_id INT,
    quantity INT,
    subtotal DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (menu_id) REFERENCES Menu(menu_id)
);


