Rails.application.routes.draw do
  devise_for :risers
  get 'reviews/new'

root to: "pages#home"

 resources :homelesses, exclude: [:destroy] do
  resources :reviews, only: [:new, :create, :index, :update]
  resources :photos, only: [:new, :create, :update]
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
