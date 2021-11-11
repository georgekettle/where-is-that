require 'sidekiq/web'

Rails.application.routes.draw do
  get 'pins/home'
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end


  devise_for :users
  authenticated do
    root to: 'pins#home', as: :authenticated_root
  end
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
