require 'sidekiq/web'

Rails.application.routes.draw do
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  get 'search', to: 'search#search', as: :search
  post 'location_search', to: 'search#location_search', as: :location_search
  resources :boards, only: :show
  resources :profiles, only: :show
  devise_for :users
  authenticated do
    root to: 'pins#home', as: :authenticated_root
  end
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
