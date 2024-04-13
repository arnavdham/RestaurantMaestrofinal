-- Insert data for employees
INSERT INTO employee (first_name, last_name, username, password_hash, salary, gender) VALUES
('John', 'Doe', 'john_doe', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 30000, 'male'), -- Manager
('Alice', 'Smith', 'alice_smith', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 25000, 'female'), -- Waiter
('Bob', 'Johnson', 'bob_johnson', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 25000, 'male'), -- Waiter
('Charlie', 'Brown', 'charlie_brown', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 20000, 'male'), -- Cook
('Emma', 'Lee', 'emma_lee', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 20000, 'female'), -- Cook
('David', 'Williams', 'david_williams', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 20000, 'male'), -- Cook
('Olivia', 'Taylor', 'olivia_taylor', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 20000, 'female'), -- Cook
('Ethan', 'Anderson', 'ethan_anderson', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 20000, 'male'), -- Cook
('Sophia', 'Martinez', 'sophia_martinez', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 15000, 'female'); -- Delivery Boy

-- Insert data for waiters
INSERT INTO waiter (employee_id) VALUES
(2), -- Alice
(3); -- Bob

-- Insert data for cooks
INSERT INTO cook (employee_id) VALUES
(4), -- Charlie
(5), -- Emma
(6), -- David
(7), -- Olivia
(8); -- Ethan

-- Insert data for manager
INSERT INTO manager (employee_id) VALUES (1); -- John

-- Insert data for delivery boy
INSERT INTO delivery_boy (employee_id) VALUES (9); -- Sophia

-- Insert data for restaurant tables
INSERT INTO restaurant_table (res_first_name, res_last_name, res_phone_number, table_status) VALUES
(NULL, NULL, NULL, 'available'),
(NULL, NULL, NULL, 'available'),
(NULL, NULL, NULL, 'available'),
(NULL, NULL, NULL, 'available'),
(NULL, NULL, NULL, 'available'),
(NULL, NULL, NULL, 'available'),
(NULL, NULL, NULL, 'available'),
(NULL, NULL, NULL, 'available'),
(NULL, NULL, NULL, 'available'),
(NULL, NULL, NULL, 'available'),
(NULL, NULL, NULL, 'available'),
(NULL, NULL, NULL, 'available'),
(NULL, NULL, NULL, 'available'),
(NULL, NULL, NULL, 'available'),
(NULL, NULL, NULL, 'available'),
(NULL, NULL, NULL, 'available'),
(NULL, NULL, NULL, 'available'),
(NULL, NULL, NULL, 'available'),
(NULL, NULL, NULL, 'available'),
(NULL, NULL, NULL, 'available');

-- Insert data for cuisines and corresponding menu items

INSERT INTO menu_item (item_name, price, item_availability, item_description, item_type) VALUES
('Pizza', 10, 'yes', 'Cheese Pizza', 'veg'),
('Noodles', 8, 'yes', 'Hakka Noodles', 'veg'),
('Tacos', 12, 'yes', 'Beef Tacos', 'non-veg'),
('Curry', 9, 'yes', 'Chicken Curry', 'non-veg'),
('Burger', 7, 'yes', 'Beef Burger', 'non-veg'),
('Pasta', 11, 'yes', 'Spaghetti Pasta', 'veg'),
('Spring Rolls', 6, 'yes', 'Vegetable Spring Rolls', 'veg'),
('Burrito', 10, 'yes', 'Bean Burrito', 'veg'),
('Biryani', 13, 'yes', 'Chicken Biryani', 'non-veg'),
('Hot Dog', 5, 'yes', 'Classic Hot Dog', 'non-veg'),
('Lasagna', 12, 'yes', 'Meat Lasagna', 'non-veg'),
('Fried Rice', 9, 'yes', 'Chicken Fried Rice', 'non-veg'),
('Enchiladas', 11, 'yes', 'Chicken Enchiladas', 'non-veg'),
('Dosa', 8, 'yes', 'Masala Dosa', 'veg'),
('Sushi', 15, 'yes', 'California Roll', 'non-veg'),
('Quesadilla', 9, 'yes', 'Cheese Quesadilla', 'veg'),
('Chow Mein', 10, 'yes', 'Chicken Chow Mein', 'non-veg'),
('Paneer Tikka', 12, 'yes', 'Tandoori Paneer Tikka', 'veg'),
('Sub Sandwich', 7, 'yes', 'Turkey Sub Sandwich', 'non-veg'),
('Risotto', 13, 'yes', 'Mushroom Risotto', 'veg');

INSERT INTO cusine_cook (cusine_name, item_id, employee_id) VALUES
('Italian', 1, 4), -- Charlie
('Chinese', 2, 5), -- Emma
('Mexican', 3, 6), -- David
('Indian', 4, 7), -- Olivia
('American', 5, 8), -- Ethan
('Italian', 6, 4), -- Charlie
('Chinese', 7, 5), -- Emma
('Mexican', 8, 6), -- David
('Indian', 9, 7), -- Olivia
('American', 10, 8), -- Ethan
('Italian', 11, 4), -- Charlie
('Chinese', 12, 5), -- Emma
('Mexican', 13, 6), -- David
('Indian', 14, 7), -- Olivia
('American', 15, 8), -- Ethan
('Italian', 16, 4), -- Charlie
('Chinese', 17, 5), -- Emma
('Mexican', 18, 6), -- David
('Indian', 19, 7), -- Olivia
('American', 20, 8); -- Ethan

INSERT INTO assign_to (table_number, employee_id) VALUES
(1,2),
(2,2),
(3,2),
(4,2),
(5,2),
(6,2),
(7,2),
(8,2),
(9,2),
(10,2),
(11,3),
(12,3),
(13,3),
(14,3),
(15,3),
(16,3),
(17,3),
(18,3),
(19,3),
(20,3);