class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :name, :information, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :days_to_ship_id, :price
    ).merge(user_id: current_user.id)
  end
end
