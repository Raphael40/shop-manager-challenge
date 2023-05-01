require_relative 'list_of_order'

class ListOfOrderRepository

  # Selecting all records
  # No arguments
  def all
    sql = 'SELECT id, order_name, order_date, shop_item_id FROM list_of_orders;'
    result_set = DatabaseConnection.exec_params(sql, [])

    list_of_orders = []

    result_set.each do |record|
      list_of_order = ListOfOrder.new

      list_of_order.id = record['id'].to_i
      list_of_order.order_name = record['order_name']
      list_of_order.order_date = record['order_date']
      list_of_order.shop_item_id = record['shop_item_id'].to_i

      list_of_orders << list_of_order
    end
    return list_of_orders
  end
  
  def create(order)
    sql = 'INSERT INTO list_of_orders (order_name, order_date, shop_item_id) VALUES($1, $2, $3)'
    sql_params = [order.order_name, order.order_date, order.shop_item_id]
    record = DatabaseConnection.exec_params(sql, sql_params)

    return nil
  end

end