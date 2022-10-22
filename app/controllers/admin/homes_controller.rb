class Admin::HomesController < ApplicationController
  def top
    @order_details=OrderDetail.all.order(created_at: "DESC")
  end
end
