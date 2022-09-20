class Admin::ItemsController < ApplicationController

  def create
    @item=Item.new
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
end
