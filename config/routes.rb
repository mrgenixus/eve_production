Rails.application.routes.draw do
  root "items#index"

  resources :items, except: :edit do
    collection do
      patch :index, action: :list_update
    end
  end
end
