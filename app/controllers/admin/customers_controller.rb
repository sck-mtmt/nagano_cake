class Admin::CustomersController < ApplicationController
  def index
      @customers=Customer.page(params[:page])
  end

  def show
    @customer= current_customer
  end

  def edit
    @customer= current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email,
                                     :encrypted_password, :postal_code, :address, :telephone_namber, :is_deleted)
  end
end
