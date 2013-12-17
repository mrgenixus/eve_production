class BlueprintsController < ApplicationController

  def new
    @blueprint = Blueprint.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @blueprint }
    end
  end

  def edit
    @blueprint = Blueprint.find(params[:id])

    

    @components = @blueprint.blueprints_components.group_by(&:component_id)
    @components = @components.map do |id, components| 
      { name: components.first.component.name, quantity: components.reduce(0) { |p,c| p + c.quantity } }
    end

    respond_to do |format|
      format.html
      format.json { render json: @blueprint }
    end
  end

  def create
  	@blueprint = Blueprint.new(params[:blueprint])

  	if @blueprint.save
  	  redirect_to blueprints_path, :flash => { :notice => "Blueprint Created" }
  	else
  	  
  	  flash[:error] = "Invalid Blueprint"
  	  render :new
  	end
  end

  def index
  	@blueprints = Blueprint.order(:name)

  	respond_to do |format|
  	  format.html
  	  format.json { render json: @blueprints }
  	end
  end
end