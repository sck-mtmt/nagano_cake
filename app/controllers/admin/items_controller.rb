class Admin::ItemsController < ApplicationController

  def create
    @item=Item.new(item_params)

    @item.save
    redirect_to admin_items_path
  end

  def new
    @item=Item.new


  end

  def index
    @items=Item.all

  end

  def show
  end

  def edit
  end

  def update
   @item = Item.find(params[:id])
  end

  private
  def item_params
   params.require(:item).permit(:name, :instroduction, :price, :is_active, :image, :genre_id)
  end
end
