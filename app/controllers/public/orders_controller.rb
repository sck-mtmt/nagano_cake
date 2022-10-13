class Public::OrdersController < ApplicationController
  def new
    @order=Order.new(@order_params)
    @order.customer_id=current_customer.id
  end

  def confirm
    @order = Order.new(@order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
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
