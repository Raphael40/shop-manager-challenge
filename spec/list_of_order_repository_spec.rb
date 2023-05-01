require 'list_of_order_repository'

def reset_list_of_orders_table
  seed_sql = File.read('spec/seeds_list_of_orders.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'shop_manager_test' })
  connection.exec(seed_sql)
end

describe ListOfOrderRepository do
  before(:each) do 
    reset_list_of_orders_table
  end

  it 'Gets all lists of orders' do
    repo = ListOfOrderRepository.new

    list_of_orders = repo.all

    expect(list_of_orders.length).to eq 2
    expect(list_of_orders[0].id).to eq 1
    expect(list_of_orders[0].order_name).to eq 'Mega Order'
    expect(list_of_orders[0].order_date).to eq '1st of May'
    expect(list_of_orders[0].shop_item_id).to eq 1

    expect(list_of_orders[1].id).to eq 2
    expect(list_of_orders[1].order_name).to eq 'Ultimate Order'
    expect(list_of_orders[1].order_date).to eq '3rd of January'
    expect(list_of_orders[1].shop_item_id).to eq 2

  end

  it 'Creates a new item' do
    repo = ListOfOrderRepository.new

    new_order = ListOfOrder.new
    new_order.order_name = 'Mega Croc'
    new_order.order_date = '1st April'
    new_order.shop_item_id = 1

    repo.create(new_order)

    expect(repo.all.length).to eq 3
  end
end