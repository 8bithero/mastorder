FactoryGirl.define do
  factory :order do
    after(:build) do |order, evaluator|
      order.products = FactoryGirl.build_list(:product, 1)
      order.order_products.map do |op|
        op.at_sale_price = op.product.price
        op.quantity = 2
      end
    end
  end
end
