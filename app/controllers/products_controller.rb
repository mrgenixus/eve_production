class ProductsController < ApplicationController
  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  def create

  	redirect_to products_path

  end

  def index
  	@products = Product.order(:name);

  end
end
