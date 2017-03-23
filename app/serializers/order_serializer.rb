class OrderSerializer < ActiveModel::Serializer
  attributes :date
  attribute :total_amount do
    total = object.total_amount
    total.format( symbol: total.currency.to_s + ' ')
  end
  has_many :products do
    object.order_products.reduce([]) do |list, entry|
      list << {
        uuid: entry.product.uuid,
        name: entry.product.name,
        description: entry.product.description,
        price: entry.at_sale_price
                    .format( symbol: entry.at_sale_price.currency.to_s + ' '),
        quantity: entry.quantity
      }
    end
  end
end
