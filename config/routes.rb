Rails.application.routes.draw do
  get 'reviews/new'

root to: "pages#home"

 resources :homelesses, exclude: [:destroy] do
  resources :reviews, only: [:new, :create, :index]
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
