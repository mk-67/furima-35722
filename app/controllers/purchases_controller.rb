class PurchasesController < ApplicationController

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_address_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id], purchase_id: params[:purchase_id])
  end
end
