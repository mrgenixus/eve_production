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

  def edit
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @product }
    end
  end

  def create
  	@product = Product.new(params[:product])

    if @product.save
    	redirect_to products_path, :flash => { :notice => "Product Created" }
    else
      error_fields = @product.errors.keys.join(", ")
      msg = 'Invalid Product'
      msg += " (#{error_fields})" unless error_fields.blank?
      flash[:error] = msg
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.save(params[:product])
      redirect_to products_path, :flash => { :notice => "Product Saved" }
    else
      error_fields = error_fields = @product.errors.keys.join(", ")
      msg = 'Invalid Product'
      msg += " (#{error_fields})" unless error_fields.blank?
      flash[:error] = msg
      render :edit
    end
  end

  def index
  	@products = Product.order(:name)

    respond_to do |format|
      format.html #index.html.erb
      format.json { render json: @products}
    end
  end
end
