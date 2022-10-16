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
    @order=Order.new(@order_params)
    @order.save
    redirect_to public_orders_confirm_path
  end

  def index
    @orders=Order.all
  end

  def show
    @order=Order.find(params[:id])
  end
  private
  def order_params
      params.require(:order).permit(:customer_id, :postal_code, :address, :name,
                          :shipping_cost, :total_paymont, :payment_method, :status)
  end
end
