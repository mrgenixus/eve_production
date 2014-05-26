EveProduction::Application.routes.draw do
  resources :build_plans do
    resources :planned_items, shallow: true
    resources :plan_inventory_items, shallow: true
  end

  resources :produceables do
    resources :produceable_components, shallow: true
  end

  resources :produceable_bulk_entries

  root to: "build_plans#index"
end
