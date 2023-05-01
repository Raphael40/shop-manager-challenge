require_relative '../app_shop_manager'

def reset_list_of_orders_table
  seed_sql = File.read('./spec/seeds_list_of_orders.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'shop_manager_test' })
  connection.exec(seed_sql)
end

RSpec.describe Application do

  before(:each) do
    reset_list_of_orders_table
  end

  it 'prints a list of the shop orders' do
    io = double :io
    expect(io).to receive(:puts).with("Welcome to the shop management program! \n What do you want to do? \n What do you want to do? \n 1 = list all shop items \n 2 = create a new item \n 3 = list all orders \n 4 = create a new order").ordered
    expect(io).to receive(:gets).and_return('1').ordered
    expect(io).to receive(:puts).with("Here\'s a list of all shop items:").ordered
    expect(io).to receive(:puts).with("#1 Super Shark Vacuum Cleaner - Unit price: 99 - Quantity: 30").ordered
    expect(io).to receive(:puts).with("#2 Makerspresso Coffee Machine - Unit price: 69 - Quantity: 50").ordered


    application = Application.new(
      'shop_manager_test', 
      io, 
      ListOfOrderRepository.new, 
      ShopItemRepository.new
    )
    
    application.run
  end
end