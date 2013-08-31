Toptal::Application.routes.draw do

  namespace :api do
    resources :tasks
  end

  get 'home', to: 'home#index'

  devise_for :users

  root to: 'home#index'
end

