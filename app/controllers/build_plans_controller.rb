class BuildPlansController < ApplicationController
  before_filter :get_build_plan, only: [:edit, :show, :delete, :update]
  def index
    @build_plans = BuildPlan.page params[:page]
  end

  def edit
    render :show
  end

  def new
    redirect_to edit_build_plan_path(BuildPlan.create)
  end

  private

  def get_build_plan
    @build_plan = BuildPlan.find(params.require(:id), include: { planned_items: :product, plan_inventory_items: :component})
  end
end
