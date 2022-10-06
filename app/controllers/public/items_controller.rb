class Public::ItemsController < ApplicationController
  def index
    @items=Item.page(params[:page])
  end
  def show
    @item= Item.find(params[:id])
  end
end
private
  def item_params
   params.require(:item).permit(:name, :instroduction, :price, :image, :genre_id)
  end