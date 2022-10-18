class Public::HomesController < ApplicationController
  def top
    @order_details=OrderDetail.all
  end

  def about
  end
end
