class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit, :create, :update]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :edit_item, only:[:edit, :update]

  def index
    @items = Item.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :status_id, :shipping_charges_id, :shipping_area_id, :shipping_date_id, :item_price, :item_image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
  def edit_item
    if @item.user.id != current_user.id
      redirect_to root_path
    end
  end

end
