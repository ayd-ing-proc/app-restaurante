class AccountsController < ApplicationController
  layout "application"
  def new
    @products = Product.all
    @account = Account.new
    @account.account_products.build
  end

  def create
    @account = Account.new
    account_products = account_params[:account_products_attributes]
    account_products.each do |key, value|
      if value[:quantity].to_i.positive?
        account_product = AccountProduct.new(product_id: value[:product_id], quantity: value[:quantity].to_i)
        @account.account_products << account_product
      end
    end
    
    return redirect_to new_account_path unless @account.account_products.any?
    
    if @account.save!
      respond_to do |format|
            format.html { render "create" }
            format.json { render json: { status: :ok, account: @account } }
          end
      else
        respond_to do |format|
            format.html { render "new" }
            format.json { render json: @account.errors, status: :unprocessable_entity }
          end
    end
  end

  def account_params
    params.require(:account).permit(:created_at, :updated_at, account_products_attributes: [:product_id, :quantity, :price])
  end
end