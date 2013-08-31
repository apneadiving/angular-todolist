Toptal::Application.routes.draw do

  get 'home', to: 'home#index'

  devise_for :users

  root to: 'home#index'
end
