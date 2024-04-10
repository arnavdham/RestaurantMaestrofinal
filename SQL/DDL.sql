CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    username VARCHAR(50),
    password_hash VARCHAR(256),
    salary INT,
    gender ENUM('male','female','other')
);

CREATE TABLE waiter (
    employee_id int,
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);

CREATE TABLE cook (
    employee_id int,
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);

CREATE TABLE manager (
    employee_id int,
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);

CREATE TABLE delivery_boy (
    employee_id int,
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);

CREATE TABLE menu_item (
    item_name VARCHAR(50),
    item_id int PRIMARY KEY,
    price int,
    item_availability ENUM('no','yes'),
    item_description VARCHAR(200),
    item_type ENUM('veg','non-veg')
);

-- item type lite

CREATE TABLE order (
    order_id int PRIMARY KEY,
    bill_amount int,
    order_time DATETIME,
    completion_time DATETIME,
    order_status ENUM('active', 'completed'),
    discount int,
    order_type ENUM('dine in', 'delivery')
);

CREATE TABLE invoice (
    invoice_id int PRIMARY KEY,
    waiter_rating int,
    invoice_time DATETIME,
    mode_of_payment ENUM('cash','card','UPI')
);

CREATE TABLE customer_information (
    -- invoice_time DATETIME,
    invoice_id int,
    cfirst_name VARCHAR(50),
    clast_name VARCHAR(50),
    FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id)
);

CREATE TABLE resturant_table (
    table_number int PRIMARY KEY,
    res_first_name VARCHAR(50),
    res_last_name VARCHAR(50),
    res_phone_number int, -- CHECK (Value >999999999 AND Value < 10000000000)
    reservation_status ENUM('reserved', 'available')
);

CREATE TABLE cusine_cook (
    cusine_name VARCHAR(50) PRIMARY KEY,
    item_id int,
    employee_id int,
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
    FOREIGN KEY (item_id) REFERENCES menu_item(item_id)
);

CREATE TABLE ordered_item (
    order_id int,
    FOREIGN KEY (order_id) REFERENCES order(order_id),
    item_id int,
    FOREIGN KEY (item_id) REFERENCES menu_item(item_id),
    comment VARCHAR(500),
    quantity_ordered int,
    item_status ENUM('preparing', 'prepared', 'delivered')
);

CREATE TABLE order_invoice (
    order_id int,
    FOREIGN KEY (order_id) REFERENCES order(order_id),
    invoice_id int,
    FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id)
);

CREATE TABLE seated_at (
    order_id int,
    FOREIGN KEY (order_id) REFERENCES order(order_id),
    table_number int,
    FOREIGN KEY (table_number) REFERENCES resturant_table(table_number)
);

CREATE TABLE assign_to (
    table_number int,
    FOREIGN KEY (table_number) REFERENCES resturant_table(table_number),
    employee_id int,
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);