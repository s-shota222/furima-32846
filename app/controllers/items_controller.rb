class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :get_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :sold_item, only: [:edit, :destroy, :update]

  def index
    @items = Item.order('created_at DESC')
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

  def show
    
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    　redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :name, :information, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :days_to_ship_id, :price
    ).merge(user_id: current_user.id)
  end

  def get_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless current_user.id == @item.user.id
  end

  def sold_item
    redirect_to root_path if @item.order.id
  end
end
