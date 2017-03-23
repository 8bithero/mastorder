# DATA
# ================
PRODUCTS = [
  {
    uuid: SecureRandom.uuid,
    name: Faker::Zelda.unique.game,
    description: Faker::RickAndMorty.unique.quote,
    price_pennies: Faker::Number.between(1, 10000),
  },
  {
    uuid: SecureRandom.uuid,
    name: Faker::Zelda.unique.game,
    description: Faker::RickAndMorty.unique.quote,
    price_pennies: Faker::Number.between(1, 10000),
  },
  {
    uuid: SecureRandom.uuid,
    name: Faker::Zelda.unique.game,
    description: Faker::RickAndMorty.unique.quote,
    price_pennies: Faker::Number.between(1, 10000),
  },
  {
    uuid: SecureRandom.uuid,
    name: Faker::Zelda.unique.game,
    description: Faker::RickAndMorty.unique.quote,
    price_pennies: Faker::Number.between(1, 10000),
  },
]

# HELPERS
# ================
def build_basket_entries
  Product.all.reduce([]) do |basket, product|
    basket << {
      product_id: product.id,
      quantity: Faker::Number.between(1, 4),
      at_sale_price: product.price
    }
  end
end

# PRODUCTS
# ================
puts "BUILDING PRODUCTS..."
PRODUCTS.each do |data|
  product = Product.create(data)
  puts "   #{product.name}"
end

# ORDERS
# ================
puts "\nBUILDING ORDERS..."
basket_entries = build_basket_entries
3.times do
  order = Order.new(created_at: Faker::Date.between(1.month.ago, Date.today))
  current_basket = basket_entries.sample(rand(1..basket_entries.count))
  order.build_order_products_from_basket(current_basket)
  order.save!
  puts "   Order ##{order.id} created"
end
