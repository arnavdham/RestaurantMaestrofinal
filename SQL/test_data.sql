-- Test data for employee table
use restaurant_maestro;
INSERT INTO employee ( first_name, last_name, username, password_hash, salary, gender)
VALUES
('John', 'Doe', 'john_doe', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 30000, 'male'),
('Jane', 'Smith', 'jane_smith', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 35000, 'female'),
('Michael', 'Johnson', 'michael_johnson', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 32000, 'male'),
('Emily', 'Brown', 'emily_brown', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 34000, 'female');

-- Test data for waiter table
INSERT INTO waiter (employee_id) VALUES (1);

-- Test data for cook table
INSERT INTO cook (employee_id) VALUES (3);

-- Test data for manager table
INSERT INTO manager (employee_id) VALUES (2);

-- Test data for delivery_boy table
INSERT INTO delivery_boy (employee_id) VALUES (4);

-- Test data for menu_item table
INSERT INTO menu_item (item_name, price, item_availability, item_description, item_type)
VALUES
('Item 1', 10, 'yes', 'Description 1', 'veg'),
('Item 2', 12, 'yes', 'Description 2', 'non-veg'),
('Item 3', 15, 'yes', 'Description 3', 'veg'),
('Item 4', 18, 'yes', 'Description 4', 'non-veg');

-- Test data for restaurant_order table
INSERT INTO restaurant_order (order_id, bill_amount, order_time, completion_time, order_status, discount, order_type)
VALUES
(1, 50.00, '2024-04-10 12:00:00', '2024-04-10 13:00:00', 'completed', 0, 'dine in'),
(2, 40.00, '2024-04-10 13:30:00', NULL, 'active', 5, 'delivery');

-- Test data for invoice table
INSERT INTO invoice (waiter_rating, invoice_time, mode_of_payment)
VALUES
( 4, '2024-04-10 13:00:00', 'cash'),
( 5, '2024-04-09 12:00:00', 'card');

-- Test data for customer_information table
INSERT INTO customer_information (invoice_id, cfirst_name, clast_name)
VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith');

-- Test data for resturant_table table
INSERT INTO restaurant_table (res_first_name, res_last_name, res_phone_number, table_status)
VALUES
( 'John', 'Doe', 1234567890, 'reserved'),
(NULL, NULL, NULL, 'occupied'),
(NULL, NULL, NULL, 'available');

-- Test data for cusine_cook table
INSERT INTO cusine_cook (cusine_name, item_id, employee_id)
VALUES
('Cuisine 1', 1, 3),
('Cuisine 2', 2, 4);

-- Test data for ordered_item table
INSERT INTO ordered_item (order_id, item_id, comment, quantity_ordered, item_status)
VALUES
(1, 1, 'No onions', 2, 'served'),
(1, 2, 'Extra cheese', 1, 'served'),
(2, 3, 'Spicy', 3, 'preparing');

-- Test data for order_invoice table
INSERT INTO order_invoice (order_id, invoice_id)
VALUES
(1, 1),
(2, 2);

-- Test data for seated_at table
INSERT INTO seated_at (order_id, table_number)
VALUES
(1, 1),
(2, 2);

-- Test data for assign_to table
INSERT INTO assign_to (table_number, employee_id)
VALUES
(1, 1),
(2, 1),
(3, 1);
