Toptal::Application.routes.draw do

  namespace :api do
    resources :tasks do
      member do
        put :reset
        put :complete
      end
    end
    get :check_status
  end

  scope '/api' do
    devise_for :users, controllers: { sessions: "api/sessions", registrations: "api/registrations" }
  end

# devise_for :users
  get 'home', to: 'home#index'

  root to: 'home#index'
end

