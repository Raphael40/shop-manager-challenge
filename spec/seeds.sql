-- Create the table without the foreign key first.
CREATE TABLE shop_items (
  id SERIAL PRIMARY KEY,
  item_name text,
  unit_price int,
  item_quantity int
);

-- Then the table with the foreign key first.
CREATE TABLE list_of_orders (
  id SERIAL PRIMARY KEY,
  order_name text,
  order_date text,
-- The foreign key name is always {shop_item}_id
  shop_item_id int,
  constraint fk_shop_item foreign key(shop_item_id)
    references shop_items(id)
    on delete cascade
);