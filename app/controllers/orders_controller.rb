class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    Order.create(order_params)
    ShippingAddress.create(shipping_address_params)
  end

  private
  def order_params
    params.merge(item_id: item.id, user_id: current_user.id)
  end

  def shipping_address_params
    params.permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(order_id: order.id)
  end
end
