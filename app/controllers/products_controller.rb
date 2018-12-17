class ProductsController < ApplicationController

before_action :authenticate_user!, only: [:new, :create]

def index
	@products = Product.all
end

  def new
  	@product = Product.new
  end

  def create
  	@product = current_user.products.build(product_params)
  	if @product.save
  		redirect_to product_path(@product.id)
  	else
  		render 'new'
  	end
  end

  def show
  	@product = Product.find(params[:id])
  end


  private
  def product_params
  	params.require(:product).permit(:title, :description, :price, :user_id)
  end


end
