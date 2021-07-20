class ItemsController < ApplicationController

  def index
  end
  
  def new
    @item = Item.new
    unless user_signed_in?
      authenticate_user!
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :status_id, :shipping_charges_id, :shipping_area_id, :shipping_date_id, :item_price, :item_image).merge(user_id: current_user.id)
  end

end
