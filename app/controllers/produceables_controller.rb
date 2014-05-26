class ProduceablesController < ApplicationController
  before_filter :get_produceable, only: [:show, :edit, :update, :destroy]

  def index
    @produceables = Produceable.all
  end

  def new
    @produceable = Produceable.new
  end

  def create
    @produceable = Produceable.create produceable_params

    if @produceable
      redirect_to produceables_path
    else
      render :new, errors: @produceables.errors.full_sentences
    end
  end

  def update
    if @produceable.update_attributes produceable_params
      redirect_to produceable_path(@produceable)
    else
      render :edit, errors: @produceable.errors.full_sentences
    end
  end

  def destroy
    if @produceable.destroy
      redirect_to produceables_path
    else
      redirect_to produceables_path
    end
  end

  private

  def get_produceable
    @produceable = Produceable.find(params.require(:id))
  end

  def produceable_params
    params.require(:produceable).permit(:name, :value, :blueprint_cost, :type)
  end
end
