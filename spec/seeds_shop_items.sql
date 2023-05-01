-- EXAMPLE
-- (file: spec/seeds_shop_items.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE shop_items RESTART IDENTITY CASCADE; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO shop_items (item_name, unit_price, item_quantity) VALUES ('Super Shark Vacuum Cleaner', 99, 30 );
INSERT INTO shop_items (item_name, unit_price, item_quantity) VALUES ('Makerspresso Coffee Machine', 69, 50 );