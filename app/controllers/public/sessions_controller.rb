# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
   before_action :customer_state, only: [:create]

  def customer_state
    @customer = current_customer
    if @customer
      if @customer.valid_password?(params[:customer][:password]) && @customer.is_deleted
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_customer_session_path
      else
        flash[:notice] = "項目を入力してください"
      end
    end
  end

  protected
  def customer_state
    @customer=current_customer
    return if !@customer
    if @customer.valid_password?(params[:customer][:password])
    end
  end
end
