class Public::CartItemsController < ApplicationController
  def index
    @cart_items=CartItem.all.order(created_at: "DESC")
  end
  def create
    @cart_item=CartItem.new(cart_item_params)
    @cart_item.customer_id=current_customer.id
    if cart_item=current_customer.cart_items.find_by(item_id: @cart_item.item_id)
       new_amount = cart_item.amount + @cart_item.amount
       cart_item.update(amount:new_amount)
    else
      @cart_item.save
    end
      redirect_to public_cart_items_path
  end

  def update
    @cart_item=CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end
  def destroy
    @cart_item=CartItem.find(params[:id])
    @cart_item.customer_id=current_customer.id
    @cart_item.destroy
    redirect_to public_cart_items_path
  end
  def destroy_all
    @cart_items=CartItem.all
    @cart_items.destroy_all
    redirect_to public_cart_items_path
  end
private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end
end
