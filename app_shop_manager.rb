require_relative 'lib/database_connection'
require_relative './lib/list_of_order_repository'
require_relative './lib/shop_item_repository'

class Application

  # The Application class initializer
  # takes four arguments:
  #  * The database name to call `DatabaseConnection.connect`
  #  * the Kernel object as `io` (so we can mock the IO in our tests)
  #  * the AlbumRepository object (or a double of it)
  #  * the ArtistRepository object (or a double of it)
  def initialize(database_name, io, list_of_order_repository, shop_item_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @list_of_order_repository = list_of_order_repository
    @shop_item_repository = shop_item_repository
  end

  def run
    # "Runs" the terminal application
    # so it can ask the user to enter some input
    # and then decide to run the appropriate action
    # or behaviour.

    # Use `@io.puts` or `@io.gets` to
    # write output and ask for user input.
    @io.puts "Welcome to the shop management program! \n What do you want to do? \n What do you want to do? \n 1 = list all shop items \n 2 = create a new item \n 3 = list all orders \n 4 = create a new order"
    
    input = @io.gets.chomp

    if input = '1'
      @io.puts "Here\'s a list of all shop items:"
      @shop_item_repository.all.each_with_index { |item, i| @io.puts "##{i + 1} #{item.item_name} - Unit price: #{item.unit_price} - Quantity: #{item.item_quantity}"}
    end
  end
end

# Don't worry too much about this if statement. It is basically saying "only
# run the following code if this is the main file being run, instead of having
# been required or loaded by another file.
# If you want to learn more about __FILE__ and $0, see here: https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Variables_and_Constants#Pre-defined_Variables
if __FILE__ == $0
  app = Application.new(
    'music_library',
    Kernel,
    AlbumRepository.new,
    ArtistRepository.new
  )
  app.run
end