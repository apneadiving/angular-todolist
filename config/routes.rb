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

  root to: 'home#index'

  get '*a', to: 'home#catch_all'
end

