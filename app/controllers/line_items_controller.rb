class LineItemsController < ApplicationController

  def create
    if !current_user.current_cart
      current_user.current_cart = current_user.carts.create
    end
    current_user.current_cart.add_item(params[:item_id]).save
    current_user.save
    redirect_to cart_path(current_user.current_cart)
  end
end
