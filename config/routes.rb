Toptal::Application.routes.draw do

  namespace :api do
    resources :tasks do
      member do
        put :reset
        put :complete
      end
    end
  end

  get 'home', to: 'home#index'

  devise_for :users

  root to: 'home#index'
end

