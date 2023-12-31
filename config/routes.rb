Rails.application.routes.draw do
  devise_for :users
  root "recipes#public"

  resources :recipes, only: [:index, :show, :new, :create, :update, :destroy] do
    resources :recipe_foods, only: [:new, :create, :edit, :update, :destroy]
  end

  get 'generate_shopping_list', to: 'shopping_lists#generate'
  resources :foods
end
