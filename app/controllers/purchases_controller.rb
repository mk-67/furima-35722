class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :maeken_params
  before_action :kosuke_params

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      pay_product
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def maeken_params
    @product = Product.find(params[:product_id])
  end

  def kosuke_params
    if current_user.id == @product.user.id || @product.purchase
      redirect_to root_path
    end
  end

  def purchase_address_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: Product.find(purchase_address_params[:product_id]).price, 
        card: purchase_address_params[:token], 
        currency: 'jpy'
      )
  end
end
