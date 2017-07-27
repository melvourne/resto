require 'terminal-table'

class MenuItem
  attr_accessor :name, :price, :description

  def initialize(name, price, description)
    @name = name
    @price = price
    @description = description
  end
  
end

class Entrees < MenuItem
end

class Mains < MenuItem
end

class Desserts < MenuItem
end


class Drinks < MenuItem
end

class Order
  def initialize()
    @items = []
  end

  def << (menu_item)
    @items << menu_item
  end

  def total
    total = 0
    @items.each do |item|
      total += item.price
    end
    total
  end



  def bill
    table = Terminal::Table.new headings: ['Name', 'Options', 'Price'] do |t|
      @items.each do |item|
        t << [item.name, item.options, "$#{item.price}"]
      end
      t.add_separator
      t << ['TOTAL','', total]
    end
    table
  end
end


MENU_ITEMS = [
  Entrees.new('Spring Rolls', 5, 'Rolls Spring'),
  Entrees.new('Rice Paper Rolls', 5, 'Paper Rolls Rice' ), 
  Entrees.new('Chicken Feet', 5, 'Feet Chicken' ),
  Mains.new('Special Pho', 15, 'Pho soup'),
  Mains.new('Haianese Chicken', 15, 'Chicken in soy'),
  Mains.new('Roast Duck on Rice', 15, 'Duck with rice'),
  Desserts.new('Sticky Rice', 10, 'Rice with mango'),
  Desserts.new('Caramel Flan', 10, 'Leche Flan'),
  Desserts.new('Brownies', 10, 'Chocolatey'),
  Drinks.new('Martini', 8, 'Cocktails'),
  Drinks.new('Mojito', 8, 'Cocktails'),
  Drinks.new('Sour', 8, 'Cocktails'),
  Drinks.new('Margarita', 8, 'Cocktails'),
  Drinks.new('Negroni', 8, 'Cocktails'),
  Drinks.new('Cosmopolitan', 8, 'Cocktails')
  
]


def menu_option
  menu_option = gets.chomp
  system 'clear'
  case menu_option
    when "1"
      puts "Entrees list"
      puts "#{MENU_ITEMS[1].name}: #{MENU_ITEMS[1].price}: #{MENU_ITEMS[1].description}"
      puts "#{MENU_ITEMS[2].name}: #{MENU_ITEMS[2].price}: #{MENU_ITEMS[2].description}"
      puts "#{MENU_ITEMS[3].name}: #{MENU_ITEMS[3].price}: #{MENU_ITEMS[3].description}"
    when "2"
      puts "Mains list"
      puts "#{MENU_ITEMS[4].name}: #{MENU_ITEMS[4].price}: #{MENU_ITEMS[4].description}"
      puts "#{MENU_ITEMS[5].name}: #{MENU_ITEMS[5].price}: #{MENU_ITEMS[5].description}"
      puts "#{MENU_ITEMS[6].name}: #{MENU_ITEMS[6].price}: #{MENU_ITEMS[6].description}"
    when "3"
      puts "Desserts list"
      puts "#{MENU_ITEMS[7].name}: #{MENU_ITEMS[7].price}: #{MENU_ITEMS[7].description}"
      puts "#{MENU_ITEMS[8].name}: #{MENU_ITEMS[8].price}: #{MENU_ITEMS[8].description}"
      puts "#{MENU_ITEMS[9].name}: #{MENU_ITEMS[9].price}: #{MENU_ITEMS[9].description}"
    when "4"
      puts "Drinks list"
      puts "#{MENU_ITEMS[10].name}: #{MENU_ITEMS[10].price}: #{MENU_ITEMS[10].description}"
      puts "#{MENU_ITEMS[11].name}: #{MENU_ITEMS[11].price}: #{MENU_ITEMS[11].description}"
      puts "#{MENU_ITEMS[12].name}: #{MENU_ITEMS[12].price}: #{MENU_ITEMS[12].description}"
      puts "#{MENU_ITEMS[13].name}: #{MENU_ITEMS[13].price}: #{MENU_ITEMS[13].description}"
      puts "#{MENU_ITEMS[14].name}: #{MENU_ITEMS[14].price}: #{MENU_ITEMS[14].description}"
      puts "#{MENU_ITEMS[15].name}: #{MENU_ITEMS[15].price}: #{MENU_ITEMS[15].description}"
    when "5"
      main_menu([])
  end
end

def menu_options
  system 'clear'
  puts "Food Options"
  puts "1. Entrees"
  puts "2. Mains"
  puts "3. Desserts"
  puts "4. Drinks"
  puts "5. Back"

  menu_option

  puts "press enter to go back"
  choice = gets
  return food_menu if choice
end

# Show menu
def food_menu
  menu_options

  puts "press enter to go back"
  choice = gets
  return main_menu([]) if choice

end


def order_food

  MENU_ITEMS.each_with_index do |menu_item, index|
    user_index = index + 1
    # Display item with index first, then name and price
    puts "#{user_index}. #{menu_item.class} #{menu_item.name}: #{menu_item.price}"
  end

  order = Order.new

  loop do
    puts 'Please enter number of item you like to order? Just leave blank and press enter when finished.'
    choice = gets.chomp
    # Stop looping if user pressed just enter
    break if choice == ""

    # User must choose an index number
    user_index = choice.to_i

    # If the user entered in an invalid choice
    if user_index == 0
      puts "Invalid choice, please try again"
      next # Loop through and ask again
    end

    index = user_index - 1 # Convert to zero-based index
    menu_item = MENU_ITEMS[index]

    # Add item to order
    order << menu_item
  
    # Repeat order back
    puts "You have ordered the #{menu_item.name}."

    end
end


def ask_bill(order)
  puts 'Thank you'
  puts 'Here is your bill:'
  puts order.bill
end



def main_menu(order)


  system 'clear'
  loop do
    puts 'Select an option'
    puts '1. Menu'
    puts '2. Order'
    puts '3. Bill'
    puts '4. Exit'
    choice = gets.chomp
    case choice
        when '1'
          system 'clear'
          food_menu
        when '2'
          system 'clear'
          order_food
        when '3'
          system 'clear'
          ask_bill(order)
        when '4'
          break
        else
          puts "Invalid choice"
      end

      sleep 1
  end
end
order = []
main_menu(order)










