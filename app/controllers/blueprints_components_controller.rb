class BlueprintsComponentsController < ApplicationController
  before_filter :get_blueprint
  def new
    @blueprint_component = @blueprint.blueprints_components.build
  end

  def create
    @blueprint_component = BlueprintsComponent.new(params.require(:blueprints_component).permit(:component_id, :quantity))
    @blueprint.blueprints_components << @blueprint_component
    if @blueprint.save
      flash[:notice] = "Component added"
      redirect_to edit_blueprint_path(@blueprint)
      flash[:error] = "Unable to add component"
    end
  end

  def get_blueprint
    @blueprint = Blueprint.find(blueprint_id_param)
  end

  private

  def blueprint_id_param
    params.require(:blueprint_id)
  end

end