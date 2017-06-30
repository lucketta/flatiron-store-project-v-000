class CartsController < ApplicationController

  def show
    @current_cart = Cart.find_by(id: params[:id])
  end

  def checkout
    @current_cart = Cart.find_by(id: params[:id])
    @current_cart.line_items.each do |line|
      temp_item = Item.find(line.item_id)
      temp_item.inventory -= line.quantity
      temp_item.save
    end
    @user = User.find(@current_cart.user_id)
    @user.current_cart_id = nil
    @user.save
    @current_cart.user_id = nil
    @current_cart.save
    redirect_to @current_cart
  end
end
