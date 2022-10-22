class Admin::OrdersController < ApplicationController

  def show
    @order=Order.find(params[:id])
    @order_details=@order.order_details

  end
  def update
    @order_detail=OrderDetail.find(params[:id])
    @order_detail.update(@order_detail_params)
    redirect_to admin_orders_confirm_path
  end
  private
  def order_params
      params.require(:order).permit(:customer_id, :postal_code, :address, :name,
                          :shipping_cost, :total_paymont, :payment_method, :status)
  end
end
