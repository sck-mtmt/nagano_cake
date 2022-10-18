class Admin::OrdersController < ApplicationController

  def confirm
    @order= Order.find(params[:id])
    @order_detail.order.customer_id=current_customer.id
  end
  def update
  end
end
