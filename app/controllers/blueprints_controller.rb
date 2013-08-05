class BlueprintsController < ApplicationController

  def new
    @blueprint = Blueprint.new

    respond_to do |format|
      format.html # new.html.erb
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