class PlanInventoryItemsController < ApplicationController
  before_filter :get_plan_inventory_item, only: [:show, :edit, :update, :destroy]

  def create
    plan_inventory_item = PlanInventoryItem.create plan_inventory_item_params
    redirect_to edit_build_plan_path(plan_inventory_item.build_plan_id)
  end

  def destroy
    @plan_inventory_item.destroy
    redirect_to edit_build_plan_path(@plan_inventory_item.build_plan_id)
  end

  private

  def get_plan_inventory_item
    @plan_inventory_item = PlanInventoryItem.find(params.require(:id))
  end

  def plan_inventory_item_params
    params.require(:plan_inventory_item).permit(:item_id, :qty).merge build_plan_id: params.require(:build_plan_id)
  end
end
