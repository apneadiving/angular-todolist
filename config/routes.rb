Toptal::Application.routes.draw do
  devise_for :users

  root to: 'sessions#new'
end
