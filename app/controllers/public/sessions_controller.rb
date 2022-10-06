# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
   before_action :customer_state, only: [:create]

  def customer_state
    @customer = current_customer
    if @customer
      if @customer.valid_password?(params[:customer][:password]) && !@customer.is_deleted
        redirect_to new_customer_session_path
      end
    end
  end

  protected
  def customer_state
    @customer=Customer.find_by(email: params[:customer][:email])
    return if !@customer
    if @customer.valid_password?(params[:customer][:password])
    end
  end
end
