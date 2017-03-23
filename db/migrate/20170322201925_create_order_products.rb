class CreateOrderProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :order_products do |t|
      t.references :order,       null: false
      t.references :product,     null: false
      t.monetize :at_sale_price, null: false
      t.integer :quantity,       null: false, default: 1

      t.timestamps
    end
  end
end
