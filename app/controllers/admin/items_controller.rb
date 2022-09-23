class Admin::ItemsController < ApplicationController

  def create
    @item=Item.new(item_params)
    @item.genre.id=current_genre.id
    @item.save
    redirect_to admin_items_path
  end

  def new
    @item=Item.new
  end
  def index
  end

  def show
  end

  def edit
  end
  def update
  end

  private
  def item_params
   params.require(:item).permit(:name, :introduction, :price, :is_active)
  end
end
