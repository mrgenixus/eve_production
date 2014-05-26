class BuildPlansController < ApplicationController
  before_filter :get_build_plan, only: [:edit, :show, :delete, :update]
  def index
    @build_plans = BuildPlan.page params[:page]
  end

  def new
    redirect_to edit_build_plan_path(BuildPlan.create)
  end

  private

  def get_build_plan
    @build_plan = BuildPlan.find(params.require(:id))
  end
end
