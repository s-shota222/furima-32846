class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :move_to_index, only: [:edit]
=
99999999999999999999999999999999999
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to item_path(@item.id)
    else
      render :edit
    end   
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :name, :information, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :days_to_ship_id, :price
    ).merge(user_id: current_user.id)
  end

  def move_to_index
    item = Item.find(params[:id])
    unless user_signed_in?
      redirect_to root_path
    else 
      unless current_user.id == item.user.id
       redirect_to root_path
      end
   end
  end
end
