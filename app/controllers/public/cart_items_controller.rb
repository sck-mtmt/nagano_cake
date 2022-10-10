class Public::CartItemsController < ApplicationController
  def index
    @cart_items=Cart_item.all
  end

  def create
    @cart_item=Cart_item.find(params[:id])
    @cart_item.save
    redirect_to public_cart_items_path
  end

  def update
    @cart_items=Cart_item.find(params[:id])
    @cart_item.save
    redirect_to public_cart_items_path
  end

  def destroy
    @cart_items=Cart_item.find(params[:id])
    @cart_items.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    @cart_items=Cart_item.find(params[:id])
    @cart_items.destroy_all
    redirect_to public_cart_items_path
  end


    private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end

