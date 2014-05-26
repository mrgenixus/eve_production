class PlannedItemsController < ApplicationController
  before_filter :get_planned_item, only: [:edit, :destroy, :update]

  def create
    planned_item = PlannedItem.create planned_item_params
    redirect_to edit_build_plan_path(planned_item.build_plan_id)
  end

  def update

    if @planned_item.update_attributes planned_item_update_params
      redirect_to edit_build_plan_path(@planned_item.build_plan)
    else
      render :edit, errors: @planned_item.errors.full_sentences
    end
  end

  def destroy
    @planned_item.destroy
    redirect_to edit_build_plan_path(@planned_item.build_plan_id)
  end

  private

  def get_planned_item
    @planned_item = PlannedItem.find(params.require(:id))
  end

  def planned_item_params
    planned_item_update_params.merge build_plan_id: params.require(:build_plan_id)
  end

  def planned_item_update_params
    params.require(:planned_item).permit(:item_id, :qty)
  end
end
