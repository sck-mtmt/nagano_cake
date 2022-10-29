class Public::ItemsController < ApplicationController
  def index
    @items=Item.order(created_at: "DESC").page(params[:page])
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