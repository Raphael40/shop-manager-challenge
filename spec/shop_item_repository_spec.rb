require 'shop_item_repository'

def reset_shop_items_table
  seed_sql = File.read('spec/seeds_shop_items.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'shop_manager_test' })
  connection.exec(seed_sql)
end

describe ShopItemRepository do
  before(:each) do 
    reset_shop_items_table
  end

  it 'Gets all shop items' do
    repo = ShopItemRepository.new

    shop_items = repo.all

    expect(shop_items.length).to eq 2

    expect(shop_items[0].id).to eq 1
    expect(shop_items[0].item_name).to eq 'Super Shark Vacuum Cleaner'
    expect(shop_items[0].unit_price).to eq 99
    expect(shop_items[0].item_quantity).to eq 30

    expect(shop_items[1].id).to eq 2
    expect(shop_items[1].item_name).to eq 'Makerspresso Coffee Machine'
    expect(shop_items[1].unit_price).to eq 69
    expect(shop_items[1].item_quantity).to eq 50
  end

  it 'Creates a new item' do
    repo = ShopItemRepository.new

    new_item = ShopItem.new
    new_item.item_name = 'Super Duper spoon'
    new_item.unit_price = 420
    new_item.item_quantity = 666

    repo.create(new_item)

    expect(repo.all.length).to eq 3
  end
end