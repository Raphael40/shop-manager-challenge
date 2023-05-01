-- EXAMPLE
-- (file: spec/seeds_list_of_orders.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE list_of_orders RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO list_of_orders (order_name, order_date, shop_item_id) VALUES ('Mega Order', '1st of May', 1 );
INSERT INTO list_of_orders (order_name, order_date, shop_item_id) VALUES ('Ultimate Order', '3rd of January', 2 );