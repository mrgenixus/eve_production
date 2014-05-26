class ProduceableComponentsController < ApplicationController
  before_filter :get_produceable_component, only: [:edit, :update, :destroy]

  def create
    produceable_component = ProduceableComponent.create produceable_component_params
    redirect_to produceable_path(produceable_component.product_id)
  end

  def destroy
    @produceable_component.destroy
    redirect_to produceable_path(@produceable_component.product_id)
  end

  def update
    if @produceable_component.update_attributes produceable_component_update_params
      redirect_to @produceable_component.product
    else
      render :edit, errors: @produceable_component.errors.full_sentences
    end
  end

  private

  def get_produceable_component
    @produceable_component = ProduceableComponent.find(params.require(:id))
  end

  def produceable_component_params
    produceable_component_update_params.merge product_id: params.require(:produceable_id)
  end

  def produceable_component_update_params
    params.require(:produceable_component).permit(:component_id, :qty)
  end

end
