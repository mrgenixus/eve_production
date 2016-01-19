class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new create_item_params

    if @item.save
      redirect_to :items, notice: "Created #{@item.name} successfully"
    else
      flash[:error] = @item.errors.full_messages.to_sentence
      render :new
    end
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])

    item.destroy
    redirect_to :items, notice: "Deleted #{item.name} successfully"
  end

  def update
    item = Item.find(params[:id])
    item.attributes = update_item_params

    if item.save
      respond_to do |format|
        format.js { render json: { success: true, item: item }, content_type: 'application/json' }
      end
    else
      respond_to do |format|
        format.js { render json: { success: false, errors: item.errors } }
      end
    end
  end

  def list_update
    update = Item.update(list_update_params[:ids], list_update_params[:fields])

    if update
      respond_to do |format|
        format.json { render json: { success: true, items: Item.where(id: params[:items].map {|item| item[:id] }) } }
      end
    else
      respond_to do |format|
        format.json { render json: { success: false, errors: item.errors } }
      end
    end
  end

  private

  def create_item_params
    params.require(:item).permit(:name)
  end

  def update_item_params
    params.require(:item).permit(:price)
  end

  def list_update_params
    {
      ids: params.require(:items).map {|item| item.permit(:id)[:id] },
      fields: params.require(:items).map {|item| item.permit(:price) }
    }
  end
end
