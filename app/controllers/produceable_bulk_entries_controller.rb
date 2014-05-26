class ProduceableBulkEntriesController < ProduceablesController
  def create
    @produceable = Produceable.create produceable_params

    if @produceable
      redirect_to @produceable
    else
      render :new, errors: @produceable.errors.full_sentences
    end
  end

end
