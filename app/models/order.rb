class Order < ApplicationRecord
  has_many :order_products
  has_many :products, through: :order_products

  def date
    created_at.strftime("%F")
  end

  def total_amount
    order_products.map(&:at_sale_price_total).reduce(:+)
  end

  def build_order_products_from_basket(basket_products)
    basket_products.reduce([]) do |list, entry|
      list << order_products.new(entry)
    end
  end
end
