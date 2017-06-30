class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def total
    total_cart = 0
    self.items.each do |item|
      total_cart += item.price
    end
    total_cart
  end

  def add_item(new_item_id)
    if new_line = LineItem.find_by(item_id: new_item_id, cart_id: self.id)
      new_line.quantity += 1
      new_line
    else
      LineItem.new(item_id: new_item_id, cart_id: self.id, quantity: 1)
    end
  end
end
