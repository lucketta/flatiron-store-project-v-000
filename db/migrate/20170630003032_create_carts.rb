class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :total_cart
    end
  end
end
