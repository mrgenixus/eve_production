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

  private

  def get_produceable_component
    @produceable_component = ProduceableComponent.find(params.require(:id))
  end

  def produceable_component_params
    params.require(:produceable_component).permit(:component_id, :qty).merge product_id: params.require(:produceable_id)
  end

end
