class Public::OrdersController < ApplicationController
  def new
    @order=Order.new(@order_params)
    @order.customer_id=current_customer.id
  end

  def confirm
    @order = Order.new(order_params)
    @addresses = current_customer.addresses
    if params[:order][:select_address]=="0"
      @order.customer_id=current_customer.id
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address]=="1"
      @order.postal_code = address.postal_code
      @order.address = address.address
      @order.name = address.last_name + address.first_name
    elsif params[:order][:select_address]=="2"
      @order.address_post_code = params[:order][:address_post_code]
      @order.address_address = params[:order][:address_address]
      @order.address_name = params[:order][:address_name]
    end
    @cart_items=current_customer.cart_items
    @order.shipping_cost=800
  end


  def compleate
  end

  def create

    @order=Order.new(order_params)
    @order.customer_id=current_customer.id
    @order.save!

    current_customer.cart_items.each do |cart_item|
      @order_details=OrderDetail.new
      @order_details.item_id=cart_item.item_id
      @order_details.amount=cart_item.amount
      @order_details.price=(cart_item.item.price * 1.1).floor
      @order_details.order_id=@order.id
      @order_details.save
    end
    current_customer.cart_items.destroy_all
    redirect_to public_orders_complete_path
  end

  def index
    @orders=Order.all
  end

  def show

  end

  private
  def order_params
      params.require(:order).permit(:customer_id, :postal_code, :address, :name,
                          :shipping_cost, :total_paymont, :payment_method, :status)
  end
end
