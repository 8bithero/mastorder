class OrderProduct < ApplicationRecord
  monetize :at_sale_price_pennies

  belongs_to :order
  belongs_to :product

  def at_sale_price_total
    at_sale_price * quantity
  end
end
