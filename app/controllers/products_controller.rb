class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :maeda_params, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @product = Product.includes(:user).order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :category_id, :status_id, :shipping_burden_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def maeda_params
    @product = Product.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @product.user.id && !@product.purchase
      redirect_to action: :index
    end
  end
end
