Rails.application.routes.draw do

resources :donations, only: [:show, :new, :create]

  require "sidekiq/web"
  authenticate :riser, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

  mount ForestLiana::Engine => '/forest'
  devise_for :risers,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  scope '(:locale)', locale: /fr|es|en/ do
    get '/pages/our_story'
    get '/pages/join_us'
    get '/pages/donate'
    get '/pages/developers'
    get 'reviews/new'

    root to: "pages#home"

    resources :homelesses, exclude: [:destroy] do
      member do
        post "create_interest"
      end
      collection do
        get "search"
        get "retrieve"
      end
      resources :reviews, only: [:new, :create, :index, :update]
      resources :photos, only: [:new, :create, :update] do
        collection do
          get :sign_in
        end
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
