# Two Tables (Many-to-Many) Design Recipe Template

_Copy this recipe template to design and create two related database tables having a Many-to-Many relationship._

## 1. Extract nouns from the user stories or specification

```
As a shop manager
So I can know which items I have in stock

I want to keep a list of my shop items with their name and unit price.

I want to know which quantity (a number) I have for each item.

I want to be able to create a new item.

I want to keep a list of orders with their customer name.

I want to assign each order to their corresponding item.

I want to know on which date an order was placed. 

I want to be able to create a new order.
```

```
Nouns:

shop_item, item_name, unit_price, item_quantity
create_item
list_of_orders, order_name, item_id, order_date, 
create_order
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------  |
| shop_item             | item_name, unit_price, item_quantity
| list_of_orders        | order_name, shop_item_id, order_date

1# Two Tables Design Recipe Template

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```
# EXAMPLE:

Table: shop_items
id: SERIAL
item_name: text
unit_price: int
item_quantity: int

Table: list_of_orders
id: SERIAL
order_name: text
order_date: int
shop_item_id: int
```

## 4. Decide on The Tables Relationship

Most of the time, you'll be using a **one-to-many** relationship, and will need a **foreign key** on one of the two tables.

To decide on which one, answer these two questions:

1. Can one [shop_items] have many [list_of_orders]? (No)
2. Can one [list_of_orders] have many [shop_items]? (Yes)

## 4. Write the SQL.

```sql
-- EXAMPLE
-- file: shop_items_table.sql

-- Replace the table name, columm names and types.

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
  order_date int,
-- The foreign key name is always {shop_item}_id
  shop_item_id int,
  constraint fk_shop_item foreign key(shop_item_id)
    references shop_items(id)
    on delete cascade
);

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 _name < shop_items_table.sql
```

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Ftwo_table_design_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Ftwo_table_design_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Ftwo_table_design_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Ftwo_table_design_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Ftwo_table_design_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->