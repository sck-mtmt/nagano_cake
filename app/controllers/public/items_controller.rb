class Public::ItemsController < ApplicationController
  def index
    @items=Item.page(params[:page]).order(created_at: "DESC")
  end
  def show
    @item= Item.find(params[:id])
    @cart_item=CartItem.new
  end

private
  def item_params
   params.require(:item).permit(:name, :instroduction, :price, :image, :genre_id)
  end
end