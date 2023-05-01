require_relative '../lib/shop_item'

class ShopItemRepository

  def all
    sql = 'SELECT id, item_name, unit_price, item_quantity FROM shop_items;'
    result_set = DatabaseConnection.exec_params(sql, [])

    shop_items = []

    result_set.each do |record|
      shop_item = ShopItem.new

      shop_item.id = record['id'].to_i
      shop_item.item_name = record['item_name']
      shop_item.unit_price = record['unit_price'].to_i
      shop_item.item_quantity = record['item_quantity'].to_i

      shop_items << shop_item
    end
    return shop_items
  end
  
  def create(item)
    sql = 'INSERT INTO shop_items (item_name, unit_price, item_quantity) VALUES($1, $2, $3)'
    sql_params = [item.item_name, item.unit_price, item.item_quantity]
    record = DatabaseConnection.exec_params(sql, sql_params)

    return nil
  end

end