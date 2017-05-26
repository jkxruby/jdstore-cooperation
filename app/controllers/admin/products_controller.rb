class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :index]
  before_action :admin_required
  layout 'admin'
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @categories = Category.all.map{ |c| [c.name, c.id]}
  end

  def create
    @product = Product.new(product_params)
    @product.category_id = params[:category_id]
    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all.map{ |c| [c.name, c.id]}
  end

  def update
    @product = Product.find(params[:id])
    @product.category_id = params[:category_id]
    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
      redirect_to admin_products_path
  end


  private

  def product_params
    params.require(:product).permit(:title, :category, :description, :quantity, :particulars, :price, :image, :category_id)
  end
end
