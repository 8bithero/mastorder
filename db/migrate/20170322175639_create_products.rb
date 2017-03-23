class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :uuid
      t.string :name
      t.text :description
      t.monetize :price

      t.timestamps
    end
  end
end
